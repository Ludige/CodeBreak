const Profile = require("../model/profile");
const bcrypt = require("bcrypt");
const jwt = require("jsonwebtoken");
require("dotenv").config({ path: "variables.env" });

module.exports = {
    create: async function (req, res, next) {
        try {
            let reqProfile = req.params._id;
            reqProfile.creationDate = parseInt(reqProfile.creationDate);
            reqProfile.password = await bcrypt.hash(
                reqProfile.password,
                parseInt(process.env.SALT)
            );            
            let resProfile = await Profile.create(Profile(reqProfile));
            resProfile.password = undefined;

            res.status(200).json(resProfile);
        } catch (error) {
            error.code == 11000 ?
                res.status(409).json({msg: "Email ou Apelido já estão em uso! Tente outro!"}):
                res.status(500).json({ msg: error.message });
        }
    },
    followById: async function (req, res, next) {
        try {
            const followObjectId = req.params._id.followObjectId;
            const idToken = req._idToken;
            let msgRes = "";
            let followProfile;
            let profileToken;

            if (followObjectId != idToken) {
                followProfile = await Profile.findOne({
                    _id: followObjectId,
                });
                profileToken = await Profile.findOne({
                    _id: idToken,
                });

                if (!followProfile || !profileToken) {
                    res.status(404).json({ error: "Perfil não encontrado" });
                    return;
                }

                const lengthFollowingObjectId =
                    profileToken.followingObjectId.length;

                const resFollowing =
                    profileToken.followingObjectId.pull(followObjectId);

                let isRemovedFollow = false;
                if (lengthFollowingObjectId > resFollowing.length) {
                    isRemovedFollow = true;
                    msgRes = "removido";
                    followProfile.followersObjectId.pull(idToken);
                }

                if (!isRemovedFollow) {
                    followProfile.followersObjectId.push(idToken);
                    profileToken.followingObjectId.push(followProfile);
                    msgRes = "seguindo";
                }

                await profileToken.save();
                await followProfile.save();
            } else {
                res.status(401).json({ msg: "Voce não pode se seguir!" });
                return;
            }
            res.status(200).json({
                msg: msgRes,
                profileToken: profileToken,
                followProfile: followProfile,
            });
            return;
        } catch (error) {
            res.status(500).json({ error: error.message });
        }
    },
    login: async function (req, res, next) {
        try {
            let profile = await Profile.findOne({ email: req.params.email });
            if (!profile) {
                res.status(404).json({ error: "Perfil não existe" });
                return;
            }

            const match = await bcrypt.compare(
                req.params.password,
                profile.password
            );

            if (!match) {
                res.status(400).json({ error: "Email ou Senha incorretos" });
                return;
            } else {
                const { _id, email, nickname } = profile;

                const token = jwt.sign(
                    { id: _id, email: email, nickname: nickname },
                    process.env.SECRET
                    //{ expiresIn: 3600 }
                );
                res.status(200).json({ token: token });
            }
        } catch (error) {
            res.status(500).json({ error: error.message });
        }
    },
    getAll: async function (req, res, next) {
        try {
            let profiles = await Profile.find();

            profiles.length != 0 ?
                res.status(200).json(profiles):
                res.status(404).json({ msg: "Nenhum Perfil encontrado" });
        } catch (error) {
            res.status(500).json({ error: error.message });
        }
    },
    getById: async function (req, res, next) {
        const _id = req.params._id;
        
        try {
            let profile = await Profile.findById(_id);
             
            profile == null ?
                res.status(404).json({ msg: "Perfil não encontrado" }):
                res.status(200).json(profile);
        } catch (error) {
            res.status(500).json({ msg: error.message });
        }
    },
    getProfileByToken: async function (req, res, next) {
        const idToken = req._idToken;

        try {
            let profile = await Profile.findById(idToken, {
                password: 0,
            });

            profile == null ?
                res.status(404).json({ msg: "Perfil não encontrado" }):
                res.status(200).json(profile);
        } catch (error) {
            res.status(500).json({ msg: error.message });
        }
    },
    updateByToken: async function (req, res, next) {
        try {
            const _id = req._idToken;
            const updateProfile = Profile(req.params._id);

            let profile = await Profile.findByIdAndUpdate(_id, {
                $set: {
                    name: updateProfile.name,
                    description: updateProfile.description,
                    email: updateProfile.email,
                    birthDate: updateProfile.birthDate,
                },
            });

            if (!profile) {
                res.status(404).json({ msg: "Perfil não encontrado" });
                return;
            }
            res.status(200).json(profile);
        } catch (error) {
            res.status(500).json({ error: error.message });
        }
    },
    addLanguage: async function (req, res, next) {
        try {
            const _id = req._idToken;

            let profile = await Profile.findById(req.params._id.profileObjectId);
            
            if (!profile) {
                res.status(404).json({ msg: "Perfil não encontrado" });
                return;
            }
            //TODO adicionar linguas e depois colocar aqui pra só aceitar as exitentes
            profile.languages.push(req.params._id);
            await profile.save();
            res.status(200).json(profile);
        } catch (error) {
            res.status(500).json({ error: error.message });
        }
    },
    deleteByID: async function (req, res, next) {
        try {
            let profile = await Profile.findById(req.params._id);

            if (profile) {
                await Profile.findOneAndDelete({ _id: profile });
                res.status(200).json({});
            }else{
                res.status(404).json({ msg: "Perfil não encontrado" });
            }
        } catch (error) {
            res.status(500).json({ msg: error.message });
        }
    },
};
