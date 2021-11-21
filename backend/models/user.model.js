const mongoose = require("mongoose");
const Preferences = require("./preferences.model");
const Schema = mongoose.Schema;

const {String, Array} = Schema.Types;

/**
 * User model:
        Id 
        first name - required
        Email - required
        password - required
        instagram - optional
        snap - optional,
        dob
        attributes (separate object)
        Preferences (separate object)
        likedBy 
        dislikedBy 
        matches
 */

const UserSchema = new Schema({
  firstName: {
    type: String,
    required: [true, "First name cannot be blank"],
  },
  lastName: {
    type: String,
    required: [true, "Last name cannot be blank"],
  },
  email: {
    type: String,
    index: {unique: true},
    required: [true, "Email cannot be blank"],
  },
  password: {
    type: String,
    required: [true, "Password cannot be blank"],
  },
  dateOfBirth: {
    type: Date,
    required: [true, "Birthday cannot be blank"],
  },
  gender: {
    type: String,
    required: [true, "Gender cannot be blank"],
  },
  ethnicity: {
    type: String,
    required: [true, "Ethnicity cannot be blank"],
  },
  height: {
    type: String,
    required: [true, "Height cannot be blank"],
  },
  year: {
    type: String,
    required: [true, "Year cannot be blank"],
  },
  location: {
    type: String,
    required: [true, "Location cannot be blank"],
  },
  major: {
    type: String,
    required: [true, "Major cannot be blank"],
  },
  smoke: {
    type: String,
    required: [true, "Smoking cannot be blank"],
  },
  drink: {
    type: String,
    required: [true, "Drink cannot be blank"],
  },
  preferences: Preferences,
  instagram: {
    type: String,
    default: "",
  },
  snapchat: {
    type: String,
    default: "",
  },
  likedBy: {
    type: Array,
    default: [],
  },
  dislikedBy: {
    type: Array,
    default: [],
  },
  matches: {
    type: Array,
    default: [],
  },
});

const User = mongoose.model("user", UserSchema);
module.exports = User;
