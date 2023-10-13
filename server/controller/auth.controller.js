const { StatusCodes } = require("http-status-codes");
const User = require("../schema/user.schema");

const AuthCtrl = {
  register: async (req, res) => {
    // console.log({ ...req.body });
    const user = await User.create({ ...req.body });
    res
      .status(StatusCodes.OK)
      .json({ msg: "You Have Successfully Registered", user });
  },
  login: async (req, res) => {
    res.status(StatusCodes.OK).json({ msg: "Welcome Back" });
  },
};

module.exports = { AuthCtrl };
