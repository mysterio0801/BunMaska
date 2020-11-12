require('dotenv').config()

module.exports = {
    secret: process.env.SECRET_KEY,
    database: process.env.MONGO_URI
}