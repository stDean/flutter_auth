const express = require("express");
const router = express.Router();

const { AuthCtrl } = require("../controller/auth.controller");
const { register, login } = AuthCtrl;

router.post("/register", register);
router.post("/login", login);

module.exports = router;
