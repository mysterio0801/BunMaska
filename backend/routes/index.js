const express = require('express');
const actions = require('../methods/actions');
const router = express.Router();

router.get('/', (req,res) => {
    res.send('Hello World');
});

//Adding New Vendor

router.post('/addvendor', actions.addNew)

//Authenticate Vendor

router.post('/authenticate', actions.authenticate)

module.exports = router