var mongoose = require('mongoose');
var Schema = mongoose.Schema;

var menuSchema = new Schema(
    {
        dishName: {
            type: String,
            require: true
        },
        description: {
            type: String
        },
        availability_present: {
            type: Boolean,
            require: true
        },
        vendor_id: {
            type: mongoose.Schema.Types.ObjectId,
            ref: "Vendor"
        },
    },
    {
        timestamps: true,
    }
)

module.exports = mongoose.model("MenuList", menuSchema);