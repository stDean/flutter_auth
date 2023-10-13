const { Schema, model } = require("mongoose");

const UserSchema = new Schema(
  {
    username: {
      type: String,
      required: [true, "Username is required"],
      minLength: 4,
      maxLength: 100,
      unique: true,
    },
    email: {
      type: String,
      required: [true, "Please provide you email."],
      match: [
        /^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/,
      ],
      unique: true,
    },
    password: {
      type: String,
      required: [true, "Please enter a secure password."],
      minLength: [6, "Password mut be at least 6 characters long."],
    },
  },
  { timestamps: true }
);

module.exports = model("User", UserSchema);
