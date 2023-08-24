const express = require("express");
const router = express.Router();

const authVerify = require("../../authVerify");

const controller = require("../controllers/controllerProfile.js");

router.post("/create", controller.create);
router.post(
    "/follow/:followObjectId",
    authVerify.private,
    controller.followById
);
router.get("/getAll", authVerify.private, controller.getAll);
router.get("/getById/:_id", authVerify.private, controller.getById);
router.get(
    "/getByNickname/:nickname",
    authVerify.private,
    controller.getByNickname
);
router.get(
    "/getProfileByToken",
    authVerify.private,
    controller.getProfileByToken
);
router.put("/update", authVerify.private, controller.updateByToken);
router.delete("/deleteById/:_id", authVerify.private, controller.deleteByID);

module.exports = router;
