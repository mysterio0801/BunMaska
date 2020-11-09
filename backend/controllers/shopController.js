var User = require('../models/user')

// Get shop list
exports.getShopList = async (req, res) => {
    try {
        const userList = await User.find();
        const shopList = userList.map(user => {
            return {
                shopName: user.shopName,
                userId: user._id
            }
        });
        res.json({shopList});
    } catch(error) {
        res.json({msg: error});
    }
}