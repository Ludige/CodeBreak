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
    getById: async function (req, res, next) {
        const _id = req.body;
        try {
            let lesson = await Lesson.findById(_id);

            lesson == null?
                res.status(404).json({ msg: "Lição não encontrada" }):
                res.status(200).json(profile);
        } catch (error) {
            res.status(500).json({ msg: error.message });
        }
    },
    addExercice: async function (req, res, next) {
        try {
            let lesson = await Lesson.findById(req.body.lessonId);
            let exercice = await Exercice.findById(req.body.exerciceId);

            if(lesson || exercice){
                lesson.exercices.push(exercice);
                res.status(200).json(lesson);
            }else{
                res.status(404).json({ msg: "Lição ou Exercicio não encontrados" });
            }
        } catch (error) {
            res.status(500).json({ msg: error.message });
        }
    },
    removeExercice: async function (req, res, next) {
        try {
            let lesson = await Lesson.findById(req.body.lessonId);
            let exercice = await Exercice.findById(req.body.exerciceId);

            if(lesson || exercice){
                lesson.exercices.pull(exercice);
                res.status(200).json(lesson);
            }else{
                res.status(404).json({ msg: "Lição ou Exercicio não encontrados" });
            }
            
    
            res.status(200).json(lesson);
        } catch (error) {
            res.status(500).json({ msg: error.message });
        }
    },
    update: async function (req, res, next) {
        try {
            const _id = req._lessonId;
            const updateLesson = Lesson(req.body);

            let lesson = await Lesson.findByIdAndUpdate(_id, {
                $set: {
                    title: updateLesson.title,
                },
            });

            if (!lesson) {
                res.status(404).json({ msg: "Lição não encontrada" });
                return;
            }
            res.status(200).json(lesson);
        } catch (error) {
            res.status(500).json({ error: error.message });
        }
    },
    delete:async function (req, res, next) {
        try {
            let lesson = await Lesson.findById(req.body);

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
