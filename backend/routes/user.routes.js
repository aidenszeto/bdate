const express = require("express");
const router = express.Router();

const User = require("../services/user.service");

router.get("/all", User.getAllUsers);
router.get("/get/:_id", User.getUser);

router.post("/login", User.loginUser);
router.post("/signup", User.addUser);
router.put("/update/:_id", User.updateUser);

router.put("/verify", User.verifyUser);
router.put("/likeduser", User.updateLikedBy);
router.put("/dislikeduser", User.updateDislikedBy);
router.post("/filter", User.filterUsers);

module.exports = router;
