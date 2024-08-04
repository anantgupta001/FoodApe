const mongoose = require('mongoose');
const User = require('../models/user');

// PUT request to update the profile
module.exports.editProfile = async (req, res) => {
    const { username, name, mobile, email, isHosteler, hostel, messType, likedFoods, currentPassword, newPassword } = req.body;

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
                user.hostel = hostel !== undefined ? hostel : user.hostel;
                user.messType = messType !== undefined ? messType : user.messType;
            }

            if (likedFoods !== undefined) {
                const likedFoodsArray = likedFoods.split(',').map(id => mongoose.Types.ObjectId(id.trim()));
                user.likedFoods = user.likedFoods.filter(foodId => likedFoodsArray.includes(foodId));
                likedFoodsArray.forEach(foodId => {
                    if (!user.likedFoods.includes(foodId)) {
                        user.likedFoods.push(foodId);
                    }
                });
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
