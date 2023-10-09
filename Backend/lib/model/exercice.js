const mongoose = require("mongoose");
const validator = require("validator");

const ExerciceSchema = mongoose.model("Exercice", {
    title: String,
    questionText: String,
    rightAnswer: [{String}],
    wrongAnswers: [{String}],
    possibleAnswers: [{String}],//All answers right and wrong
    isQuestion: Boolean,
});

module.exports = ExerciceSchema;