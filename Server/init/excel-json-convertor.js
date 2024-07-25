const xlsx = require("xlsx");
const fs = require("fs");

const cleanValue = (value) => {
    if (typeof value === 'string') {
        return value.replace(/[\r\n]+/g, ' ').replace(/\s+/g, ' ').trim();
    }
    return value;
};

const capitalizeWords = (value) => {
    if (typeof value === 'string') {
        return value
            .toLowerCase()
            .replace(/\b\w/g, char => char.toUpperCase());
    }
    return value;
};

const formatDate = (dates) => {
    return dates ? cleanValue(dates).split(',').map(date => date.trim()) : [];
};

const cleanCommaSpacing = (value) => {
    if (typeof value === 'string') {
        return value.split(',').map(item => item.trim()).filter(item => item);
    }
    return [];
};

try {
    let workbook = xlsx.readFile("./MH_JULY_MENU.xlsx", { dateNF: "dd/mm/yyyy" });
    let worksheet = workbook.Sheets["SPL"];
    let data = xlsx.utils.sheet_to_json(worksheet, { header: 2, raw: false });
    data = data.map(row => {
        const daysValue = cleanValue(row["VIT AP UNIVERSITY MEN`S HOSTELS, AMARAVATI"]);
        const parts = daysValue.split(/\s+(?=\d)/);
        const day = parts[0];
        const dates = parts[1];

        return {
            DAY: capitalizeWords(cleanValue(day)),
            DATE: formatDate(dates),
            BREAKFAST: cleanCommaSpacing(capitalizeWords(cleanValue(row["__EMPTY"]))),
            LUNCH: cleanCommaSpacing(capitalizeWords(cleanValue(row["__EMPTY_4"]))),
            SNACKS: cleanCommaSpacing(capitalizeWords(cleanValue(row["__EMPTY_8"]))),
            DINNER: cleanCommaSpacing(capitalizeWords(cleanValue(row["__EMPTY_10"])))
        };
    });
    data = data.slice(2);
    fs.writeFileSync('./messjson.json', JSON.stringify(data, null, 2));

    console.log("Data successfully written to messjsons.json");
} 
catch (error) {
    console.error("Error processing the Excel file:", error);
}
