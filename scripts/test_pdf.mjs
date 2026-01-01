import fs from 'fs';
import pdf from 'pdf-parse';
import path from 'path';
import { fileURLToPath } from 'url';

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

console.log('Imported pdf:', pdf);
console.log('Type:', typeof pdf);

const pdfDir = path.resolve(__dirname, '../過去問題');
const targetFile = 'kokushi38.pdf';
const filePath = path.join(pdfDir, targetFile);

if (fs.existsSync(filePath)) {
    const dataBuffer = fs.readFileSync(filePath);
    try {
        const data = await pdf(dataBuffer);
        console.log('Success! Text length:', data.text.length);
    } catch (e) {
        console.error('Error calling pdf():', e);
        if (typeof pdf === 'object' && pdf.default) {
            try {
                const data2 = await pdf.default(dataBuffer);
                console.log('Success with default! Text length:', data2.text.length);
            } catch (e2) {
                console.error('Error calling pdf.default():', e2);
            }
        }
    }
} else {
    console.log('File not found:', filePath);
}
