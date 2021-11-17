const express = require("express");
const api = express();

const port = 3001;
api.listen(port, () => {
  console.log("running on port " + port.toString());
});
