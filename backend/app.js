const express = require("express");
const bodyParser = require("body-parser");
const cors = require("cors");
const mongoose = require("mongoose");

require("dotenv").config();
const app = express();
const port = process.env.PORT || 8080;

const userRouter = require("./routes/user.routes")

// Enable middleware for parsing incoming request bodies
app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());

// Enable CORS support
app.use(cors());

app.use("/user", userRouter)

// Configure MongoDB connection
mongoose.connect(process.env.DATABASE_URI, {
    useNewUrlParser: true,
    useUnifiedTopology: true,
});

// Global error handling
app.use((err, req, res, next) => {
    res.status(err.status || 500).json({
        errors: err.message || "Server encountered an error",
    });
});

// Start server for local development
app.listen(port, () => {
    console.log(`Server is running at http://localhost:${port}`);
});