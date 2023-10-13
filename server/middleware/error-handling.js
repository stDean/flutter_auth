const { StatusCodes } = require("http-status-codes");

const ErrorHandlingMiddleware = (err, req, res, next) => {
  // Getting my custom errors
  let customError = {
    // set default
    statusCode: err.statusCode || StatusCodes.INTERNAL_SERVER_ERROR,
    msg: err.message || "Something went wrong try again later",
  };

  // MONGOOSE ERRORS
  // Validation Error (when a required field is not present)
  if (err.name === "ValidationError") {
    customError.msg = Object.values(err.errors)
      .map(item => item.message)
      .join(",");
    customError.statusCode = 400;
  }

  // duplicate error
  if (err.code && err.code === 11000) {
    customError.msg = `Duplicate value entered for ${Object.keys(
      err.keyValue
    )} field, please choose another value`;
    customError.statusCode = 400;
  }

  // error when id value in the params is wrong
  if (err.name === "CastError") {
    customError.msg = `No item found with id : ${err.value}`;
    customError.statusCode = 404;
  }

  return res.status(customError.statusCode).json({ msg: customError.msg });
};

module.exports = { ErrorHandlingMiddleware };
