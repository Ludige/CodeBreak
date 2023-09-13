const express = require('express');

const router = express.Router();

router.get('/home',(req,res)=>{
    res.send('testando servidor');
});

const app = express();
app.use('/home', router);

module.exports = app;
