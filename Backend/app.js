const express = require("express");
const app = express();
const cors = require("cors");
const mongoose = require("mongoose");

require("dotenv").config({ path: "./variables.env" });

// const authVerify = require("./authVerify");

//Definir rotas
const profileRouter = require("./lib/routes/profile");

app.use(cors());

app.use(
    express.urlencoded({
        extended: true,
        limit: "2000mb",
    })
);

app.use(express.json({ limit: "2000mb" }));

//Implementar rotas
app.use("/profile", profileRouter);

mongoose
    .connect(process.env.DATABASE)
    .then(() => {
        app.listen(process.env.PORT, process.env.HOST);
        console.log("Banco conectado com sucesso!");
    })
    .catch(function (err) {
        console.log("Erro ao conectar ao banco! " + err.message);
    });