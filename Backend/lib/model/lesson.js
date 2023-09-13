const mongoose = require("mongoose");
const validator = require("validator");

const LessonSchema = mongoose.model("Profile", {
    title: String,
    exercices: [{ _id: mongoose.Types.ObjectId }],
});
module.exports = LessonSchema;