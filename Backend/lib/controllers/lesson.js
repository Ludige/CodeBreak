const Lesson = require("../model/lesson");
const bcrypt = require("bcrypt");
const Exercice = require("./exercice");
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
        let lesson = await Lesson.findById(TODO);
        let exercice = await Exercice.findById(TODO);
        lesson.exercices.push(exercice);

        //TODO Update lesson
        res.status(200).json(lesson);
    },
    deleteLesson:async function (req, res, next) {
        try {
            let lesson = await Lesson.findById(req.params);

            if (!lesson) {
                res.status(404).json({ msg: "Atividade não encontrada" });
            }
            await Lesson.
            findOneAndDelete({ _id: exercice });
            res.status(200).json({});
        } catch (error) {
            res.status(500).json({ msg: error.message });
        }
    },
};
