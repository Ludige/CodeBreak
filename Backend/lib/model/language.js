const mongoose = require("mongoose");

const LanguageSchema = mongoose.model("Language", {
    languageName:{ type: String, trim: true, required: true },
    languageIcon: String,
});

module.exports = LanguageSchema;