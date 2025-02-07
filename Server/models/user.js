const mongoose = require('mongoose');
require('mongoose-type-email');
const passportLocalMongoose = require("passport-local-mongoose");

const userSchema = new mongoose.Schema({
    name: {
        type: String,
        required: true,
    },
    username: {
        type: String,
        required: true,
        unique: true,  // Ensure that username is unique
    },
    image: { 
        type: String, 
        default: "https://cdn-icons-png.freepik.com/512/14024/14024673.png?ga=GA1.1.136595828.1716999341", 
    },
    mobile: {
        type: String,
        required: true,
    },
    email: {
        type: mongoose.Schema.Types.Email,
        required: true,
    },
    isHosteler: { 
        type: Boolean, 
        required: true,
    },
    hostel: { 
        type: String, 
        enum: ["MH-1", "MH-2", "MH-3", "MH-4", "MH-5", "LH-1", "LH-2",]
    },
    messType: { 
        type: String, 
        enum : ["Veg", "Non-Veg", "Special"]
    },
    likedFoods: [{ 
        type: mongoose.Schema.Types.ObjectId,
        ref: "foods",
    }],
    cart: [{ 
        type: mongoose.Schema.Types.ObjectId,
        ref: "Order",
    }]
});

userSchema.plugin(passportLocalMongoose);

module.exports = mongoose.model('User', userSchema);
