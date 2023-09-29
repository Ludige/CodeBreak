const Language = require("../model/language");
const bcrypt = require("bcrypt");
require("dotenv").config({ path: "variables.env" });

module.exports = {
    create: async function (req, res, next) {
        //TODO
    },
    getAll: async function (req, res, next) {
        //TODO
    },
    update: async function (req, res, next) {
        //TODO
    },
    deleteByID: async function (req, res, next) {
        try {
            let language = await Language.findById(req.body);

            if (!language) {
                res.status(404).json({ msg: "Lingua não encontrada" });
            }
            await Language.findOneAndDelete({ _id: language });
            res.status(200).json({});
        } catch (error) {
            res.status(500).json({ msg: error.message });
        }
    },
};
