const mongoose = require("mongoose");
const initData = require("./messMenuSampleData");
const Messmenu = require("../models/messMenu");

const MONGO_URL = 'mongodb://127.0.0.1:27017/FoodApe';
main()
    .then((res) => {
        console.log("connected to DB")
    })
    .catch((err) => {
        console.log(err)
    });

async function main() {
    await mongoose.connect(MONGO_URL);
}


const initDB = async () => {
    await Messmenu.deleteMany({});
    await Messmenu.insertMany(initData.data);
    console.log("DATA was initialised");
}

initDB();