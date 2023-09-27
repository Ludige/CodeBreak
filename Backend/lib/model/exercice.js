const mongoose = require("mongoose");
const validator = require("validator");

const ExerciceSchema = mongoose.model("Profile", {
    title: String,
    questionText: String,
    rightAnswer: [{String}],
    wrongAnswers: [{String}],
    possibleAnswers: [{String}],//All answers right and wrong
});

module.exports = ExerciceSchema;