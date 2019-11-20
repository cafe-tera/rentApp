// ===========================
//  Puerto
// ===========================
process.env.PORT = process.env.PORT || 3000

// ===========================
//  Entonrno
// ===========================
process.env.NODE_ENV = process.env.NODE_ENV || 'dev'

// ===========================
//  Base de datos
// ===========================
let urlBD

if (process.env.NODE_ENV === 'dev') {
    urlBD = 'mongodb://localhost:27017/te'
} else {
    urlBD = 'mongodb+srv://admin:hlIWOStlmhZg4vpI@cafe-gnsby.mongodb.net/cafe'
}

process.env.URLDB = urlBD