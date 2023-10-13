require("dotenv").config();
require("express-async-errors");

const express = require("express");
const cors = require("cors");

const PORT = process.env.PORT || 5000;
const app = express();

const { connectDB } = require("./db/connect");

const RouteNotFound = require("./middleware/route-not-found");
const { ErrorHandlingMiddleware } = require("./middleware/error-handling");

const AuthRouter = require("./routes/auth.route");

app.use(cors());
app.use(express.json());

app.get("/api", (req, res) => {
  res.status(200).json({ msg: "this is the home route" });
});

app.use("/api/auth", AuthRouter);

app.use(RouteNotFound);
app.use(ErrorHandlingMiddleware);

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
