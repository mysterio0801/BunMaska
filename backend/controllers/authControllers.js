var Distributor = require('../models/user')
var jwt = require('jsonwebtoken')
var config = require('../config/dbConfig')

// Post register distributor
exports.postRegister = (req, res) => {
    if ((!req.body.ownerName) || (!req.body.password) || (!req.body.address) || (!req.body.contact) || (!req.body.email) || (!req.body.shopName) ){
        res.json({success: false, msg: 'Enter all fields'})
    } else {
        var newUser = Distributor({
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
}

// Post login distributor
exports.postLogin = (req, res) => {
    Distributor.findOne({
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
                            token,
                        })
                    })
                }
                else {
                    return res.status(403).send({success: false, msg: 'Authentication failed, wrong pasword'})
                }
            })
        }
    })
}

// delete distributor
exports.deleteUser = async (req, res) => {
    try{
        const deletedItem = await Distributor.remove({
            _id: req.user._id
        });
        res.json({deletedItem});
    }
    catch(err){
        res.json({
            message: err
        });
    }
}

// get distributor details
exports.getUserDetails = (req, res) => {
    const distributor = req.user
    res.json({distributor})
}

// update distributor details
exports.updateUserDetails = async (req,res) => {
    console.log(req.user._id)
    try {
        const updatedDetails = await Distributor.updateOne(
            {
                _id: req.user._id,
            },
            {
                $set: {
                    ownerName: req.body.ownerName,
                    shopName: req.body.shopName,
                    address: req.body.address,
                    contact: req.body.contact
                }
            }
        );
        res.json({updatedDetails});
    } catch (err) {
        res.json({
            message: err
        });
    }
}