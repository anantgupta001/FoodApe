const mongoose = require('mongoose');
const Schema = mongoose.Schema;
const Order = require('./order'); 

const FoodSchema = new Schema({
  name: { type: String, required: true },
  description: { type: String, required: true },
  rating: { type: Number, default: 0 },
  price: { type: Number, required: true },
  numberOfRatings: { type: Number, default: 0 },
  available: { type: Boolean, default: true },
  restaurantName: { type: String, required: true },
  blockName: { type: String, required: true }
});

const RestaurantSchema = new Schema({
  name: { type: String, required: true },
  rating: { type: Number, default: 0 },
  totalOrders: { type: Number, default: 0 },
  pendingOrders: { type: [Order.schema], default: [] },
  phoneNumbers: { type: [String], required: true },
  menu: { type: [FoodSchema], default: [] }
});

const BlockSchema = new Schema({
  name: { type: String, required: true },
  restaurants: { type: [RestaurantSchema], default: [] }
});

const Block = mongoose.model('Block', BlockSchema);

module.exports = Block;