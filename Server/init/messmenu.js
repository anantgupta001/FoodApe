const sampleMessMenu = [
    {
        "date": "1",
        "day": "Monday",
        "breakfast": "Aloo paratha",
        "lunch": "Idli",
        "snacks": "Pizza",
        "dinner": "Chicken"
    },
    {
        "date": "2",
        "day": "Tuesday",
        "breakfast": "Poha",
        "lunch": "Rice and Dal",
        "snacks": "Samosa",
        "dinner": "Paneer Butter Masala"
    },
    {
        "date": "3",
        "day": "Wednesday",
        "breakfast": "Upma",
        "lunch": "Chole Bhature",
        "snacks": "Sandwich",
        "dinner": "Fish Curry"
    },
    {
        "date": "4",
        "day": "Thursday",
        "breakfast": "Dosa",
        "lunch": "Pulao",
        "snacks": "Fruit Salad",
        "dinner": "Mutton Curry"
    },
    {
        "date": "5",
        "day": "Friday",
        "breakfast": "Paratha",
        "lunch": "Rajma Chawal",
        "snacks": "Pasta",
        "dinner": "Vegetable Biryani"
    },
    {
        "date": "6",
        "day": "Saturday",
        "breakfast": "Idli",
        "lunch": "Biryani",
        "snacks": "French Fries",
        "dinner": "Grilled Chicken"
    },
    {
        "date": "7",
        "day": "Sunday",
        "breakfast": "Pancakes",
        "lunch": "Chicken Curry",
        "snacks": "Cookies",
        "dinner": "Vegetable Stir Fry"
    },
    {
        "date": "8",
        "day": "Monday",
        "breakfast": "Toast",
        "lunch": "Fried Rice",
        "snacks": "Nachos",
        "dinner": "Beef Stew"
    },
    {
        "date": "9",
        "day": "Tuesday",
        "breakfast": "Omelette",
        "lunch": "Dal Tadka",
        "snacks": "Bhel Puri",
        "dinner": "Pasta"
    },
    {
        "date": "10",
        "day": "Wednesday",
        "breakfast": "Smoothie",
        "lunch": "Paneer Tikka",
        "snacks": "Pakora",
        "dinner": "Sushi"
    },
    {
        "date": "11",
        "day": "Thursday",
        "breakfast": "Bagel",
        "lunch": "Veg Sandwich",
        "snacks": "Momos",
        "dinner": "Kebab"
    },
    {
        "date": "12",
        "day": "Friday",
        "breakfast": "Croissant",
        "lunch": "Pizza",
        "snacks": "Pav Bhaji",
        "dinner": "Lamb Curry"
    },
    {
        "date": "13",
        "day": "Saturday",
        "breakfast": "Burrito",
        "lunch": "Pasta",
        "snacks": "Fruit Juice",
        "dinner": "Biryani"
    },
    {
        "date": "14",
        "day": "Sunday",
        "breakfast": "Waffles",
        "lunch": "Mango Rice",
        "snacks": "Chips",
        "dinner": "Butter Chicken"
    },
    {
        "date": "15",
        "day": "Monday",
        "breakfast": "Aloo paratha",
        "lunch": "Idli",
        "snacks": "Pizza",
        "dinner": "Chicken"
    },
    {
        "date": "16",
        "day": "Tuesday",
        "breakfast": "Porridge",
        "lunch": "Tofu Stir Fry",
        "snacks": "Chana Chaat",
        "dinner": "Fish Tacos"
    },
    {
        "date": "17",
        "day": "Wednesday",
        "breakfast": "Eggs Benedict",
        "lunch": "Kichdi",
        "snacks": "Spring Rolls",
        "dinner": "Roast Beef"
    },
    {
        "date": "18",
        "day": "Thursday",
        "breakfast": "Avocado Toast",
        "lunch": "Salad",
        "snacks": "Popcorn",
        "dinner": "Steak"
    },
    {
        "date": "19",
        "day": "Friday",
        "breakfast": "Muffin",
        "lunch": "Burger",
        "snacks": "Tacos",
        "dinner": "Fried Rice"
    },
    {
        "date": "20",
        "day": "Saturday",
        "breakfast": "Pancakes",
        "lunch": "Paneer Butter Masala",
        "snacks": "Ice Cream",
        "dinner": "Noodles"
    },
    {
        "date": "21",
        "day": "Sunday",
        "breakfast": "Smoothie Bowl",
        "lunch": "Chicken Wrap",
        "snacks": "Pav Bhaji",
        "dinner": "Pizza"
    },
    {
        "date": "22",
        "day": "Monday",
        "breakfast": "Scrambled Eggs",
        "lunch": "Sushi",
        "snacks": "Biscuits",
        "dinner": "BBQ Ribs"
    },
    {
        "date": "23",
        "day": "Tuesday",
        "breakfast": "Granola",
        "lunch": "Spaghetti",
        "snacks": "Chips and Salsa",
        "dinner": "Fajitas"
    },
    {
        "date": "24",
        "day": "Wednesday",
        "breakfast": "French Toast",
        "lunch": "Pulav",
        "snacks": "Cupcakes",
        "dinner": "Tandoori Chicken"
    },
    {
        "date": "25",
        "day": "Thursday",
        "breakfast": "Breakfast Burrito",
        "lunch": "Falafel",
        "snacks": "Cheese Balls",
        "dinner": "Grilled Fish"
    },
    {
        "date": "26",
        "day": "Friday",
        "breakfast": "Crepes",
        "lunch": "Tacos",
        "snacks": "Pani Puri",
        "dinner": "Stuffed Peppers"
    },
    {
        "date": "27",
        "day": "Saturday",
        "breakfast": "Bagel",
        "lunch": "Chicken Curry",
        "snacks": "Nachos",
        "dinner": "Mutton Curry"
    },
    {
        "date": "28",
        "day": "Sunday",
        "breakfast": "Fruit Salad",
        "lunch": "Paneer Tikka",
        "snacks": "Chole Kulche",
        "dinner": "Lasagna"
    },
    {
        "date": "29",
        "day": "Monday",
        "breakfast": "Waffles",
        "lunch": "Caesar Salad",
        "snacks": "Veg Rolls",
        "dinner": "Chicken Biryani"
    },
    {
        "date": "30",
        "day": "Tuesday",
        "breakfast": "Muesli",
        "lunch": "Quinoa Salad",
        "snacks": "Dhokla",
        "dinner": "Pulled Pork"
    },
    {
        "date": "31",
        "day": "Wednesday",
        "breakfast": "Oatmeal",
        "lunch": "Grilled Cheese Sandwich",
        "snacks": "Onion Rings",
        "dinner": "Lamb Chops"
    }
];

module.exports = { data: sampleMessMenu };