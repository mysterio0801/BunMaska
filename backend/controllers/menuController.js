var MenuList = require('../models/menu')

// Post menu list item
exports.postMenuListItem = async (req,res) => {
    const menuList = new MenuList({
        dishName: req.body.dishName,
        description: req.body.description,
        availability_present: req.body.availability_present,
        vendor_id: req.params.vendor_id
    });

    try {
        const SavedMenuList = await menuList.save();
        res.json(SavedMenuList);
    } catch (err) {
        res.json({
            message: err
        });
    }
}

//Get menu list
exports.getMenuList = async function(req, res){
    try {
        const menuList = await MenuList.find({vendor_id: req.params.vendor_id});
        res.json({menuList});
    } catch (err) {
        res.json({ message: err });
    }
}

//Update menu list item
exports.updateMenuListItem = async (req,res) => {
    try {
        const updatedList = await MenuList.updateOne(
            {
                _id: req.params.menu_id,
            },
            {
                $set: {
                    dishName: req.body.dishName,
                    description: req.body.description,
                    availability_present: req.body.availability_present,
                }
            }
        );
        res.json({updatedList});
    } catch (err) {
        res.json({
            message: err
        });
    }
}

// Delete menu list item
exports.deleteMenuListItem = async (req,res) => {
    try{
        const deletedItem = await MenuList.remove({
            _id: req.params.menu_id
        });
        res.json({deletedItem});
    }
    catch(err){
        res.json({
            message: err
        });
    }
}