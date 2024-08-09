const fs = require('fs');
const path = require('path');

const loadData = (filePath) => {
    return new Promise((resolve, reject) => {
        fs.readFile(filePath, 'utf8', (err, data) => {
            if (err) {
                console.error(`Error reading ${filePath} file:`, err);
                reject(err); // Reject the promise with the error
            }
            try {
                const parsedData = JSON.parse(data);
                resolve(parsedData); // Resolve the promise with the parsed data
            } catch (parseErr) {
                console.error(`Error parsing ${filePath} file:`, parseErr);
                reject(parseErr); // Reject the promise with the parse error
            }
        });
    });
};

const hostelDataPath = path.join(__dirname, '../src/hostel.json');
const messTypeDataPath = path.join(__dirname, '../src/messType.json');

const getValidHostels = async () => {
    const hostelData = await loadData(hostelDataPath);
    return hostelData.map(item => item.name);
};

const getValidMessTypes = async () => {
    const messTypeData = await loadData(messTypeDataPath);
    return messTypeData.map(item => item.mess);
};

module.exports = {
    getValidHostels,
    getValidMessTypes
};
