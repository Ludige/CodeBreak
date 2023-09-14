const Exercice = require("../model/exercice");
const bcrypt = require("bcrypt");
require("dotenv").config({ path: "variables.env" });

module.exports = {
    create: async function (req, res, next) {
        //padrão de nome: Linguagem - Exercicio Numero - Nome
        try {
            let reqExercice = req.body;

            let resExercice = await Profile.create(Profile(reqExercice));
            resExercice.possibleAnswers.push(resExercice.wrongAnswer);
            resExercice.possibleAnswers.push(resExercice.rightAnswer);
            
            res.status(200).json(resExercice);
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
    edit:async function (req, res, next) {
        try {
            const _id = req._idToken;
            const updateExercice = Exercice(req.body);

            let exercice = await Exercice.findByIdAndUpdate(_id, {
                $set: {
                    title: updateExercice.title,
                    question: updateExercice.question,
                    rightAnswer: updateExercice.rightAnswer,
                    wrongAnswer: updateExercice.wrongAnswer,
                    possibleAnswers: updateExercice.possibleAnswers,
                },
            });

            if (!exercice) {
                res.status(404).json({ msg: "Perfil não encontrado" });
                return;
            }
            res.status(200).json(exercice);
        } catch (error) {
            res.status(500).json({ error: error.message });
        }
    },

    deleteByID: async function (req, res, next) {
        try {
            let exercice = await Exercice.findById(req.params);

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
