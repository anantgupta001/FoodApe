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

const getUniqueItems = (sourceArray, comparisonArray) => {
    const comparisonSet = new Set(comparisonArray.map(item => item.toLowerCase()));
    return sourceArray.filter(item => !comparisonSet.has(item.toLowerCase()));
};

try {
    let workbook = xlsx.readFile("./MH_JULY_MENU.xlsx", { dateNF: "dd/mm/yyyy" });
    let worksheetVNVG = workbook.Sheets["NV&VEG"];
    let worksheetSPL = workbook.Sheets["SPL"];
    
    let dataVNVG = xlsx.utils.sheet_to_json(worksheetVNVG, { header: 2, raw: false });
    let dataSPL = xlsx.utils.sheet_to_json(worksheetSPL, { header: 2, raw: false });

    dataVNVG = dataVNVG.map((row, index) => {
        const daysValue = cleanValue(row["VIT AP UNIVERSITY MEN`S HOSTELS, AMARAVATI"]);
        const parts = daysValue.split(/\s+(?=\d)/);
        const day = parts[0];
        const dates = formatDate(parts[1]);

        const breakfastItems = cleanCommaSpacing(capitalizeWords(cleanValue(row["__EMPTY"])));
        const lunchItems = cleanCommaSpacing(capitalizeWords(cleanValue(row["__EMPTY_4"])));
        const snacksItems = cleanCommaSpacing(capitalizeWords(cleanValue(row["__EMPTY_8"])));
        const dinnerItems = cleanCommaSpacing(capitalizeWords(cleanValue(row["__EMPTY_10"])));

        const splBreakfastItems = cleanCommaSpacing(capitalizeWords(cleanValue(dataSPL[index]?.["__EMPTY"] || "")));
        const splLunchItems = cleanCommaSpacing(capitalizeWords(cleanValue(dataSPL[index]?.["__EMPTY_4"] || "")));
        const splSnacksItems = cleanCommaSpacing(capitalizeWords(cleanValue(dataSPL[index]?.["__EMPTY_8"] || "")));
        const splDinnerItems = cleanCommaSpacing(capitalizeWords(cleanValue(dataSPL[index]?.["__EMPTY_10"] || "")));

        return dates.map(date => ({
            DAY: capitalizeWords(cleanValue(day)),
            DATE: date,
            BREAKFAST: {
                NonSpl: breakfastItems,
                Spl: getUniqueItems(splBreakfastItems, breakfastItems)
            },
            LUNCH: {
                NonSpl: lunchItems,
                Spl: getUniqueItems(splLunchItems, lunchItems)
            },
            SNACKS: {
                NonSpl: snacksItems,
                Spl: getUniqueItems(splSnacksItems, snacksItems)
            },
            DINNER: {
                NonSpl: dinnerItems,
                Spl: getUniqueItems(splDinnerItems, dinnerItems)
            }
        }));
    }).flat();
    
    dataVNVG = dataVNVG.slice(2);
    fs.writeFileSync('./messjson.json', JSON.stringify(dataVNVG, null, 2));

    console.log("Data successfully written to messjson.json");
} 
catch (error) {
    console.error("Error processing the Excel file:", error);
}
