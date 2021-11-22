const express = require("express");
const router = express.Router();
const bodyParser = require("body-parser");

const User = require("../services/user.service");

router.get("/all", User.getAllUsers);
router.get("/get/:_id", User.getUser);

router.post("/login", User.loginUser);
router.post("/signup", User.addUser);

router.put("/verify/:email", User.verifyUser);
router.put("/likeduser", User.updateLikedBy);
router.put("/dislikeduser", User.updateDislikedBy);

module.exports = router;
