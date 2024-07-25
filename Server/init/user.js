const sampleUsers = [
    {
        "email": {
            "work": "jitendra.22bce8471@vitapstudent.ac.in"
        },
        "mobile": "9509210861",
        "regNo": "22BCE8471",
        "hosteler": true,
        "hostel": "MH1",
        "roomNo": "1124",
        "messType": "Veg",
        "likedFoods": ["64a7d6f0a50b1e1c30f43a11", "64a7d6f0a50b1e1c30f43a12"],
        "cart": ["64a7d6f0a50b1e1c30f43a13", "64a7d6f0a50b1e1c30f43a14"]
    },
    {
        "email": {
            "work": "ayush.22bce8472@vitapstudent.ac.in"
        },
        "mobile": "9509210862",
        "regNo": "22BCE8472",
        "hosteler": true,
        "hostel": "MH2",
        "roomNo": "305",
        "messType": "Non-Veg",
        "likedFoods": ["64a7d6f0a50b1e1c30f43a15", "64a7d6f0a50b1e1c30f43a16"],
        "cart": ["64a7d6f0a50b1e1c30f43a17", "64a7d6f0a50b1e1c30f43a18"]
    },
    {
        "email": {
            "work": "ankit.22bce8473@vitapstudent.ac.in"
        },
        "mobile": "9509210863",
        "regNo": "22BCE8473",
        "hosteler": true,
        "hostel": "MH3",
        "roomNo": "114",
        "messType": "Veg",
        "likedFoods": ["64a7d6f0a50b1e1c30f43a19", "64a7d6f0a50b1e1c30f43a1a"],
        "cart": ["64a7d6f0a50b1e1c30f43a1b", "64a7d6f0a50b1e1c30f43a1c"]
    },
    {
        "email": {
            "work": "yash.22bce8474@vitapstudent.ac.in"
        },
        "mobile": "9509210864",
        "regNo": "22BCE8474",
        "hosteler": true,
        "hostel": "MH4",
        "roomNo": "1127-A",
        "messType": "Non-Veg",
        "likedFoods": ["64a7d6f0a50b1e1c30f43a1d", "64a7d6f0a50b1e1c30f43a1e"],
        "cart": ["64a7d6f0a50b1e1c30f43a1f", "64a7d6f0a50b1e1c30f43a20"]
    },
    {
        "email": {
            "work": "kashish.22bce8475@vitapstudent.ac.in"
        },
        "mobile": "9509210865",
        "regNo": "22BCE8475",
        "hosteler": true,
        "hostel": "LH1",
        "roomNo": "1414",
        "messType": "Veg",
        "likedFoods": ["64a7d6f0a50b1e1c30f43a21", "64a7d6f0a50b1e1c30f43a22"],
        "cart": ["64a7d6f0a50b1e1c30f43a23", "64a7d6f0a50b1e1c30f43a24"]
    },
    {
        "email": {
            "work": "somya.22bce8476@vitapstudent.ac.in"
        },
        "mobile": "9509210866",
        "regNo": "22BCE8476",
        "hosteler": true,
        "hostel": "LH2",
        "roomNo": "1334",
        "messType": "Non-Veg",
        "likedFoods": ["64a7d6f0a50b1e1c30f43a25", "64a7d6f0a50b1e1c30f43a26"],
        "cart": ["64a7d6f0a50b1e1c30f43a27", "64a7d6f0a50b1e1c30f43a28"]
    },
    {
        "email": {
            "work": "vineeta.22bce8477@vitapstudent.ac.in"
        },
        "mobile": "9509210867",
        "regNo": "22BCE8477",
        "hosteler": true,
        "hostel": "LH1",
        "roomNo": "1224",
        "messType": "Veg",
        "likedFoods": ["64a7d6f0a50b1e1c30f43a29", "64a7d6f0a50b1e1c30f43a2a"],
        "cart": ["64a7d6f0a50b1e1c30f43a2b", "64a7d6f0a50b1e1c30f43a2c"]
    },
    {
        "email": {
            "work": "umar.22bce8478@vitapstudent.ac.in"
        },
        "mobile": "9509210868",
        "regNo": "22BCE8478",
        "hosteler": true,
        "hostel": "MH5",
        "roomNo": "1114",
        "messType": "Non-Veg",
        "likedFoods": ["64a7d6f0a50b1e1c30f43a2d", "64a7d6f0a50b1e1c30f43a2e"],
        "cart": ["64a7d6f0a50b1e1c30f43a2f", "64a7d6f0a50b1e1c30f43a30"]
    },
    {
        "email": {
            "work": "sudhanshu.22bce8479@vitapstudent.ac.in"
        },
        "mobile": "9509210869",
        "regNo": "22BCE8479",
        "hosteler": true,
        "hostel": "MH3",
        "roomNo": "124",
        "messType": "Veg",
        "likedFoods": ["64a7d6f0a50b1e1c30f43a31", "64a7d6f0a50b1e1c30f43a32"],
        "cart": ["64a7d6f0a50b1e1c30f43a33", "64a7d6f0a50b1e1c30f43a34"]
    },
    {
        "email": {
            "work": "anant.22bce8480@vitapstudent.ac.in"
        },
        "mobile": "9509210870",
        "regNo": "22BCE8480",
        "hosteler": true,
        "hostel": "MH3",
        "roomNo": "374",
        "messType": "Non-Veg",
        "likedFoods": ["64a7d6f0a50b1e1c30f43a35", "64a7d6f0a50b1e1c30f43a36"],
        "cart": ["64a7d6f0a50b1e1c30f43a37", "64a7d6f0a50b1e1c30f43a38"]
    }
];

module.exports = { data: sampleUsers };