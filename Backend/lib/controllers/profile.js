const Profile = require("../model/profile");
const bcrypt = require("bcrypt");
require("dotenv").config({ path: "variables.env" });

module.exports = {
    create: async function (req, res, next) {
        try {
            let reqProfile = req.body;
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
            const followObjectId = req.body.followObjectId;
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
        const _id = req.body;
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
            const updateProfile = Profile(req.body);

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

            let profile = await Profile.findById(req.body.profileObjectId);
            
            if (!profile) {
                res.status(404).json({ msg: "Perfil não encontrado" });
                return;
            }
            //TODO adicionar linguas e depois colocar aqui pra só aceitar as exitentes
            profile.languages.push(req.body);
            await profile.save();
            res.status(200).json(profile);
        } catch (error) {
            res.status(500).json({ error: error.message });
        }
    },
    deleteByID: async function (req, res, next) {
        try {
            let profile = await Profile.findById(req.body);

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
