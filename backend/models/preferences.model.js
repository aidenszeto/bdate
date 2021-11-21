const mongoose = require("mongoose");
const Schema = mongoose.Schema;

const {String} = Schema.Types;

const PreferencesSchema = new Schema({
  whoToDate: {
    // guys, girls, non-binary, etc
    type: String,
    default: "Any",
  },
  year: {
    type: String,
    default: "Any",
  },
  major: {
    type: String,
    default: "Any",
  },
  location: {
    type: String,
    default: "Any",
  },
  drink: {
    type: String,
    default: "Any",
  },
  smoke: {
    type: String,
    default: "Any",
  },
});

const Preferences = mongoose.model("preferences", PreferencesSchema);
module.exports = {Preferences, PreferencesSchema};
