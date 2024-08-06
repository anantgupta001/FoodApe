const express = require('express');
const router = express.Router();
const passport = require("passport");
const profileController = require('../controllers/profile');

function ensureAuthenticated(req, res, next) {
    if (req.isAuthenticated()) {
        return next();
    }
    res.status(400).send("User is not logged in!");
}
// Middleware to check if the user is logged in
router.put(
    '/perosnalInfo/editProfile',
    ensureAuthenticated,
    profileController.editProfile
);
router.delete(
    '/perosnalInfo/deleteProfile', 
    ensureAuthenticated,
    profileController.deleteProfile
);
router.put(
    '/perosnalInfo/likedFoods',
    profileController.likedFoods
);

module.exports = router;
