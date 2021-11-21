const express = require("express");
const router = express.Router();
const bodyParser = require("body-parser");

const User = require("../services/user.service");

router.get("/all", User.getAllUsers);
router.post("/add", User.addUser);

module.exports = router;
