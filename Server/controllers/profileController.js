const mongoose = require('mongoose');
const User = require('../models/user');

// PUT request to update the profile
module.exports.editProfile = async (req, res) => {
    const { username, email, isHosteler, hostel, roomNo, messType, likedFoods, currentPassword, newPassword } = req.body;

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
            user.email = email !== undefined ? email : user.email;
            user.isHosteler = isHosteler !== undefined ? isHosteler : user.isHosteler;
            
            user.isHosteler === false 
            ? (user.hostel = undefined, user.roomNo = undefined, user.messType = undefined)
            : (user.hostel = hostel !== undefined ? hostel : user.hostel,
            user.roomNo = roomNo !== undefined ? roomNo : user.roomNo,
            user.messType = messType !== undefined ? messType : user.messType);


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
            
        });
    } catch (err) {
        console.error(err);
        res.status(500).send('Server Error');
    }
};

// DELETE request to delete the profile
module.exports.deleteProfile = async (req, res) => {
    const { username, currentPassword } = req.body;
 // Assuming username is stored in req.user by passport.js

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

            await User.deleteOne({ _id: user._id });

            req.logout((err) => {
                if (err) {
                    return next(err);
                }
                
            });
        });
    } catch (err) {
        console.error(err);
        res.status(500).send('Server Error');
    }
};


