const mongoose = require('mongoose');

const restaurantSchema = new mongoose.Schema({
  location: {
    type: String,
    required: true
  },
  description: {
    type: String,
    required: true
  },
  rating: {
        currentAvgRating: {
          type: Number,
        },
        numberOfRatings: {
          type: Number,
        }
  },
  totalOrders: {
    type: Number,
    required: true,
    default: 0
  },
  pendingOrders: {
    type: Number,
    required: true,
    default: 0
  },
  completedOrders: {
    type: Number,
    required: true,
    default: 0
  },
  menu: {
        foodItem: {
            name: {
                type: String,
                required: true
            },
            description: {
                type: String,
                required: true
            },
            rating: {
              currentAvgRating: {
                type: Number,
              },
              numberOfRatings: {
                type: Number,
              }
            },
            price: {
                type: Number,
                required: true,
                min: 0
            },
            modificationOptions: {
                type: String,
                enum: ['None', 'Extra Cheese', 'Spicy', 'No Onions', 'Gluten Free'], // example options
                default: 'None'
            },
            numberOfRatings: {
                type: Number,
                required: true,
                default: 0
            },
            available: {
                type: Boolean,
                required: true,
                default: true
            }
        }
    }
});

const Restaurant = mongoose.model('Restaurant', restaurantSchema);

module.exports = Restaurant;
