const mongoose = require('mongoose');
const fs = require('fs');
const path = require('path');
const User = require('../models/user');

// Load and parse hostel.json
const hostelDataPath = path.join(__dirname, '../src/hostel.json');
let validHostels = [];

fs.readFile(hostelDataPath, 'utf8', (err, data) => {
    if (err) {
        console.error('Error reading hostel.json file:', err);
        throw err; // Rethrow to stop application if config is critical
    }
    try {
        const parsedData = JSON.parse(data);
        validHostels = parsedData.map(item => item.name);
    } catch (parseErr) {
        console.error('Error parsing hostel.json file:', parseErr);
        throw parseErr; // Rethrow to stop application if config is critical
    }
});

// Load and parse messType.json
const messTypeDataPath = path.join(__dirname, '../src/messType.json');
let validMessTypes = [];

fs.readFile(messTypeDataPath, 'utf8', (err, data) => {
    if (err) {
        console.error('Error reading messType.json file:', err);
        throw err; // Rethrow to stop application if config is critical
    }
    try {
        const parsedData = JSON.parse(data);
        validMessTypes = parsedData.map(item => item.mess);
    } catch (parseErr) {
        console.error('Error parsing messType.json file:', parseErr);
        throw parseErr; // Rethrow to stop application if config is critical
    }
});

// PUT request to update the profile
module.exports.editProfile = async (req, res) => {
    const { username, name, mobile, email, isHosteler, hostel, messType, currentPassword, newPassword } = req.body;

    try {
        const user = await User.findOne({ username });

        if (!user) {
            return res.status(404).send('User not found');
        }

        // Verify current password
        user.authenticate(currentPassword, async (err, thisModel, passwordErr) => {
            if (passwordErr || err) {
                return res.status(400).send('Current password is incorrect');
            }

            // Update user details
            user.name = name !== undefined ? name : user.name;
            user.mobile = mobile !== undefined ? mobile : user.mobile;
            user.email = email !== undefined ? email : user.email;
            user.isHosteler = isHosteler !== undefined ? isHosteler : user.isHosteler;

            // If the user is no longer a hosteler, clear hostel-related information
            if (user.isHosteler === false) {
                user.hostel = undefined;
                user.messType = undefined;
            } else {

                // Handle hostel field separately
                if (user.hostel === undefined) {
                    return res.status(400).send('Hostel must be provided if isHosteler is true');
                }
                if (!validHostels.includes(hostel)) {
                    return res.status(400).send('Invalid hostel value');
                }
                user.hostel = hostel;
                
                // Handle messType field separately
                if (user.messType !== undefined) {
                    if (!validMessTypes.includes(messType)) {
                        return res.status(400).send('Invalid messType value');
                    }
                    user.messType = messType;
                } else {
                    return res.status(400).send('MessType must be provided if isHosteler is true');
                }
            }


            // Change password if newPassword is provided
            if (newPassword) {
                await user.setPassword(newPassword);
            }

            await user.save();
            res.status(200).send('Profile updated successfully');
        });
    } catch (err) {
        console.error(err);
        res.status(500).send('Server Error');
    }
};

// Update likedFoods
module.exports.likedFoods = async (user, likedFoods, res) => {
    try {
        const likedFoodsArray = likedFoods.split(',').map(id => mongoose.Types.ObjectId(id.trim()));
        user.likedFoods = user.likedFoods.filter(foodId => likedFoodsArray.includes(foodId));
        likedFoodsArray.forEach(foodId => {
            if (!user.likedFoods.includes(foodId)) {
                user.likedFoods.push(foodId);
            }
        });
    } catch (err) {
        res.status(400).send('Invalid likedFoods format');
    }
};


// DELETE request to delete the profile
module.exports.deleteProfile = async (req, res) => {
    const { username, currentPassword } = req.body;

    try {
        const user = await User.findOne({ username });

        if (!user) {
            return res.status(404).send('User not found');
        }

        // Verify current password
        user.authenticate(currentPassword, async (err, thisModel, passwordErr) => {
            if (passwordErr || err) {
                return res.status(400).send('Current password is incorrect');
            }

            req.logout((err) => {
                if (err) {
                    return next(err);
                }
                res.status(200).send('Profile deleted successfully');
            });

            await User.deleteOne({ _id: user._id });

        });
    } catch (err) {
        console.error(err);
        res.status(500).send('Server Error');
    }
};
