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

const getUser = async (req, res) => {
  const {
    _id,
  } = req.params

  User.findById(_id)
    .then((user) => {
      res.send(user)
    })
    .catch((err) => {
      res.send(err)
    })
};

const loginUser = async(req, res) => {
  const {
    email,
    password
  } = req.body

  User.findOne({
    email,
    password
  })
    .then((user) => {
      res.send(user)
    })
    .catch((err) => {
      res.send(401, "Invalid login credentials")
    })
}

module.exports = { getAllUsers, addUser, getUser, loginUser };
