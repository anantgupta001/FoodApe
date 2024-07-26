const express = require('express');
const router = express.Router({mergeParams : true});
const homeController = require('../controllers/home');

router
    .route('/user/:regNo')
    .get(homeController.getUserInfo);

module.exports = router;
