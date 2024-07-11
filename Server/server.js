if(process.env.NODE_ENV != 'production'){
    require('dotenv').config();
}
const express = require("express");
const app = express();

app.get("/", (req, res) => {
    res.send("Hi, I'm root route");;
});

app.listen(8080, () => {
    console.log("Server is listening...");
});