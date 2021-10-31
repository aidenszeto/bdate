const User = require("../models/user.model");

const getAllUsers = async () => {
    const users = await User.find()
        .catch((err) => {
            console.log(err)
        })
}

module.exports = { getAllUsers }