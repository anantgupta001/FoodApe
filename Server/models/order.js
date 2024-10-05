const mongoose = require('mongoose');
const Schema = mongoose.Schema;

const orderSchema = new Schema({
    foodName: { type: String, required: true },
    rating: { type: Number, default: 0, min : 0, max: 5 },
    restaurant: { type: String, required: true },
    image: { type: String, default: "https://img.freepik.com/premium-vector/modern-design-concept-no-image-found-design_637684-247.jpg?w=826" },
    quantity: { type: Number, required: true },
    price: { type: Number, required: true },
    prepared: { type: Boolean, default: false },
    cancelled: { type: Boolean, default: false }
});

const Order = mongoose.model('Order', orderSchema);

module.exports = Order;
