const express = require('express');
const router = express.Router();
const orderController = require('../controllers/order'); 

router.get('/orders/:userId', orderController.getOrdersForUser);

module.exports = router;
