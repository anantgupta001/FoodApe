const mongoose = require('mongoose');
const Schema = mongoose.Schema;

const FoodSchema = new Schema({
  name: { type: String, required: true },
  description: { type: String, required: true },
  rating: { type: Number, default: 0, min: 0, max: 5 },
  price: { type: Number, required: true },
  numberOfRatings: { type: Number, default: 0 },
  available: { type: Boolean, default: true },
  restaurantName: { type: String, required: true },
  blockName: { type: String, required: true, enum: ["AB-1", "AB-2", "CB", "Food Street", "Rock Plaza", "Maggi Point"] }
});

const Food = mongoose.model('Food', FoodSchema);
module.exports = Food;
