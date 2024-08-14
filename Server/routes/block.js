const express = require('express');
const router = express.Router({mergeParams : true});
const blockController = require("../controllers/block.js");

router.get("/:blockname", blockController.showBlocks);

module.exports = router;