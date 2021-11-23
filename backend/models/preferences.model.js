const mongoose = require("mongoose");
const Schema = mongoose.Schema;

const { String, Boolean } = Schema.Types;

const PreferencesSchema = new Schema({
  whoToDate: {
    // guys, girls, non-binary, etc
    type: String,
  },
  year: {
    type: String,
  },
  location: {
    type: String,
  },
  drink: {
    type: Boolean,
  },
  smoke: {
    type: Boolean,
  },
});

const Preferences = mongoose.model("preferences", PreferencesSchema);
module.exports = {Preferences, PreferencesSchema};
