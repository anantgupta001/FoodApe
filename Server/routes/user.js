const express = require("express");
const router = express.Router({mergeParams: true});
const passport = require("passport");
const userController = require("../controllers/users.js");
const wrapAsync = require('../utils/wrapAsync');

router
    .route("/signup")
    .get(userController.signupForm)
    .post(
        wrapAsync(userController.signup)
    )

router
    .route("/login")
    .get(userController.loginForm)
    .post(
        passport.authenticate("local", {
            failureRedirect : "/login", 
            failureFlash : true,
        }),
        userController.login
    )

router.get(
    "/logout",
    userController.logout
);

module.exports = router;