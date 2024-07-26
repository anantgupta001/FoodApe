const mongoose = require('mongoose');
require('mongoose-type-email');
const passportLocalMongoose = require("passport-local-mongoose");

const userSchema = new mongoose.Schema({
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
    },
    roomNo: {
        type: String,
    },
    messType: { 
        type: String, 
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
