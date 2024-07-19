const User = require("../models/user.js");

module.exports.signupForm = (req, res) => {
    res.status(200);
}

module.exports.signup = async (req, res) => {
    try {
        let { email, mobile, regNo, isHosteler, hostel, roomNo, messType, password, username } = req.body;

        // Ensure username is set to regNo if not provided
        if (!username) {
            username = regNo;
        }

        // Check if the email or regNo already exists
        const existingUser = await User.findOne({ $or: [{ email: email }, { regNo: regNo }, { username: username }] });
        if (existingUser) {
            return res.status(400).send({ message: 'A User with this email, registration number, or username already exists.' });
        }

        // Create a new User
        const newUser = new User({
            email, mobile, regNo, isHosteler, hostel, roomNo, messType, username,
        });

        const registeredUser = await User.register(newUser, password);

        // Save the new User to the database
        await registeredUser.save();

        // Log in the user
        req.login(newUser, (err) => {
            if (err) {
                return res.status(400).send({ message: err.message });
            }
            res.status(200).json(newUser);
        });

    } catch (err) {
        res.status(400).send({ message: err.message });
    }
}


module.exports.loginForm = (req, res) => {
    res.status(200);
}

module.exports.login = async (req, res) => {
    res.status(200);
}

module.exports.logout = (req, res) => {
    req.logout((err) => {
        if(err) {
            res.status(400).send({ message: err.message });
        }
        res.status(200).send({status : true});;
    });
}