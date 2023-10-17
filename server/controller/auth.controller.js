const { StatusCodes } = require("http-status-codes");
const User = require("../schema/user.schema");
const { BadRequestError, UnauthenticatedError } = require("../errors");

const AuthCtrl = {
  register: async (req, res) => {
    // console.log({ ...req.body });
    const user = await User.create({ ...req.body });
    const { username: userName } = user;

    const token = user.createJWT();
    res
      .status(StatusCodes.CREATED)
      .json({ msg: "You Have Successfully Registered", userName, token });
  },
  login: async (req, res) => {
    const { username, password } = req.body;

    // check that the fields are filled
    if (!username || !password) {
      throw new BadRequestError("All fields must be filled.");
    }

    // get user by username
    const user = await User.findOne({ username });
    // if no user throw an error
    if (!user) {
      throw new UnauthenticatedError("No user with this email.");
    }

    // then compare the password entered to the password from the user document returned
    const isCorrectPassword = await user.comparePassword(password);
    if (!isCorrectPassword) {
      throw new UnauthenticatedError("Incorrect password entered.");
    }

    const token = user.createJWT();
    const { username: userName } = user;

    res.status(StatusCodes.OK).json({ msg: "Welcome Back", userName, token });
  },
};

module.exports = { AuthCtrl };
