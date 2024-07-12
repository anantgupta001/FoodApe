const Restaurant = require("../models/home");

module.exports.showHomePage = async (req, res) => {
    const restaurants = await Restaurant.find({});
    res.render("stuff", { restaurants });
};

module.exports.searchFood = async (req, res) => {
    const { query } = req.query;
    const searchResults = await Restaurant.find({ "menu.food": { $regex: query, $options: "i" } });
    res.render("stuff", { restaurants: searchResults });
};
