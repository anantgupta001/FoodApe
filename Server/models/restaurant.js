const mongoose = require('mongoose');
const Schema = mongoose.Schema;
const Order = require('./order'); 
const Food = require('./food');

const RestaurantSchema = new Schema({
  name: { type: String, required: true },
  rating: { type: Number, default: 0, min: 0, max: 5 },
  pendingOrders: { type: [String], default: [] }, 
  phoneNumbers: { type: [String], required: true },
  image: { type: String, default: "https://img.freepik.com/premium-vector/modern-design-concept-no-image-found-design_637684-247.jpg?w=826" },
  menu: { type: [Food.schema], default: [] }
});

const Restaurant = mongoose.model('Restaurant', RestaurantSchema);
module.exports = Restaurant;
