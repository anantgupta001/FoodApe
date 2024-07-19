const mongoose = require("mongoose");
const messmenuData = require("./messmenu");
const userData = require("./user");
const Messmenu = require("../models/messmenu");
const User = require("../models/user");

const MONGO_URL = "mongodb+srv://anantagarwal4946:YbBDu24b@anant.8w2muqk.mongodb.net/FoodApe?retryWrites=true&w=majority&appName=Anant";

mongoose.connect(MONGO_URL, { useNewUrlParser: true, useUnifiedTopology: true })
    .then(async () => {
        console.log('MongoDB connected successfully');

        await Messmenu.deleteMany({})
            .then(docs => {
                console.log('Messmenu Documents deleted:');
            })
            .catch(err => {
                console.error('Error deleting messmenu documents:', err);
                mongoose.connection.close();
        });

        await Messmenu.insertMany(messmenuData.data)
            .then(docs => {
                console.log('Messmenu Documents inserted:');
            })
            .catch(err => {
                console.error('Error inserting messmenu documents:', err);
                mongoose.connection.close();
            });

        await User.deleteMany({})
            .then(docs => {
                console.log('User Documents deleted:');
            })
            .catch(err => {
                console.error('Error deleted messmenu documents:', err);
                mongoose.connection.close();
            });

        await User.insertMany(userData.data)
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