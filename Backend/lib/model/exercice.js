const mongoose = require("mongoose");
const validator = require("validator");

const ExerciceSchema = mongoose.model("Profile", {
    title: String,
    question: String,
    rightAnswer: [{String}],
    wrongAnswer: [{String}],
    possibleAnswers: [{String}],//All answers right and wrong
});

module.exports = ExerciceSchema;