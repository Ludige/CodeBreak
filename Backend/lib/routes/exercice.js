const express = require("express");
const router = express.Router();

// const authVerify = require("../../authVerify");

const controller = require("../controllers/exercice");

router.post("/create", controller.create);
router.get("/getById/:_id", controller.getById);
router.put("/update", controller.updateByToken);
router.put("/updateRightAnswer", controller.changeRightAnswer);
router.put("/updateWrongAnswer", controller.changeRightAnswer);
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