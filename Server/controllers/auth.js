const User = require("../models/user.js");
const passport = require('passport');

module.exports.signup = async (req, res) => {
    try {
        let { 
            username,
            name,
            mobile,
            email, 
            isHosteler, 
            hostel, 
            messType, 
            password,  
        } = req.body;

        // res.status(200).send(isHosteler);

        // Check if the email or username already exists
        const existingUser = await User.findOne({ $or: [{ email: email }, { username: username }] });
        if (existingUser) {
            return res.status(400).send({ message: 'A User with this email, registration number already exists.' });
        }

        if (isHosteler == "false") {
            hostel = undefined;
            messType = undefined;
        }

        // Create a new User
        const newUser = new User({
            username,
            name,
            mobile,
            email, 
            isHosteler, 
            hostel, 
            messType, 
        });
        
        const registeredUser = await User.register(newUser, password);

        // Save the new User to the database
        await registeredUser.save();
        console.log(`${username} signed up successfully`);

        // Log in the user
        req.login(newUser, (err) => {
            if (err) {
                return res.status(400).send({ message: err.message });
            }
            console.log(`${username} logged in through signup process`);
            res.status(200).json(newUser);
        });

    } catch (err) {
        res.status(400).send({ message: err.message });
    }
}

module.exports.login = (req, res, next) => {
    passport.authenticate('local', (err, user, info) => {
        if (err) {
            return next(err);  // Handle any unexpected errors
        }
        if (!user) {
            // If authentication fails (wrong username or password), return an error
            return res.status(401).json({ message: 'Invalid username or password' });
        }

        // Log the user in after successful authentication
        req.logIn(user, (err) => {
            if (err) {
                return next(err);  // Handle any error during login
            }

            console.log(`User ${user.username} logged in successfully`);
            // Send success response
            return res.status(200).json({ status: true, message: `User ${user.username} logged in successfully` });
        });
    })(req, res, next);
};


module.exports.logout = (req, res) => {
    if (req.isAuthenticated()) {
        const username = req.user.username;

        req.logout((err) => {
            if (err) {
                return res.status(400).send({ message: err.message });
            }
            console.log(`User ${username} logged out successfully`);
            res.status(200).send({ status: true, message: `User ${username} logged out successfully` });
        });
    } else {
        console.log('No user is currently logged in');
        res.status(400).send({ status: false, message: 'No user is logged in' });
    }
}