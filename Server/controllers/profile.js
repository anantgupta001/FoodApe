const mongoose = require('mongoose');
const User = require('../models/user');
const { getValidHostels, getValidMessTypes } = require('../init/dataLoader');


// PUT request to update the profile
module.exports.editProfile = async (req, res) => {
    const { username, name, mobile, email, isHosteler, hostel, messType, currentPassword, newPassword } = req.body;

    console.log('Request Body:', req.body); // Log the entire request body
    console.log('Hostel:', hostel); // Log the hostel value
    console.log('isHosteler:', isHosteler); // Log the isHosteler value

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
                const validHostels = await getValidHostels();
                const validMessTypes = await getValidMessTypes();
                // Handle hostel field separately
                if (hostel === undefined) {
                    return res.status(400).send('Hostel must be provided if isHosteler is true');
                }
                if (!validHostels.includes(hostel)) {
                    return res.status(400).send('Invalid hostel value');
                }
                user.hostel = hostel;
                // Handle messType field separately
                if (messType !== undefined) {
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
module.exports.removeLikedFoods = async (req, res) => {
    try {
        const userId = req.user._id;
        const { likedFoods } = req.body;

        if (!likedFoods) {
            return res.status(400).send('No food item specified for removal');
        }

        // Find the user by ID
        const user = await User.findById(userId);

        if (!user) {
            return res.status(404).send('User not found');
        }

        // Remove the specified food from likedFoods array
        user.likedFoods = user.likedFoods.filter(food => food.toString() !== likedFoods);

        await user.save();

        res.status(200).send('Liked food removed successfully');
    } catch (err) {
        console.error(err);
        res.status(500).send('Error removing liked food');
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
