const mongoose = require("mongoose");
const validator = require("validator");

const ProfileSchema = mongoose.model("Profile", {
    name: { type: String, trim: true, required: true },
    email: {
        type: String,
        unique: true,
        required: true,
        trim: true,
        validate:{
            validator: validator.isEmail,
            message: "Email invalido"
        }
    },
    password: { type: String, trim: true, required: true },
    image: String,
    creationDate: { type: Number, required: true },
    birthDate: Number,
    followingObjectId: [{ _id: mongoose.Types.ObjectId }],
    followersObjectId: [{ _id: mongoose.Types.ObjectId }],
    languages: [{String}],
    // Insigneas
    // Nivel
    sequencialDays: Number,
    hearts: Number,
});

module.exports = ProfileSchema;