if (process.env.NODE_ENV !== 'production') {
    const dotenv = require('dotenv').config();
}
const express = require('express');
const app = express();
const mongoose = require('mongoose');
const path = require('path');

main()
    .then(() => console.log("connected to DB"))
    .catch(err => console.error(err));

async function main() {
    await mongoose.connect(process.env.MONGO_URL);
}

app.get("/", (req, res) => {
    res.send("Hi, I'm root route");
});

app.get("/messmenu", (req, res) => {
    res.send("Hey this is mess menu");
});

const port = process.env.PORT || 5000;
app.listen(port, () => {
    console.log(`Server is listening on port ${port}...`);
});
