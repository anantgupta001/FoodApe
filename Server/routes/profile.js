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
router.get(
    '/:username',
    profileController.showProfile
);

router.put(
    '/editProfile',
    ensureAuthenticated,
    profileController.editProfile
);
router.delete(
    '/deleteProfile', 
    ensureAuthenticated,
    profileController.deleteProfile
);
router.put(
    '/removeLikedFoods',
    profileController.removeLikedFoods
);

module.exports = router;
