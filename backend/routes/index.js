const express = require('express');
const actions = require('../methods/actions');
const router = express.Router();

router.get('/', (req,res) => {
    res.send('Hello World');
});

//Adding New Vendor
router.post('/addUser', actions.addUser)

//Authenticate Vendor
router.post('/authenticate', actions.authenticate)

//Get Info of a Vendor
router.get('/getUserinfo', actions.getUserInfo)

//Get MenuList of a vendor
router.get('/getMenuList',actions.getMenuList)

//Add MenuList of a vendor
router.post('/addMenuList/:vendor_id', actions.addMenuList)

//Update Menu items
router.patch('/updateItem/:menu_id', actions.updateMenuList)

//Delete Menu Item
router.delete('/deleteItem/:menu_id', actions.deleteMenu)

module.exports = router