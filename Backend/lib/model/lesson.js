const mongoose = require("mongoose");
const validator = require("validator");

const LessonSchema = mongoose.model("Lesson", {
    title: String,
    exercices: [{ _id: mongoose.Types.ObjectId }],
});
module.exports = LessonSchema;