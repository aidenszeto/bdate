"use strict";
const express = require("express");
const bodyParser = require("body-parser");
const cors = require("cors");

require("dotenv").config();

const app = express();

const port = process.env.PORT || 8080;

// Enable middleware for parsing incoming request bodies
app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());

// Enable CORS support
app.use(cors());

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