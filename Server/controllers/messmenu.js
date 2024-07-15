const Messmenu = require("../models/messMenu");

module.exports.showMessmenu = async (req, res) => {
    const date = new Date().toString().split(" ")[2];
    const messmenu = await Messmenu.find({date : date});
    res.status(200).json({status: true, messmenu: messmenu});
}