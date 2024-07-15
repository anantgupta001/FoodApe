if (process.env.NODE_ENV != 'production') {
    require('dotenv').config();
}
const express = require("express");
const app = express();
const mongoose = require("mongoose");
const path = require("path");
const methodOverride = require("method-override");

//const messmenuRouter = require("./routes/messmenu.js");
const homeRouter = require('./routes/home');

app.use(express.urlencoded({ extended: true }));
app.use(express.static(path.join(__dirname, "public")));
app.use(methodOverride("_method"));

main()
    .then(() => console.log("connected to DB"))
    .catch(err => console.error(err));

async function main() {
    await mongoose.connect("mongodb+srv://anantagarwal4946:YbBDu24b@anant.8w2muqk.mongodb.net/?retryWrites=true&w=majority&appName=Anant");
}

app.get("/", (req, res) => {
    res.send("Hi, I'm root route");
});

//app.use("/messmenu", messmenuRouter);
app.use("/api", homeRouter);

app.listen(process.env.PORT, () => {
    console.log(`Server is running on port ${process.env.PORT}`);
});

