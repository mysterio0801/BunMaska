const express = require('express');
const actions = require('../methods/actions');
const router = express.Router();
// const { verifyToken } = require('../middlewares/auth');
const auth = require('../middlewares/auth');

router.get('/', (req,res) => {
    res.send('Hello World');
});

//Adding New Vendor
router.post('/addUser', actions.addUser)

//Authenticate Vendor
router.post('/login', actions.login)

//Get Info of a Vendor
router.get('/getUserinfo', auth, actions.getUserInfo)

//Get MenuList of a vendor
router.get('/getMenuList',auth, actions.getMenuList)

//Add MenuList of a vendor
router.post('/addMenuList/:vendor_id', auth,actions.addMenuList)

//Update Menu items
router.patch('/updateItem/:menu_id',auth, actions.updateMenuList)

//Delete Menu Item
router.delete('/deleteItem/:menu_id',auth, actions.deleteMenu)


module.exports = router