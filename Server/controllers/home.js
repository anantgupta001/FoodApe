const User = require('../models/user'); 
const messmenuController = require('../controllers/messmenu'); 

module.exports.getUserInfo = async (req, res) => {
    try {
        const regNo = req.params.regNo;
        const user = await User.findOne({ regNo: regNo });
        if (!user) {
            return res.status(404).send({ message: 'User not found' });
        }
        if(user.isHosteler === "Hosteler"){
            const messmenuData = await messmenuController.getMessmenuData();
            res.status(200).send({hostel: user.hostel, roomNO: user.roomNo, messType: user.messType, messmenu: messmenuData.messmenu });
        }else{
            res.status(200).send("YE TO HOSTELER NHI H");
        }
        
    } catch (err) {
        res.status(500).send({ message: err.message });
    }
};