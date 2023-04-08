const express = require("express");
const sql = require("mssql");
const cors = require("cors");

const app = express();
app.use(cors());
app.use(express.json());

const dbConfig = {
  user: "biblioTEC",
  password: "1234",
  server: "localhost",
  database: "biblioTEC",
  options: {
    enableArithAbort: true,
    trustServerCertificate: true,
  },
};

sql
  .connect(dbConfig)
  .then((pool) => {
    console.log("Connected to SQL Server");

    app.get("/api/login/:codAdmin/:idenPers", async (req, res) => {
      const { codAdmin, idenPers } = req.params;
      try {
        const result = await pool
          .request()
          .input("codAdmin", sql.VarChar, codAdmin) // pass values as strings
          .input("idenPers", sql.VarChar, idenPers) // pass values as strings
          .output("existe", sql.Bit)
          .execute("ValidarAdministrador");

        const outputValue = result.output.existe;
        res.json({ success: true, result: outputValue });
      } catch (error) {
        console.error("Error executing stored procedure:", error);
        res
          .status(500)
          .send("Error executing stored procedure: " + error.message);
      }
    });

    const port = process.env.PORT || 3001;
    app.listen(port, () => {
      console.log(`Server is running on port ${port}`);
    });
  })
  .catch((error) => {
    console.error("Error connecting to SQL Server:", error);
  });
