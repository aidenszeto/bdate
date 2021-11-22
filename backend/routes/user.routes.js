const express = require("express");
const router = express.Router();
const bodyParser = require("body-parser");

const User = require("../services/user.service");

router.get("/all", User.getAllUsers);
router.post("/signup", User.addUser);
router.get("/get/:_id", User.getUser);
router.post("/login", User.loginUser);

module.exports = router;
