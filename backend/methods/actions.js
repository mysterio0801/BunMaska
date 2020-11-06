var User = require('../models/user')
var jwt = require('jwt-simple')
var config = require('../config/dbConfig')

var functions = {
    addNew: function (req, res) {
        if ((!req.body.name) || (!req.body.password) || (!req.body.address) || (!req.body.contact)){
            res.json({success: false, msg: 'Enter all fields'})
        } else {
            var newUser = User({
                name: req.body.name,
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
}

module.exports = functions