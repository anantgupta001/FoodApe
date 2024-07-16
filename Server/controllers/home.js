const User = require('../models/user'); 
const messmenuController = require('../controllers/messmenu'); 

module.exports.getUserInfo = async (req, res) => {
    try {
        const regNo = req.params.regNo;
        const user = await User.findOne({ regNo: regNo });

        if (!user) {
            return res.status(404).send({ message: 'User not found' });
        }

        const messmenuData = await messmenuController.getMessmenuData();
        res.status(200).send({ user, messmenu: messmenuData.messmenu });
    } catch (err) {
        res.status(500).send({ message: err.message });
    }
};