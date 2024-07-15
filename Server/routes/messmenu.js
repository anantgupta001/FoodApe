const express = require("express");
const router = express.Router();
const messmenuController = require("../controllers/messmenu");

router.get("/", messmenuController.showMessmenu);

module.exports = router;