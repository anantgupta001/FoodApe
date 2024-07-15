const User = require('../models/user'); 
const MessMenu = require('../models/messmenu'); 

exports.getHostelAndMessmenu = async (req, res) => {
    try {
        const regNo = req.params.regNo;
        const user = await User.findOne({ regNo: regNo }).select('hostel messType');
        if (!user) {
            return res.status(404).send({ message: 'User not found' });
        }
        const messType = user.messType;
        const date = new Date().toString().split(" ")[2];
        const messmenu = await MessMenu.find({ date: date, type: messType }); 
        res.status(200).send({ hostel: user.hostel, messmenu: messmenu });
    } catch (err) {
        res.status(500).send({ message: err.message });
    }
};
