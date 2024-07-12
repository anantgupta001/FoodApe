const express = require("express");
const router = express.Router();
const hc = require("../controllers/home");

router.get("/", hc.showHomePage);
router.get("/search", hc.searchFood);

module.exports = router;
