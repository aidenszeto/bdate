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
  const {
    firstName,
    lastName,
    email,
    password,
    dateOfBirth,
    gender,
    ethnicity,
    height,
    year,
    location,
    major,
    smoke,
    drink,
    preferences,
    instagram,
    snapchat,
    likedby,
    dislikedby,
    matches,
  } = req.body;

  const user = new User({
    firstName,
    lastName,
    email,
    password,
    dateOfBirth,
    gender,
    ethnicity,
    height,
    year,
    location,
    major,
    smoke,
    drink,
    preferences,
    instagram,
    snapchat,
    likedby,
    dislikedby,
    matches,
  });
  user
    .save()
    .then((obj) => {
      console.log("saved object", obj);
      res.send(obj);
    })
    .catch((err) => {
      console.log(err);
      res.send(err);
    });
};

module.exports = {getAllUsers, addUser};
