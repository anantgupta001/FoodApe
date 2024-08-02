const xlsx = require("xlsx");
const fs = require("fs");
const wb = xlsx.readFile("./Mess_Menu.xlsx", { dateNF: "dd/mm/yyyy" });
console.log(wb.SheetNames);
const ws = wb.Sheets["SPL"];
console.log(ws);
const data = xlsx.utils.sheet_to_json(ws, { raw: false });

const transformData = (mealData) => {
  return mealData.map((entry) => {
    return {
      ...entry,
      BREAKFAST: entry.BREAKFAST.split(',').map(item => item.trim()),
      LUNCH: entry.LUNCH.split(',').map(item => item.trim()),
      SNACKS: entry.SNACKS.split(',').map(item => item.trim()),
      DINNER: entry.DINNER.split(',').map(item => item.trim())
    };
  });
};

const transformedData = transformData(data);

fs.writeFileSync('./messjsona.json', JSON.stringify(transformedData, null, 2));