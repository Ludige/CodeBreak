const outputsFile = "./swagger/swagger-output.json";
const endpointsFiles = ["./app.js", "./lib/controllers/*.js"];
const swaggerOptions = require("./swagger-autogen.options.js");
const swaggerAutogen = require("swagger-autogen")(swaggerOptions);
require("dotenv").config({ path: "../variables.env" });

const doc = {
    info: {
        version: "1.0.0",
        title: "TCC - CodeBreaker",
        description:
            "",
    },
    basePath: "/",
    securityDefinitions: {
        Authorization: {
            type: "apiKey",
            name: "x-access-token",
            scheme: "bearer",
            in: "headers",
        },
    },
    security: [
        {
            Authorization: [],
        },
    ],
    definitions: {},
    host: process.env.HOST + process.env.POST_API,
    schemes: ["http", "https"],
    consumes: ["application/json"],
    produces: ["application/json"],
};

swaggerAutogen(outputsFile, endpointsFiles, doc);
