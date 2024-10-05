const mongoose = require('mongoose');
const User = require('../models/user'); 
const Order = require('../models/order'); 


module.exports.getOrdersForUser = async (req, res) => {
    try {
        const username = req.params.username;
        const user = await User.findOne({ username: username });
        if (!user) {
            return res.status(404).send('User not found');
        }
        const orders = await Order.find({ _id: { $in: user.ordersOrderID } });
        if (!orders.length) {
            return res.status(404).send('No orders found for this user');
        }

        res.status(200).json(orders);
    } catch (error) {
        console.error(error);
        res.status(500).send('Server error');
    }
};