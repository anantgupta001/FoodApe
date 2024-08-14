const express = require('express');
const router = express.Router({mergeParams : true});
const homeController = require('../controllers/home');

router
    .route('/user/:username')
    .get(homeController.getHomeData);

module.exports = router;
