const sampleMessMenu = [
    { date: "01", day: "Monday", breakfast: { NonSpl: ["Aloo paratha"], spl: ["jalebi"] }, lunch: { NonSpl: ["Idli"], spl: ["laccha paratha"] }, snacks: { NonSpl: ["Pizza"], spl: ["rasgulla"] }, dinner: { NonSpl: ["Chicken"], spl: ["hot and sour soup"] } },

    { date: "02", day: "Tuesday", breakfast: { NonSpl: ["Poha"], spl: ["jalebi"] }, lunch: { NonSpl: ["Rice and Dal"], spl: ["laccha paratha"] }, snacks: { NonSpl: ["Samosa"], spl: ["rasgulla"] }, dinner: { NonSpl: ["Paneer Butter Masala"], spl: ["tomato soup"] } },

    { date: "03", day: "Wednesday", breakfast: { NonSpl: ["Upma"], spl: ["jalebi"] }, lunch: { NonSpl: ["Chole Bhature"], spl: ["laccha paratha"] }, snacks: { NonSpl: ["Sandwich"], spl: ["rasgulla"] }, dinner: { NonSpl: ["Fish Curry"], spl: ["hot and sour soup"] } },

    { date: "04", day: "Thursday", breakfast: { NonSpl: ["Dosa"], spl: ["jalebi"] }, lunch: { NonSpl: ["Pulao"], spl: ["laccha paratha"] }, snacks: { NonSpl: ["Fruit Salad"], spl: ["rasgulla"] }, dinner: { NonSpl: ["Mutton Curry"], spl: ["tomato soup"] } },

    { date: "05", day: "Friday", breakfast: { NonSpl: ["Paratha"], spl: ["jalebi"] }, lunch: { NonSpl: ["Rajma Chawal"], spl: ["laccha paratha"] }, snacks: { NonSpl: ["Pasta"], spl: ["rasgulla"] }, dinner: { NonSpl: ["Vegetable Biryani"], spl: ["hot and sour soup"] } },
    
    { date: "06", day: "Saturday", breakfast: { NonSpl: ["Idli"], spl: ["jalebi"] }, lunch: { NonSpl: ["Biryani"], spl: ["laccha paratha"] }, snacks: { NonSpl: ["French Fries"], spl: ["rasgulla"] }, dinner: { NonSpl: ["Grilled Chicken"], spl: ["tomato soup"] } },

    { date: "07", day: "Sunday", breakfast: { NonSpl: ["Pancakes"], spl: ["jalebi"] }, lunch: { NonSpl: ["Chicken Curry"], spl: ["laccha paratha"] }, snacks: { NonSpl: ["Cookies"], spl: ["rasgulla"] }, dinner: { NonSpl: ["Vegetable Stir Fry"], spl: ["hot and sour soup"] } },

    { date: "08", day: "Monday", breakfast: { NonSpl: ["Toast"], spl: ["jalebi"] }, lunch: { NonSpl: ["Fried Rice"], spl: ["laccha paratha"] }, snacks: { NonSpl: ["Nachos"], spl: ["rasgulla"] }, dinner: { NonSpl: ["Beef Stew"], spl: ["tomato soup"] } },

    { date: "09", day: "Tuesday", breakfast: { NonSpl: ["Omelette"], spl: ["jalebi"] }, lunch: { NonSpl: ["Dal Tadka"], spl: ["laccha paratha"] }, snacks: { NonSpl: ["Bhel Puri"], spl: ["rasgulla"] }, dinner: { NonSpl: ["Pasta"], spl: ["hot and sour soup"] } },

    { date: "10", day: "Wednesday", breakfast: { NonSpl: ["Smoothie"], spl: ["jalebi"] }, lunch: { NonSpl: ["Paneer Tikka"], spl: [] }, snacks: { NonSpl: ["Pakora"], spl: ["rasgulla"] }, dinner: { NonSpl: ["Sushi"], spl: ["hot and sour soup"] } },

    { date: "11", day: "Thursday", breakfast: { NonSpl: ["Bagel"], spl: ["jalebi"] }, lunch: { NonSpl: ["Veg Sandwich"], spl: ["laccha paratha"] }, snacks: { NonSpl: ["Momos"], spl: ["rasgulla"] }, dinner: { NonSpl: ["Kebab"], spl: [] } },

    { date: "12", day: "Friday", breakfast: { NonSpl: ["Croissant"], spl: ["jalebi"] }, lunch: { NonSpl: ["Pizza"], spl: ["laccha paratha"] }, snacks: { NonSpl: ["Pav Bhaji"], spl: ["rasgulla"] }, dinner: { NonSpl: ["Lamb Curry"], spl: ["hot and sour soup"] } },

    { date: "13", day: "Saturday", breakfast: { NonSpl: ["Burrito"], spl: ["jalebi"] }, lunch: { NonSpl: ["Pasta"], spl: ["laccha paratha"] }, snacks: { NonSpl: ["Fruit Juice"], spl: ["rasgulla"] }, dinner: { NonSpl: ["Biryani"], spl: ["hot and sour soup"] } },

    { date: "14", day: "Sunday", breakfast: { NonSpl: ["Waffles"], spl: ["jalebi"] }, lunch: { NonSpl: ["Mango Rice"], spl: ["laccha paratha"] }, snacks: { NonSpl: ["Chips"], spl: ["rasgulla"] }, dinner: { NonSpl: ["Butter Chicken"], spl: ["hot and sour soup"] } },

    { date: "15", day: "Monday", breakfast: { NonSpl: ["Aloo paratha"], spl: ["jalebi"] }, lunch: { NonSpl: ["Idli"], spl: [] }, snacks: { NonSpl: ["Pizza"], spl: ["rasgulla"] }, dinner: { NonSpl: ["Chicken"], spl: ["hot and sour soup"] } },

    { date: "16", day: "Tuesday", breakfast: { NonSpl: ["Porridge"], spl: ["jalebi"] }, lunch: { NonSpl: ["Tofu Stir Fry"], spl: ["laccha paratha"] }, snacks: { NonSpl: ["Chana Chaat"], spl: ["rasgulla"] }, dinner: { NonSpl: ["Fish Tacos"], spl: ["hot and sour soup"] } },

    { date: "17", day: "Wednesday", breakfast: { NonSpl: ["Eggs Benedict"], spl: ["jalebi"] }, lunch: { NonSpl: ["Kichdi"], spl: ["laccha paratha"] }, snacks: { NonSpl: ["Spring Rolls"], spl: ["rasgulla"] }, dinner: { NonSpl: ["Roast Beef"], spl: ["hot and sour soup"] } },

    { date: "18", day: "Thursday", breakfast: { NonSpl: ["Avocado Toast"], spl: ["jalebi"] }, lunch: { NonSpl: ["Salad"], spl: ["laccha paratha"] }, snacks: { NonSpl: ["Popcorn"], spl: ["rasgulla"] }, dinner: { NonSpl: ["Steak"], spl: ["hot and sour soup"] } },

    { date: "19", day: "Friday", breakfast: { NonSpl: ["Muffin"], spl: ["jalebi"] }, lunch: { NonSpl: ["Burger"], spl: ["laccha paratha"] }, snacks: { NonSpl: ["Tacos"], spl: ["rasgulla"] }, dinner: { NonSpl: ["Fried Rice"], spl: ["hot and sour soup"] } },

    { date: "20", day: "Saturday", breakfast: { NonSpl: ["Pancakes"], spl: ["jalebi"] }, lunch: { NonSpl: ["Paneer Butter Masala"], spl: [] }, snacks: { NonSpl: ["Ice Cream"], spl: ["rasgulla"] }, dinner: { NonSpl: ["Noodles"], spl: ["hot and sour soup"] } },
    
    { date: "21", day: "Sunday", breakfast: { NonSpl: ["Smoothie Bowl"], spl: ["jalebi"] }, lunch: { NonSpl: ["Chicken Wrap"], spl: ["laccha paratha"] }, snacks: { NonSpl: ["Pav Bhaji"], spl: ["rasgulla"] }, dinner: { NonSpl: ["Pizza"], spl: ["hot and sour soup"] } },

    { date: "22", day: "Monday", breakfast: { NonSpl: ["Scrambled Eggs"], spl: ["jalebi"] }, lunch: { NonSpl: ["Sushi"], spl: ["laccha paratha"] }, snacks: { NonSpl: ["Biscuits"], spl: ["rasgulla"] }, dinner: { NonSpl: ["BBQ Ribs"], spl: ["hot and sour soup"] } },

    { date: "23", day: "Tuesday", breakfast: { NonSpl: ["Granola"], spl: ["jalebi"] }, lunch: { NonSpl: ["Spaghetti"], spl: ["laccha paratha"] }, snacks: { NonSpl: ["Chips and Salsa"], spl: ["rasgulla"] }, dinner: { NonSpl: ["Fajitas"], spl: ["hot and sour soup"] } },

{ date: "24", day: "Wednesday", breakfast: { NonSpl: ["French Toast"], spl: ["jalebi"] }, lunch: { NonSpl: ["Pulav"], spl: ["laccha paratha"] }, snacks: { NonSpl: ["Cupcakes"], spl: ["rasgulla"] }, dinner: { NonSpl: ["Tandoori Chicken"], spl: ["hot and sour soup"] } },

{ date: "25", day: "Thursday", breakfast: { NonSpl: ["Breakfast Burrito"], spl: ["jalebi"] }, lunch: { NonSpl: ["Falafel"], spl: ["laccha paratha"] }, snacks: { NonSpl: ["Cheese Balls"], spl: ["rasgulla"] }, dinner: { NonSpl: ["Grilled Fish"], spl: ["hot and sour soup"] } },

{ date: "26", day: "Friday", breakfast: { NonSpl: ["Crepes"], spl: ["jalebi"] }, lunch: { NonSpl: ["Tacos"], spl: ["laccha paratha"] }, snacks: { NonSpl: ["Pani Puri"], spl: ["rasgulla"] }, dinner: { NonSpl: ["Stuffed Peppers"], spl: ["hot and sour soup"] } },

{ date: "27", day: "Saturday", breakfast: { NonSpl: ["Bagel"], spl: ["jalebi"] }, lunch: { NonSpl: ["Chicken Curry"], spl: ["laccha paratha"] }, snacks: { NonSpl: ["Nachos"], spl: ["rasgulla"] }, dinner: { NonSpl: ["Mutton Curry"], spl: ["hot and sour soup"] } },

{ date: "28", day: "Sunday", breakfast: { NonSpl: ["Fruit Salad"], spl: ["jalebi"] }, lunch: { NonSpl: ["Paneer Tikka"], spl: ["laccha paratha"] }, snacks: { NonSpl: ["Chole Kulche"], spl: ["rasgulla"] }, dinner: { NonSpl: ["Lasagna"], spl: ["hot and sour soup"] } },

{ date: "29", day: "Monday", breakfast: { NonSpl: ["Waffles"], spl: ["jalebi"] }, lunch: { NonSpl: ["Caesar Salad"], spl: ["laccha paratha"] }, snacks: { NonSpl: ["Veg Rolls"], spl: ["rasgulla"] }, dinner: { NonSpl: ["Chicken Biryani"], spl: ["hot and sour soup"] } },

{ date: "30", day: "Tuesday", breakfast: { NonSpl: ["Muesli"], spl: ["jalebi"] }, lunch: { NonSpl: ["Quinoa Salad"], spl: ["laccha paratha"] }, snacks: { NonSpl: ["Dhokla"], spl: ["rasgulla"] }, dinner: { NonSpl: ["Pulled Pork"], spl: ["hot and sour soup"] } }
];

module.exports = { data: sampleMessMenu };