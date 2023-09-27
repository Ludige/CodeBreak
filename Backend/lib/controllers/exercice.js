const Exercice = require("../model/exercice");
const bcrypt = require("bcrypt");
require("dotenv").config({ path: "variables.env" });

module.exports = {
    create: async function (req, res, next) {
        //padrão de nome: Linguagem - Exercicio Numero - Nome
        try {
            let reqExercice = req.body;

            let resExercice = await Profile.create(Profile(reqExercice));
            resExercice.possibleAnswers.push(resExercice.wrongAnswers);
            resExercice.possibleAnswers.push(resExercice.rightAnswer);
            
            res.status(200).json(resExercice);
        } catch (error) {
            error.code == 11000 ?
                res.status(409).json({msg: "Falha ao criar exercicio"}):
                res.status(500).json({ msg: error.message });
        }
    },
    getById: async function (req, res, next) {
        const _id = req.body;
        try {
            let exercice = await Exercice.findById(_id);

            exercice == null
                ? res.status(404).json({ msg: "Exercicio não encontrado" })
                : res.status(200).json(profile);
        } catch (error) {
            res.status(500).json({ msg: error.message });
        }
    },
    update: async function (req, res, next) {
        try {
            const _id = req._exerciceId;
            const updateExercice = Exercice(req.body);

            let exercice = await Exercice.findByIdAndUpdate(_id, {
                $set: {
                    title: updateExercice.title,
                    questionText: updateExercice.questionText,
                },
            });

            if (!exercice) {
                res.status(404).json({ msg: "Exercicio não encontrado" });
                return;
            }
            res.status(200).json(exercice);
        } catch (error) {
            res.status(500).json({ error: error.message });
        }
    },
    changeRightAnswer: async function (req, res, next) {
        //TODO
    },
    changeWrongAnswer: async function (req, res, next) {
        //TODO
    },
    deleteByID: async function (req, res, next) {
        try {
            let exercice = await Exercice.findById(req.body);

            if (!exercice) {
                res.status(404).json({ msg: "Exercicio não encontrado" });
            }
            await Exercice.findOneAndDelete({ _id: exercice });
            res.status(200).json({});
        } catch (error) {
            res.status(500).json({ msg: error.message });
        }
    },
};
