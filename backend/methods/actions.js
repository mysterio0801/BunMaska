var User = require('../models/user')
var jwt = require('jsonwebtoken')
var config = require('../config/dbConfig')
var MenuList = require('../models/menu')

var functions = {
    addUser: function (req, res) {
        if ((!req.body.ownerName) || (!req.body.password) || (!req.body.address) || (!req.body.contact) || (!req.body.email) || (!req.body.shopName) ){
            res.json({success: false, msg: 'Enter all fields'})
        } else {
            var newUser = User({
                email: req.body.email,
                shopName: req.body.shopName,
                ownerName: req.body.ownerName,
                password: req.body.password,
                contact: req.body.contact,
                address: req.body.address
            });
            newUser.save(function (err, newUser) {
                if (err) {
                    res.json({success: false, msg: 'Failed to save'})
                }
                else {
                    res.json({success: true, msg: 'Successfully saved'})
                }
            })
        }
    },
    login: function (req, res) {
        User.findOne({
            email: req.body.email
        }, function (err, user){
            if (err) throw err;
            if(!user) {
                res.status(403).send({success: false, msg: 'Authentication Failed, User not found'})
            } else {
                user.comparePassword(req.body.password, function (err, isMatch) {
                    if (isMatch && !err) {
                        var token = jwt.sign({user}, config.secret, (err, token) => {
                            res.json({
                                token
                            })
                        })
                    }
                    else {
                        return res.status(403).send({success: false, msg: 'Authentication failed, wrong pasword'})
                    }
                })
            }
        })
    },
    getUserInfo: function(req, res) {
        res.json({user: req.user})
    },
    getMenuList: async function(req, res){
        try {
            const menuList = await MenuList.find();
            res.json(menuList,{user: req.user});
        } catch (err) {
            res.json({ message: err });
        }
    },
    addMenuList: async function(req,res){
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
    },
    updateMenuList: async function(req,res) {
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
            res.json(updatedList);
        } catch (err) {
            res.json({
                message: err
            });
        }
    },
    deleteMenu: async function(req,res){
        try{
            const deletedItem = await MenuList.remove({
                _id: req.params.menu_id
            });
            res.json(deletedItem);
        }
        catch(err){
            res.json({
                message: err
            });
        }
    }
}

module.exports = functions