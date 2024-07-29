const mongoose = require('mongoose');
require('mongoose-type-email');
const passportLocalMongoose = require("passport-local-mongoose");

const userSchema = new mongoose.Schema({
    name: {
        type: String,
        required: true,
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
        ref: "Restaurant",
    }],
    cart: [{ 
        type: mongoose.Schema.Types.ObjectId,
        ref: "Order",
    }]
});

userSchema.plugin(passportLocalMongoose);

module.exports = mongoose.model('user', userSchema);
