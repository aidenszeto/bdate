const User = require("../models/user.model");
const nodemailer = require("nodemailer");

const getAllUsers = async (req, res) => {
  User.find()
    .then((users) => {
      res.send(users);
    })
    .catch((err) => {
      res.send(err);
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
  User.findOneAndUpdate(
    { email: req.params.email },
    { $set: { verified: true } }
  )
    .then((status) => {
      res.send(status);
    })
    .catch((err) => {
      res.send(err);
    });
};

const updateLikedBy = async (req, res) => {
  const { user, likedUser } = req.body;

  User.findByIdAndUpdate(likedUser, { $push: { likedBy: user } })
    .then((status) => {
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
  User.findByIdAndUpdate(user1, { $push: { matches: user2 } })
    .then((res) => {
      //console.log(res)
    })
    .catch((err) => {
      //console.log(err)
    });

  User.findByIdAndUpdate(user2, { $push: { matches: user1 } })
    .then((res) => {
      //console.log(res)
    })
    .catch((err) => {
      //console.log(err)
    });
};

const updateDislikedBy = async (req, res) => {
  const { user, dislikedUser } = req.body;

  User.findByIdAndUpdate(dislikedUser, { $push: { dislikedBy: user } })
    .then((status) => {
      res.send(status);
    })
    .catch((err) => {
      res.send(err);
    });
};

const getUser = async (req, res) => {
  const { _id } = req.params;

  User.findById(_id)
    .then((user) => {
      res.send(user);
    })
    .catch((err) => {
      res.send(err);
    });
};

const loginUser = async (req, res) => {
  const { email, password } = req.body;

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

const filterUsers = async (req, res) => {
  const {
    whoToDate, // array
    year, // array
    location, // array,
    drink, // bool
    smoke, // bool
  } = req.body;

  filtered = [];

  User.find()
    .then((users) => {
      users.filter((user) => {
        if (
          (whoToDate.length === 0 || whoToDate.includes(user.gender)) &&
          (year.length === 0 || year.includes(user.year)) &&
          (location.length === 0 || location.includes(user.location)) &&
          drink == user.drink &&
          smoke == user.smoke
        ) {
          filtered.push(user);
          return true;
        }
      });
      res.send(filtered);
    })
    .catch((err) => {
      res.send(err);
    });
};

const sendVerificationEmail = async (email) => {
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
};

module.exports = {
  getAllUsers,
  addUser,
  getUser,
  loginUser,
  filterUsers,
  verifyUser,
  updateLikedBy,
  updateDislikedBy,
};
