const express = require('express');
const actions = require('../methods/actions');
const router = express.Router();

router.get('/', (req,res) => {
    res.send('Hello World');
});

//Adding New Vender

router.post('/addvendor', actions.addNew)

module.exports = router