const mongoose = require('mongoose');
const Schema = mongoose.Schema;

const daysOfWeek = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'];

const messmenuSchema = new Schema({
  date: { 
    type: String, 
    required: true 
  },
  day: { 
    type: String, 
    enum: daysOfWeek, 
    required: true 
  },
  breakfast: {
    NonSpl: { 
      type: [String], 
      required: true 
    },
    spl: { 
      type: [String], 
      required: true 
    }
  },
  lunch: {
    NonSpl: { 
      type: [String], 
      required: true 
    },
    spl: { 
      type: [String], 
      required: true 
    }
  },
  snacks: {
    NonSpl: { 
      type: [String], 
      required: true 
    },
    spl: { 
      type: [String], 
      required: true 
    }
  },
  dinner: {
    NonSpl: { 
      type: [String], 
      required: true 
    },
    spl: { 
      type: [String], 
      required: true 
    }
  }
});

const messmenu = mongoose.model('messmenu', messmenuSchema);

module.exports = messmenu;
