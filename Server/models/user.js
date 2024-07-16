const mongoose = require('mongoose');
require('mongoose-type-email');

const userSchema = new mongoose.Schema({
    email: {
        work: {
            type: mongoose.SchemaTypes.Email,
            required: true,
        }
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
    roomNo: {
        type: String,
    },
    messType: { 
        type: String 
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

module.exports = mongoose.model('User', userSchema);
