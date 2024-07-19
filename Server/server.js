if (process.env.NODE_ENV != 'production') {
    require('dotenv').config();
}
const express = require("express");
const app = express();
const mongoose = require("mongoose");
const path = require("path");
const methodOverride = require("method-override");
const session = require("express-session");
const passport = require("passport");
const LocalStrategy = require("passport-local");
const Student = require("./models/user.js");

const messmenuRouter = require("./routes/messmenu.js");
const homeRouter = require('./routes/home');
const registerRouter = require("./routes/user.js");

app.use(express.urlencoded({ extended: true }));
app.use(express.static(path.join(__dirname, "public")));
app.use(methodOverride("_method"));

const sessionOptions = {
    secret : "Mysupersecret",
    resave : false,
    saveUninitialized : true,
    cookie: {
        expires : Date.now() + 7 * 24 * 60 * 60 * 1000,
        maxAge : 7 * 24 * 60 * 60 * 1000,
        httpOnly : true,
    }
}

app.use(session(sessionOptions));
app.use(passport.initialize());
app.use(passport.session());

passport.use(new LocalStrategy(Student.authenticate()));
passport.serializeUser(Student.serializeUser());
passport.deserializeUser(Student.deserializeUser());

main()
    .then(() => console.log("connected to DB"))
    .catch(err => console.error(err));

async function main() {
    await mongoose.connect(process.env.MONGO_URL);
}

app.get("/", (req, res) => {
    res.send("Hi, I'm root route");
});

app.use("/messmenu", messmenuRouter);
app.use("/home", homeRouter);
app.use("/register", registerRouter);


app.listen(process.env.PORT, () => {
    console.log(`Server is running on port ${process.env.PORT}`);
});

