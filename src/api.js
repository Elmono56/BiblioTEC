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

    //.GET CON PARAMETROS Y RETORNA VALOR

    //Validación de Login

    app.get("/api/login/:correo/:contrasena", async (req, res) => {
      const { correo, contrasena } = req.params;
      try {
        const result = await pool
          .request()
          .input("correoITCR", sql.VarChar(128), correo)
          .input("contrasena", sql.VarChar(128), contrasena)
          .output("Resultd", sql.Int)
          .execute("sp_VerificarUsuario");

        const outputValue = result.output.Resultd;
        console.log("Output value:", outputValue);
        res.json({ success: true, result: outputValue });
      } catch (error) {
        console.error("Error executing stored procedure:", error);
        res
          .status(500)
          .send("Error executing stored procedure: " + error.message);
      }
    });

    //Registrar nuevo estudiante

    app.get(
      "/api/login/:correo/:apellido1/:apellido2/:nombre/:carnet/:fechaNacimiento/:contrasena/:cedula",
      async (req, res) => {
        const {
          correo,
          apellido1,
          apellido2,
          nombre,
          carnet,
          fechaNacimiento,
          contrasena,
          cedula,
        } = req.params;
        try {
          const result = await pool
            .request()
            .input("correoITCR", sql.VarChar(128), correo)
            .input("apellido1", sql.VarChar(128), apellido1)
            .input("apellido2", sql.VarChar(128), apellido2)
            .input("nombre", sql.VarChar(128), nombre)
            .input("carnet", sql.Int, carnet)
            .input("fechaNacimiento", sql.Date, fechaNacimiento)
            .input("contrasena", sql.VarChar(128), contrasena)
            .input("cedula", sql.Int, cedula)

            .output("outResultCode", sql.Int)
            .execute("sp_RegistrarEstudiante");

          const outputValue = result.output.outResultCode;
          console.log("Output value:", outputValue);
          res.json({ success: true, result: outputValue });
        } catch (error) {
          console.error("Error executing stored procedure:", error);
          res
            .status(500)
            .send("Error executing stored procedure: " + error.message);
        }
      }
    );

    //Eliminar estudiante

    app.get("/api/eliminar/:idEstudiante", async (req, res) => {
      const { idEstudiante } = req.params;
      try {
        const result = await pool
          .request()
          .input("carnetEstudiante", sql.Int, idEstudiante)
          .output("Result", sql.Int)
          .execute("sp_EliminarEstudiante");

        const outputValue = result.output.Result;
        console.log("Output value:", outputValue);
        res.json({ success: true, result: outputValue });
      } catch (error) {
        console.error("Error executing stored procedure:", error);
        res
          .status(500)
          .send("Error executing stored procedure: " + error.message);
      }
    });

    //Agregar cubículo

    app.get(
      "/api/agregarCubiculo/:idEstado/:capacidad/:servEsp/:Nombre",
      async (req, res) => {
        const { idEstado, capacidad, servEsp, Nombre } = req.params;
        try {
          const result = await pool
            .request()
            .input("idEstado", sql.Int, idEstado)
            .input("capacidad", sql.Int, capacidad)
            .input("servEsp", sql.Int, servEsp)
            .input("Nombre", sql.VarChar(128), Nombre)

            .output("Result", sql.Int)
            .execute("sp_InsertarCubiculo");

          const outputValue = result.output.Result;
          console.log("Output value:", outputValue);
          res.json({ success: true, result: outputValue });
        } catch (error) {
          console.error("Error executing stored procedure:", error);
          res
            .status(500)
            .send("Error executing stored procedure: " + error.message);
        }
      }
    );

    //.GET QUERY, RETORNA UNA TABLA(SELECT)

    // app.get("/api/reporte", async (req, res) => {
    //   try {
    //     const result = await pool
    //       .request()
    //       .query(
    //         "SELECT TOP (1000) [numCubiculo],[numCarnet],[fechaReserv],[horaInicio],[horaFinal],[numReserva] FROM [BiblioTEC].[dbo].[Reservaciones]"
    //       );

    //     res.json(result.recordset);
    //   } catch (error) {
    //     console.error("Error executing SQL command:", error);
    //     res.status(500).send("Error executing SQL command: " + error.message);
    //   }
    // });

    // //.GET CON PARAMETROS, RETORNA TABLA(SELECT)
    // app.get("/api/historial/:carnet", async (req, res) => {
    //   try {
    //     const carnet = req.params.carnet;
    //     const result = await pool
    //       .request()
    //       .input("carnet", sql.BigInt, carnet)
    //       .execute("sp_HistorialReservas");

    //     res.json(result.recordset);
    //   } catch (error) {
    //     console.error("Error executing SQL command:", error);
    //     res.status(500).send("Error executing SQL command: " + error.message);
    //   }
    // });

    const port = process.env.PORT || 3001;
    app.listen(port, () => {
      console.log(`Server is running on port ${port}`);
    });
  })
  .catch((error) => {
    console.error("Error connecting to SQL Server:", error);
  });
