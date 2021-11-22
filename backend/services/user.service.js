const User = require("../models/user.model");
const nodemailer = require("nodemailer");

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
  if (!email.endsWith("ucla.edu")) {
    res.send(400, {
      error:
        "Users must use their UCLA school email when registering their accounts",
    });
  }

  await sendVerificationEmail(email);

  user
    .save()
    .then((user) => {
      res.send(user);
    })
    .catch((err) => {
      console.log(err);
      res.send(err);
    });
};

const verifyUser = async (req, res) => {
  User.findOneAndUpdate({email: req.params.email}, {$set: {verified: true}})
    .then((status) => {
      res.send(status);
    })
    .catch((err) => {
      res.send(err);
    });
};

//liked by and disliked by insertion. add match in the liked one as well

const updateLikedBy = async (req, res) => {
  const {user, likedUser} = req.body;

  User.findByIdAndUpdate(likedUser, {$push: {likedBy: user}})
    .then((status) => {
      console.log(status);
      // if (!status.acknowledged)
      //   res.status(404).send({
      //     error: `Could not update user's likedBy array with id ${user}`,
      //   });

      // Go through liked person's array and if they liked the current user, add each other to their "matches" array
      User.findById(user, "likedBy")
        .then((currentUser) => {
          if (currentUser.likedBy.includes(likedUser)) {
            addToMatchesList(user, likedUser);
          }
        })
        .catch((err) => res.send(err));

      res.send(status);
    })
    .catch((err) => {
      res.send(err);
    });
};

//idk what to do within the .then and the .catch blocks here
const addToMatchesList = async (user1, user2) => {
  User.findByIdAndUpdate(user1, {$push: {matches: user2}})
    .then((res) => {
      //console.log(res)
    })
    .catch((err) => {
      //console.log(err)
    });

  User.findByIdAndUpdate(user2, {$push: {matches: user1}})
    .then((res) => {
      //console.log(res)
    })
    .catch((err) => {
      //console.log(err)
    });
};

const updateDislikedBy = async (req, res) => {
  const {user, dislikedUser} = req.body;

  User.findByIdAndUpdate(dislikedUser, {$push: {dislikedBy: user}})
    .then((status) => {
      res.send(status);
    })
    .catch((err) => {
      res.send(err);
    });
};

const getUser = async (req, res) => {
  const {_id} = req.params;

  User.findById(_id)
    .then((user) => {
      res.send(user);
    })
    .catch((err) => {
      res.send(err);
    });
};

const loginUser = async (req, res) => {
  const {email, password} = req.body;

  User.findOne({
    email,
    password,
  })
    .then((user) => {
      res.send(user);
    })
    .catch((err) => {
      res.send(401, "Invalid login credentials");
    });
};

const sendVerificationEmail = async (email) => {
  let testEmail = await nodemailer.createTestAccount();
  console.log(testEmail);

  let transporter = nodemailer.createTransport({
    service: "gmail",
    auth: {
      user: "bdateucla@gmail.com",
      pass: "uhzs mvoc radm agzh",
    },
  });

  let verificationUrl = `http://localhost:8080/user/verify/${email}`;
  email = "zasaimster@gmail.com";

  let info = await transporter.sendMail({
    from: '"BDate verification" <verify@bdate.com>', // sender address
    to: `${email}`, // list of receivers
    subject: "Verify your Bdate Account!", // Subject line
    text: "Click on the link below to verify your email!",
    html: `<a href='${verificationUrl}'>Verify!</a>`,
  });

  console.log(info);
};

module.exports = {
  getAllUsers,
  addUser,
  getUser,
  loginUser,
  verifyUser,
  updateLikedBy,
  updateDislikedBy,
};
