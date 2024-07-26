const User = require("../models/user.js");

module.exports.signup = async (req, res) => {
    try {
        let { 
            username,
            email, 
            isHosteler, 
            hostel, 
            roomNo, 
            messType, 
            password,  
        } = req.body;

        // Check if the email or username already exists
        const existingUser = await User.findOne({ $or: [{ email: email }, { username: username }] });
        if (existingUser) {
            return res.status(400).send({ message: 'A User with this email, registration number already exists.' });
        }

        // Create a new User
        const newUser = new User({
            username, email, isHosteler, hostel, roomNo, messType
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

module.exports.login = (req, res) => {
    if (req.isAuthenticated()) {
        // User is already logged in
        console.log(`User ${req.user.username} is already logged in`);
        return res.status(200).send({ status: true, message: `User ${req.user.username} is already logged in` });
    }
    console.log(`User ${req.user.username} logged in successfully`);
    res.status(200).send({ status: true, message: `User ${req.user.username} logged in successfully` });
}

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