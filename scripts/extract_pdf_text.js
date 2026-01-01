const fs = require('fs');
const pdf = require('pdf-parse');
const path = require('path');

const logFile = 'C:\\Users\\notos\\kanei_quest\\extraction.log';
// Clear log file
try { fs.writeFileSync(logFile, ''); } catch (e) { }

function log(msg) {
    try {
        console.log(msg); // Also log to console for debugging if it works
        fs.appendFileSync(logFile, msg + '\n');
    } catch (e) { }
}

log(`Starting extraction process...`);
log(`Type of pdf: ${typeof pdf}`);
if (typeof pdf === 'object') {
    log(`Keys of pdf: ${Object.keys(pdf).join(', ')}`);
}

// Use relative paths from script execution
const pdfDir = path.resolve(__dirname, '../過去問題');
const outputDir = path.resolve(__dirname, '../docs/past_exam_feature/extracted_text');

log(`PDF Directory: ${pdfDir}`);
log(`Output Directory: ${outputDir}`);

if (!fs.existsSync(outputDir)) {
    fs.mkdirSync(outputDir, { recursive: true });
}

async function extractText(filename) {
    const filePath = path.join(pdfDir, filename);
    log(`Reading file: ${filePath}`);

    if (!fs.existsSync(filePath)) {
        log(`File not found: ${filePath}`);
        return;
    }

    try {
        const stats = fs.statSync(filePath);
        log(`File size: ${stats.size} bytes`);
        const fd = fs.openSync(filePath, 'r');
        const buffer = Buffer.alloc(20);
        fs.readSync(fd, buffer, 0, 20, 0);
        log(`First 20 bytes: ${buffer.toString('hex')}`);
        fs.closeSync(fd);
    } catch (e) {
        log(`File access error: ${e.message}`);
        return;
    }

    const dataBuffer = fs.readFileSync(filePath);

    try {
        log(`Calling pdf-parse on ${dataBuffer.length} bytes...`);
        const data = await pdf(dataBuffer);
        log(`PDF parsed successfully.`);
        const outputPath = path.join(outputDir, filename.replace('.pdf', '.txt'));
        fs.writeFileSync(outputPath, data.text);
        log(`Extracted text saved to: ${outputPath}`);
        log(`Text length: ${data.text.length}`);
    } catch (error) {
        log(`Error extracting ${filename}: ${error.message}`);
        if (error.stack) log(error.stack);
    }
}

// Loop through all PDF files
async function processAll() {
    const files = fs.readdirSync(pdfDir).filter(f => f.toLowerCase().endsWith('.pdf'));
    log(`Found ${files.length} PDF files.`);

    for (const file of files) {
        log(`Processing ${file}...`);
        await extractText(file);
    }
}

processAll();
