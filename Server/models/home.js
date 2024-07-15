const mongoose = require("mongoose");

const RestaurantSchema = new mongoose.Schema({
    name: String,
    rating: Number,
    menu: [
        {
            food: String,
            price: Number
        }
    ]
});

module.exports = mongoose.model("Restaurant", RestaurantSchema);
