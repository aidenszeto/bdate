const express = require("express");
const router = express.Router();

const User = require("../services/user.service")

router.get("/all", User.getAllUsers)

module.exports = router