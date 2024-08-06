const mongoose = require('mongoose');
const Schema = mongoose.Schema;

const FoodSchema = new Schema({
  name: { type: String, required: true },
  description: { type: String, required: true },
  rating: { type: Number, default: 0, min: 0, max: 5 },
  price: { type: Number, required: true },
  restaurant: { type: String, required: true },
  image: { type: String, default: "https://img.freepik.com/premium-vector/modern-design-concept-no-image-found-design_637684-247.jpg?w=826" },
  block: { type: String, required: true },
  numberOfRatings: { type: Number, default: 0 },
  available: { type: Boolean, default: false },
});

const Food = mongoose.model('Food', FoodSchema);
module.exports = Food;
