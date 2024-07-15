const mongoose = require('mongoose');
const passportLocalMongoose = require('passport-local-mongoose');

const userSchema = new mongoose.Schema({
    email: {
        type: String,
        required: true,
    },
    mobile: { 
        type: String, 
        required: true 
    },
    regNo: { 
        type: String, 
        required: true, 
        unique: true 
    },
    hosteler: { 
        type: Boolean, 
        required: true 
    },
    hostel: { 
        type: String 
    },
    messType: { 
        type: String 
    },
    likedFoods: [{ 
        type: mongoose.Schema.Types.ObjectId,
        ref: "Retaurant",
    }],
    cart: [{ 
        type: mongoose.Schema.Types.ObjectId,
        ref: "Order",
    }]
});

userSchema.plugin(passportLocalMongoose);

module.exports = mongoose.model('User', userSchema);