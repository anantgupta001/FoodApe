const Admin = require("../models/admin.js");

module.exports.signupForm = (req, res) => {
    res.render("admins/signup.ejs");
}

module.exports.signup = async (req, res) => {
    try {
        let {adminname, email, password} = req.body;
        const newAdmin = new Admin({email,username});
        const registeredAdmin = await Admin.register(newAdmin, password);
        req.login(registeredAdmin, (err) => {
            if(err) {
                return next(err);
            }
            req.flash("success", "You are signed up!");
            return res.redirect("/listings");
        });
    } catch (err) {
        req.flash("error", err.message);
        res.redirect("/signup");
    }
}

module.exports.loginForm = (req, res) => {
    res.render("admins/login.ejs");
}

module.exports.login = async (req, res) => {
    req.flash("success", "Welcome back!");
    let redirectUrl = res.locals.redirectUrl;
    if(redirectUrl === "/login" || redirectUrl == undefined){
        redirectUrl = "/listings";
    }
    res.redirect(redirectUrl);
}

module.exports.logout = (req, res) => {
    req.logout((err) => {
        if(err) {
            return next(err);
        }
        req.flash("success", "You have been logged our successfully!");
        res.redirect("/listings");
    });
}