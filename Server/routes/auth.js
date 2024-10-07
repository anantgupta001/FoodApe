const express = require("express");
const userController = require("../controllers/auth.js");
const router = express.Router();

// Call the login function from the controller
router.post('/login', userController.login);

// Other routes for signup and logout
router.post('/signup', userController.signup);

router.get('/logout', userController.logout);

module.exports = router;
