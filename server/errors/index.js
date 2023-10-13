const { CustomAPIError } = require("./CustomAPIError");
const { UnauthenticatedError } = require("./Unauthenticated");
const { NotFoundError } = require("./NotFound");
const { BadRequestError } = require("./BadRequest");

module.exports = {
  CustomAPIError,
  UnauthenticatedError,
  NotFoundError,
  BadRequestError,
};
