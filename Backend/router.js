const express = require ('express');
const router = express.Router();

// const Auth = require('../middleware/middleware');
// const AuthValidator = require('./validator/authvalidator');

// const AuthController = require('./controller/authcontroller');

// const Auth = require('./lib/middleware/middleware');
router.get('/ping', (req, res) => {
    res.json({ pong: true });
});

module.exports = router;
