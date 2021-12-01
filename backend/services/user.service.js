const nodemailer = require("nodemailer");

const User = require("../models/user.model");

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
    photo,
  } = req.body;

  const verificationNumber = Math.floor(100000 + Math.random() * 900000);
  const photoToAdd = photo.length === 0 ? null : photo;
  console.log(photoToAdd);
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
    verificationNumber,
    photo: photoToAdd,
  });

  //@ucla.edu or @g.ucla.edu
  if (!email.endsWith("ucla.edu")) {
    res.send(
      400,
      "Users must use their UCLA school email when registering their accounts"
    );
    return;
  }

  await sendVerificationEmail(email, verificationNumber);

  user
    .save()
    .then((user) => {
      res.send(user);
    })
    .catch((err) => {
      res.status(400).send("Couldn't sign up user");
    });
};

const updateUser = async (req, res) => {
  const { _id } = req.params;
  const update = req.body;

  User.findOneAndUpdate({ _id }, update, { new: true })
    .then((user) => {
      res.send(user);
    })
    .catch((err) => {
      res.send(400, "Couldn't update user");
    });
};

const verifyUser = async (req, res) => {
  const { email, verificationNumber } = req.body;

  User.findOneAndUpdate(
    {
      email,
      verificationNumber,
    },
    { $set: { verified: true } }
  )
    .then((status) => {
      if (!status) {
        res.status(400).send("Incorrect verification code");
      } else {
        res.send(status);
      }
    })
    .catch((err) => {
      res.send(err);
    });
};

const updateLikedBy = async (req, res) => {
  const { user, likedUser } = req.body;

  User.findByIdAndUpdate(likedUser, { $addToSet: { likedBy: user } })
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

//there isn't much to do in the .then and the .catch blocks here
const addToMatchesList = async (user1, user2) => {
  User.findByIdAndUpdate(user1, { $addToSet: { matches: user2 } })
    .then((res) => {
      //console.log(res)
    })
    .catch((err) => {
      //console.log(err)
    });

  User.findByIdAndUpdate(user2, { $addToSet: { matches: user1 } })
    .then((res) => {
      //console.log(res)
    })
    .catch((err) => {
      //console.log(err)
    });
};

const updateDislikedBy = async (req, res) => {
  const { user, dislikedUser } = req.body;

  User.findByIdAndUpdate(dislikedUser, { $addToSet: { dislikedBy: user } })
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
      if (!user) {
        res.send(400, "Invalid login credentials");
      }
      res.send(user);
    })
    .catch((err) => {
      res.send(500, "Error with request");
    });
};

const filterUsers = async (req, res) => {
  const {
    whoToDate, // array
    year, // array
    location, // array,
    drink, // bool
    smoke, // bool,
    userId, // string
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
          smoke == user.smoke &&
          user.verified &&
          String(user._id) !== String(userId)
        ) {
          let newUser = true;
          for (let i = 0; i < user.likedBy.length; i++) {
            if (String(user.likedBy[i]) == String(userId)) {
              newUser = false;
            }
          }
          for (let i = 0; i < user.dislikedBy.length; i++) {
            if (String(user.dislikedBy[i]) == String(userId)) {
              newUser = false;
            }
          }
          if (newUser) {
            filtered.push(user);
          }
          return true;
        }
      });
      res.send(filtered);
    })
    .catch((err) => {
      res.send(err);
    });
};

const sendVerificationEmail = async (email, verificationNumber) => {
  let transporter = nodemailer.createTransport({
    service: "gmail",
    auth: {
      user: "bdateucla@gmail.com",
      pass: "uhzs mvoc radm agzh",
    },
  });

  let info = await transporter.sendMail({
    from: '"Bdate verification" <verify@bdate.com>', // sender address
    to: `${email}`, // list of receivers
    subject: "Welcome to Bdate!", // Subject line
    text: "Enter the following code in the Bdate App",
    html: `<p> Your verification code is ${verificationNumber}</p>`,
  });
};

module.exports = {
  getAllUsers,
  addUser,
  getUser,
  loginUser,
  updateUser,
  filterUsers,
  verifyUser,
  updateLikedBy,
  updateDislikedBy,
};
