const mongoose = require('mongoose')
const dbConfig = require('./dbConfig')

const connectDB = async() => {
    try {
        const conn = await mongoose.connect(dbConfig.database, {
            useNewUrlParser: true,
            useUnifiedTopology: true
        })
        console.log(`Mognodb connected: ${conn.connection.host}`);
    } catch (err) {
        console.log(err)
        process.exit()
    }
}

module.exports = connectDB