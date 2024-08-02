const User = require('../models/user'); // Adjust the path as needed

// POST request to update the profile
exports.putEditProfile = async (req, res) => {
    const { username, email, isHosteler, hostel, roomNo, messType, likedFoods, currentPassword, newPassword } = req.body;

    try {
        const user = await User.findOne({ username });

        if (!user) {
            return res.status(404).send('User not found');
        }

        user.email = email !== undefined ? email : user.email;
        user.isHosteler = isHosteler !== undefined ? isHosteler : user.isHosteler;
        user.hostel = hostel !== undefined ? hostel : user.hostel;
        user.roomNo = roomNo !== undefined ? roomNo : user.roomNo;
        user.messType = messType !== undefined ? messType : user.messType;
        if (likedFoods !== undefined) {
            const likedFoodsArray = likedFoods.split(',').map(id => mongoose.Types.ObjectId(id.trim()));
            
            // Remove food items not in the new list
            user.likedFoods = user.likedFoods.filter(foodId => likedFoodsArray.includes(foodId));

        }

        // If updating password, validate current password first
        if (currentPassword && newPassword) {
            user.authenticate(currentPassword, async (err, thisModel, passwordErr) => {
                if (passwordErr) {
                    return res.status(400).send('Current password is incorrect');
                }
                await user.setPassword(newPassword);
                await user.save(); // Adjust the redirect path as needed
            });
        }

        await user.save();
    } catch (err) {
        console.error(err);
        res.status(500).send('Server Error');
    }
};
