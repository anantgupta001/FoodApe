const fs = require('fs');
const path = require('path');

module.exports.getBlockData = async (req, res) => {
    try {
        const filePath = path.join(__dirname, '../src/block.json');
        const blockData = fs.readFileSync(filePath, 'utf-8');
        const blocks = JSON.parse(blockData);

        if (!blocks || blocks.length === 0) {
            return { status: false, message: 'No blocks found' };
        }
        return { status: true, blocks: blocks };
    } catch (err) {
        return { status: false, message: 'Server error', error: err.message };
    }
}

module.exports.show = (req, res) => {
    const blockname = req.params.blockname;
    if (!blockname) {
        return res.status(400).send({ message: 'Block name is required' });
    }
    console.log("Received blockname:", blockname);
    res.status(200).send(blockname);
}
