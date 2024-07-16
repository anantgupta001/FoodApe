const mongoose = require("mongoose");
const messmenuData = require("./messmenu");
const userData = require("./user");
const Messmenu = require("../models/messmenu");
const User = require("../models/user");

const MONGO_URL = "mongodb+srv://anantagarwal4946:YbBDu24b@anant.8w2muqk.mongodb.net/FoodApe?retryWrites=true&w=majority&appName=Anant";

mongoose.connect(MONGO_URL, { useNewUrlParser: true, useUnifiedTopology: true })
    .then(() => {
        console.log('MongoDB connected successfully');

        Messmenu.deleteMany({});
        Messmenu.insertMany(messmenuData.data)
            .then(docs => {
                console.log('Messmenu Documents inserted:');
                mongoose.connection.close();
            })
            .catch(err => {
                console.error('Error inserting messmenu documents:', err);
                mongoose.connection.close();
            });

        User.deleteMany({});
        User.insertMany(userData.data)
            .then(docs => {
                console.log('User Documents inserted:');
                mongoose.connection.close();
            })
            .catch(err => {
                console.error('Error inserting user documents:', err);
                mongoose.connection.close();
            });
    })
    .catch(err => {
        console.error('MongoDB connection error:', err);
    });