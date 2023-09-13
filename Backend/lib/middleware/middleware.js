const User = require('../lib/model/user');

module.exports = {
    private: async(req, res, next) => {
        if(!req.query.token && !req.body.token){
            res.json({logado : false});
            return;
        }

        if(req.query.token){
            token = req.query.token;
        }

        if(req.body.token){
            token = req.body.token;
        }

        if(!token){
            res.json({logado : false});
            return;
        }

        const user = await User.findOne({token});

        if(!user){
            res.json({logado : false});
            return;
        }

        next();
    }
}