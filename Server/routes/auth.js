const express = require("express");
const passport = require("passport");
const userController = require("../controllers/auth.js");
const router = express.Router();

router.post('/login', 
    passport.authenticate('local', { failureRedirect: '/login', failureMessage: true }), 
    userController.login
);

router.post('/signup', userController.signup);

router.get('/logout', userController.logout);

module.exports = router;