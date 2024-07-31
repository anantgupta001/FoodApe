const mongoose = require('mongoose');
const Schema = mongoose.Schema;
const Order = require('./order'); 
const Food = require('./food');

const RestaurantSchema = new Schema({
  name: { type: String, required: true },
  rating: { type: Number, default: 0, min: 0, max: 5 },
  pendingOrders: { type: [Order.schema], default: [] }, //Can contain only OrderID and other details can be searched.
  phoneNumbers: { type: [String], required: true },
  menu: { type: [Food.schema], default: [] } // Can contain only food name and other details can be searched.
});

const Restaurant = mongoose.model('Restaurant', RestaurantSchema);
module.exports = Restaurant;
