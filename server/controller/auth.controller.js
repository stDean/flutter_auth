const { StatusCodes } = require("http-status-codes");

const AuthCtrl = {
  register: async (req, res) => {
    res
      .status(StatusCodes.OK)
      .json({ msg: "You Have Successfully Registered" });
  },
  login: async (req, res) => {
    res.status(StatusCodes.OK).json({ msg: "Welcome Back" });
  },
};

module.exports = { AuthCtrl };
