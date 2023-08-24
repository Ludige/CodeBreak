const express = require("express");
const app = express();
const cors = require("cors");
const mongoose = require("mongoose");

require("dotenv").config({ path: "./variables.env" });
const jwt = require("jsonwebtoken");

const swaggerFile = require("./swagger/swagger-output.json");
const swaggerUI = require("swagger-ui-express");

app.use(cors());

app.use(
    express.urlencoded({
        extended: true,
        limit: "2000mb",
    })
);

app.use(express.json({ limit: "2000mb" }));

app.use("/doc", swaggerUI.serve, swaggerUI.setup(swaggerFile));

//IMPLEMENTAR ROTAS DA API AQUI

mongoose
    .connect(process.env.URL_MONGO_DB)
    .then(() => {
        app.listen(process.env.PORT_API, process.env.HOST);
        console.log("Banco conectado com sucesso!");
    })
    .catch(function (err) {
        console.log("Erro ao conectar ao banco! " + err.message);
    });
