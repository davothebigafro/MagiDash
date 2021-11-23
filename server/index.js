const express = require("express");
const app = express();
const cors = require("cors");
const mysql = require("mysql2");

const connection = mysql.createPool({
  port: process.env.DB_PORT,
  host: process.env.DB_HOST,
  user: process.env.DB_USER,
  password: process.env.DB_PASSWORD,
  database: process.env.DB_NAME,
});

app.use(express.json());
app.use(cors());

app.get("/dashboards", (req, res) => {
  const sqlSelect = "SELECT * FROM dashboards";
  connection.query(sqlSelect, (err, result) => {
    if (err) {
      console.log("Error occured in getting dashboards from database");
      res.send(err);
    } else {
      res.send(result);
    }
  });
});

app.listen(process.env.NODE_PORT, () => {
  console.log("running on port " + process.env.NODE_PORT.toString());
});
