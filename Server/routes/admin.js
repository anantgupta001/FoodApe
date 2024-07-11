const express = require("express");
const router = express.Router({mergeParams: true});
const wrapAsync = require("../utils/wrapAsync");
const passport = require("passport");
const { saveRedirectUrl } = require("../middleware.js");
const adminController = require("../controllers/admins.js");

router
    .route("/signup")
    .get(adminController.signupForm)
    .post(
        wrapAsync(adminController.signup)
    )

router
    .route("/login")
    .get(adminController.loginForm)
    .post(
        saveRedirectUrl,
        passport.authenticate("local", {
            failureRedirect : "/login", 
            failureFlash : true,
        }),
        adminController.login
    )

router.get(
    "/logout",
    adminController.logout
);

module.exports = router;