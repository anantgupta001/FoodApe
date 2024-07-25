const express = require('express');
const router = express.Router({mergeParams : true});
const homeController = require('../controllers/home');
const messmenuController = require('../controllers/messmenu');

router
    .route('/student/:regNo')
    .get(homeController.getUserInfo);

module.exports = router;
