const Messmenu = require("../models/messmenu");

module.exports.getMessmenuData = async (req, res) => {
    const date = new Date().toString().split(" ")[2];
    const messmenu = await Messmenu.findOne({ date: date });
    return { status: true, messmenu: messmenu };
};

// This function will be used for the '/messmenu' route
module.exports.showMessmenu = async (req, res) => {
    try {
        const messmenuData = await module.exports.getMessmenuData();
        res.status(200).json(messmenuData);
    } catch (err) {
        res.status(500).send({ message: err.message });
    }
};