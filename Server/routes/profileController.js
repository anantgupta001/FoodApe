const express = require('express');
const router = express.Router();
const passport = require("passport");
const profileController = require('../controllers/profileController');

function ensureAuthenticated(req, res, next) {
    if (req.isAuthenticated()) {
        return next();
    }
    res.status(400).send("User is not logged in!");
}
// Middleware to check if the user is logged in
router.put(
    '/profile/yourProfile/editProfile',
    ensureAuthenticated,
    profileController.editProfile
);
router.delete(
    '/profile/yourProfile/deleteProfile', 
    ensureAuthenticated,
    profileController.deleteProfile
);

module.exports = router;
