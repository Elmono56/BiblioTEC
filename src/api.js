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
  database: "BiblioTEC",
  options: {
    enableArithAbort: true,
    trustServerCertificate: true,
  },
};

sql
  .connect(dbConfig)
  .then((pool) => {
    console.log("Connected to SQL Server");

    app.get("/api/login/:carnet/:contrasena", async (req, res) => {
      const { carnet, contrasena } = req.params;
      try {
        const result = await pool
          .request()
          .input("carnet", sql.VarChar(128), carnet)
          .input("contrasena", sql.VarChar(128), contrasena)
          .output("resultado", sql.Int)
          .execute("sp_ValidarUsuario");

        const outputValue = result.output.resultado;
        console.log("Output value:", outputValue);
        res.json({ success: true, result: outputValue });
      } catch (error) {
        console.error("Error executing stored procedure:", error);
        res
          .status(500)
          .send("Error executing stored procedure: " + error.message);
      }
    });

    app.get("/api/reservacion/:numReserva", async (req, res) => {
      const { numReserva } = req.params;
      try {
        const result = await pool
          .request()
          .input("numReserva", sql.Int, numReserva)
          .output("resultado", sql.Int)
          .execute("sp_EliminarReservacion");
    
        const outputValue = result.output.resultado;
        console.log("Output value:", outputValue);
        res.json({ success: true, result: outputValue });
      } catch (error) {
        console.error("Error executing stored procedure:", error);
        res.status(500).send("Error executing stored procedure: " + error.message);
      }
    });

    app.get("/api/disponibilidad/:numCubiculo", async (req, res) => {
      const { numCubiculo } = req.params;
      try {
        const result = await pool
          .request()
          .input("numCubiculo", sql.Int, numCubiculo)
          .output("resultado", sql.Int)
          .execute("sp_VerificarEstadoCubiculo");
    
        const outputValue = result.output.resultado;
        console.log("Output value:", outputValue);
        res.json({ success: true, result: outputValue });
      } catch (error) {
        console.error("Error executing stored procedure:", error);
        res.status(500).send("Error executing stored procedure: " + error.message);
      }
    });

    app.get("/api/reporte", async (req, res) => {
      try {
        const result = await pool
          .request()
          .query("SELECT TOP (1000) [numCubiculo],[numCarnet],[fechaReserv],[horaInicio],[horaFinal],[numReserva] FROM [BiblioTEC].[dbo].[Reservaciones]");
    
        res.json(result.recordset);
      } catch (error) {
        console.error("Error executing SQL command:", error);
        res.status(500).send("Error executing SQL command: " + error.message);
      }
    });


    app.get("/api/historial/:carnet", async (req, res) => {
      try {
        const carnet = req.params.carnet;
        const result = await pool
          .request()
          .input('carnet', sql.BigInt, carnet)
          .execute('sp_HistorialReservas');
        
        res.json(result.recordset);
      } catch (error) {
        console.error("Error executing SQL command:", error);
        res.status(500).send("Error executing SQL command: " + error.message);
      }
    });



    app.get("/api/insertar/:capacidad/:servesp", async (req, res) => {
      try {
        const capacidad = req.params.capacidad;
        const servesp = req.params.servesp;
        await pool
          .request()
          .input('Capacidad', sql.Int, capacidad)
          .input('ServEsp', sql.Int, servesp)
          .execute('sp_InsertarCubiculo');
        
        res.send("Cubículo agregado correctamente");
      } catch (error) {
        console.error("Error executing SQL command:", error);
        res.status(500).send("Error executing SQL command: " + error.message);
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
