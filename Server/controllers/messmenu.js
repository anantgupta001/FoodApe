const Messmenu = require("../models/messmenu");

module.exports.showMessmenu = async (req, res) => {
    const date = new Date().toString().split(" ")[2];
    const messmenu = await Messmenu.find({date : date});
    console.log(messmenu);
    res.status(200).json({status: true, messmenu: messmenu});
}