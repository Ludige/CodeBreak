const express = require("express");
const router = express.Router();

const controller = require("../controllers/profile");

router.post("/create", controller.create);
router.post("/follow/:followObjectId", controller.followById);
router.post("/", controller.login);
router.get("/getAll", controller.getAll);
router.get("/getById/:_id", controller.getById);
// router.get("/getByNickname/:nickname",controller.getByNickname);
router.get("/getProfileByToken",controller.getProfileByToken);
router.put("/update", controller.updateByToken);
router.delete("/deleteById/:_id",  controller.deleteByID);

module.exports = router;
















// router.post(
//     "/follow/:followObjectId",
//     authVerify.private,
//     controller.followById
// );
// router.get("/getAll", authVerify.private, controller.getAll);
// router.get("/getById/:_id", authVerify.private, controller.getById);
// router.get(
//     "/getByNickname/:nickname",
//     authVerify.private,
//     controller.getByNickname
// );
// router.get(
//     "/getProfileByToken",
//     authVerify.private,
//     controller.getProfileByToken
// );
// router.put("/update", authVerify.private, controller.updateByToken);
// router.delete("/deleteById/:_id", authVerify.private, controller.deleteByID);