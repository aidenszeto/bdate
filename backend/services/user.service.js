const User = require("../models/user.model");

const getAllUsers = async (req, res) => {
  User.find()
    .then((users) => {
      res.send(users);
    })
    .catch((err) => {
      console.log("Error: ", err);
    });
};

const addUser = async (req, res) => {
  console.log(req.body);
};

module.exports = {getAllUsers, addUser};
