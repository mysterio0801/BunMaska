const express = require('express');
const actions = require('../methods/actions');
const router = express.Router();
const passport = require('passport')
const { verifyToken } = require('../middlewares/auth')

router.get('/', (req,res) => {
    res.send('Hello World');
});

//Adding New Vendor
router.post('/addUser', actions.addUser)

//Authenticate Vendor
router.post('/login', actions.login)

//Get Info of a Vendor
router.get('/getUserinfo', verifyToken, actions.getUserInfo)

//Get MenuList of a vendor
router.get('/getMenuList',  actions.getMenuList)

//Add MenuList of a vendor
router.post('/addMenuList/:vendor_id', actions.addMenuList)

//Update Menu items
router.patch('/updateItem/:menu_id', actions.updateMenuList)

//Delete Menu Item
router.delete('/deleteItem/:menu_id', actions.deleteMenu)

router.post('/logout', actions.logout)


module.exports = router