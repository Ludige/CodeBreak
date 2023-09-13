require('dotenv').config({ path: 'variables.env' });

const mongoose = require('mongoose');
const express = require('express');
const cors = require('cors');
const fileupload = require('express-fileupload');

const apiRouters = require('./router');//TODO > Trocar router pelos arquivos na /lib/routes

mongoose.connect( process.env.DATABASE, { useNewUrlParser: true, useUnifiedTopology:true})
mongoose.Promise = global.Promise;
mongoose.connection.on('error',(error)=>{
    console.error("ERRO: "+error.message); 
});

const server = express();
server.use(cors());
server.use(express.json());
server.use(express.urlencoded({extended:true}));
server.use('/',apiRouters);
server.use(fileupload());
server.use(express.static('assets'))


server.listen(process.env.PORT, ()=>{
    console.log(`Servidor rodando na porta: ${process.env.PORT}`);
})
