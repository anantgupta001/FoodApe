const mongoose = require('mongoose');
const Schema = mongoose.Schema;

const messMenuSchema = new Schema({
    date: { type: String, required: true },
    day: { type: String, required: true },
    breakfast: { type: String, required: true },
    lunch: { type: String, required: true },
    snacks: { type: String, required: true },
    dinner: { type: String, required: true }
});

const MessMenu = mongoose.model('MessMenu', messMenuSchema);

module.exports = MessMenu;
