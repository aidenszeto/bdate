const User = require("../models/user.model");
const nodemailer = require('nodemailer')

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
  await sendVerificationEmail();
  
  const {
    firstName,
    lastName,
    email,
    password,
    age,
    gender,
    ethnicity,
    height,
    year,
    location,
    major,
    smoke,
    drink,
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
    age,
    gender,
    ethnicity,
    height,
    year,
    location,
    major,
    smoke,
    drink,
    instagram,
    snapchat,
    likedby,
    dislikedby,
    matches,
  });

  //@ucla.edu or @g.ucla.edu
  if(!email.endsWith("ucla.edu")){
    res.send(400, {error: "Users must use their UCLA school email when registering their accounts"})
  }

  user
    .save()
    .then((obj) => {
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

const sendVerificationEmail = async () => {
  let testEmail = await nodemailer.createTestAccount();
  console.log(testEmail);

  let transporter = nodemailer.createTransport({
    host: "smtp.ethereal.email",
    port: 587,
    secure: false,
    auth: {
      user: testAccount.user, 
      pass: testAccount.pass, 
    },
  });

  let info = await transporter.sendMail({
    from: '"Fred Foo 👻" <foo@example.com>', // sender address
    to: "bar@example.com, baz@example.com", // list of receivers
    subject: "Hello ✔", // Subject line
    text: "Hello world?", 
    html: "<b>Hello world?</b>", 
  });

}

module.exports = { getAllUsers, addUser, getUser };
