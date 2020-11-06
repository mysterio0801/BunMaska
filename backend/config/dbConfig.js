require('dotenv').config()

module.exports = {
    secret: 'yoursecret',
    database: process.env.MONGO_URI
}