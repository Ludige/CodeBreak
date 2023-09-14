const express = require ('express');
const router = express.Router();

const ProfileController = require('./lib/controllers/profile');

router.get('/ping', (req, res) => {
    res.json({ pong: true });
});

//Profile

module.exports = router;
const express = require("express");