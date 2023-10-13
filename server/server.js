require("dotenv").config();
require("express-async-errors");

const express = require("express");
const cors = require("cors");

const PORT = process.env.PORT || 5000;
const app = express();

const { connectDB } = require("./db/connect");
const AuthRouter = require("./routes/auth.route");

app.use(cors());
app.use(express.json());

app.get("/api", (req, res) => {
  res.status(200).json({ msg: "this is the home route" });
});

app.use("/api/auth", AuthRouter);

const start = async () => {
  try {
    await connectDB(process.env.MONGO_URI);
    app.listen(PORT, () => {
      console.log(`Server listening on port: ${PORT}`);
    });
  } catch (e) {
    console.log(e);
  }
};

start();
