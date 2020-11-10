const express = require('express');
const router = express.Router();
const auth = require('../middlewares/auth');
const { postRegister, 
        postLogin, 
        deleteUser, 
        getUserDetails } = require('../controllers/authControllers');
const { postMenuListItem, 
        getMenuList, 
        updateMenuListItem, 
        deleteMenuListItem } = require('../controllers/menuControllers');
const { getShopList } = require('../controllers/shopControllers');

router.get('/', (req,res) => {
    res.send('Hello World');
});


// --------> Distributor routes <--------
router.post('/register', postRegister) //Adding New Vendor
router.post('/login', postLogin) //Authenticate Vendor
router.post('/deleteUser/:user_id', auth, deleteUser) //Delete Distributor
router.get('/getDistributorInfo', auth, getUserDetails) //Get Distributor Details

// --------> Menu List routes <--------
router.get('/getMenuList/:vendor_id',auth, getMenuList) //Get MenuList of a vendor
router.post('/addItem/:vendor_id', auth, postMenuListItem) //Add MenuList of a vendor
router.patch('/updateItem/:item_id',auth, updateMenuListItem) //Update Menu items
router.delete('/deleteItem/:item_id',auth, deleteMenuListItem) //Delete Menu Item

// --------> Shop List routes <--------
router.get('/getShopList', getShopList) //Update Shop List

module.exports = router