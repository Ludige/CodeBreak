const Exercice = require("../model/exercice");
const bcrypt = require("bcrypt");
require("dotenv").config({ path: "variables.env" });

module.exports = {
    create: async function (req, res, next) {
        //padrão de nome: Linguagem - Exercicio Numero - Nome
        try {
            let reqExercice = req.body;

            let resExercice = await Profile.create(Profile(reqExercice));
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

    },
};
