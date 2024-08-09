const User = require('../models/user');
const messmenuController = require('../controllers/messmenu');
const blockController = require('../controllers/block');

module.exports.getHomeData = async (req, res) => {
    try {
        const username = req.params.username;
        const user = await User.findOne({ username: username });

        if (!user) {
            return res.status(404).send({ message: 'User not found' });
        }
        const blockData = await blockController.getBlockData();
        if (user.isHosteler) {
            const messmenuData = await messmenuController.getMessmenuData();
            res.status(200).send({
                hostel: user.hostel,
                name: user.name,
                messType: user.messType,
                messmenu: messmenuData.messmenu,
                blockData: blockData
            });
        } else {
            res.status(200).send({
                name: user.name,
                blockData: blockData
            });
        }

    } catch (err) {
        res.status(500).send({ message: err.message });
    }
};
