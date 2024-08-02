const express = require('express');
const router = express.Router({mergeParams : true});
const blockController = require("../controllers/block.js");
router.get("/block/:blockname", blockController.show);

module.exports = router;