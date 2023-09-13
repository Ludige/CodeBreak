const Lesson = require("../model/lesson");
const bcrypt = require("bcrypt");
require("dotenv").config({ path: "variables.env" });

module.exports = {
    create: async function (req, res, next) {
        try {
            let reqLesson = req.body;

            let resLesson = await Profile.create(Profile(reqLesson));
            res.status(200).json(resLesson);
        } catch (error) {
            if (error.code == 11000) {
                res.status(409).json({
                    msg: "Falha ao criar exercicio",
                });
            } else {
                res.status(500).json({ msg: error.message });
            }
        }
    },
    addExercice: async function (req, res, next) {

    },
    removeExercice:async function (req, res, next) {

    },
};
