const mongoose = require('mongoose');
const Schema = mongoose.Schema;

const daysOfWeek = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'];

const messmenuSchema = new Schema({
    date: { type: String, required: true },
    day: { type: String, enum: daysOfWeek, required: true },
    breakfast: { type: String, required: true },
    lunch: { type: String, required: true },
    snacks: { type: String, required: true },
    dinner: { type: String, required: true }
});

const messmenu = mongoose.model('messmenu', messmenuSchema);

module.exports = messmenu;
