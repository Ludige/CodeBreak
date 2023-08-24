const jwt = require("jsonwebtoken");
require("dotenv").config({ path: "variables.env" });

module.exports = {
    private: async (req, res, next) => {
        const token = req.headers["x-access-token"];

        if (!token) return res.status(401).json({ message: "Invalid token" });

        jwt.verify(token, process.env.SECRET, (err, decoded) => {
            if (err)
                return res
                    .status(500)
                    .json({ error: "Failed to verify token" });
            req._idToken = decoded.id;
            req.emailToken = decoded.email;
            req.nicknameToken = decoded.nickname;
            next();
        });
    },
};
