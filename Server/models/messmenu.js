const mongoose = require('mongoose');

const messmenuSchema = new mongoose.Schema({
    date: {
        type: Number,
        required: true,
        min: 1,
        max: 31,
    },
    day: {
        type: String,
        required: true,
    },
    breakfast: {
        type: String,
        required: true,
    },
    lunch: {
        type: String,
        required: true,
    },
    snacks: {
        type: String,
        required: true,
    },
    dinner: {
        type: String,
        required: true,
    }
});

module.exports = mongoose.model('Messmenu', messmenuSchema);
