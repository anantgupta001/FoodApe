const Block = require("../models/block");

module.exports.show = (req, res) => {
    res.status(200).send(req.params.blockname);;
}