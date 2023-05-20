const express = require("express");
const sql = require("mssql");
const cors = require("cors");
const path = require("path");

const app = express();
app.use(cors());
app.use(express.json());

const dbConfig = {
  user: "Javier",
  password: "Biblio15",
  server: "bibliotec.database.windows.net",
  database: "BiblioTEC",
  options: {
    encrypt: true,
  },
};

sql
  .connect(dbConfig)
  .then((pool) => {
    console.log("Connected to SQL Server");})

    //.GET CON PARAMETROS Y RETORNA VALOR
    //Reservar cubículo 
    app.get("api/reservar/:capacidad/:accesible", async (req, res) => {
      const { capacidad, accesible } = req.params;
      try {
        const result = await pool
          .request()
          .input("capacidad", sql.Int, capacidad)
          .input("accesible", sql.Bit, accesible)
          .output("Result", sql.Int)
          .execute("sp_ReservarCubiculo");
          const outputValue = result.output.Result;
          console.log("Resultado de salida:", outputValue);
          res.json({ success: true, result: outputValue });
      } catch (error) {
        console.error("Error executing stored procedure:", error);
        res
          .status(500)
          .send("Error executing stored procedure: " + error.message);
      }
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

    //Eliminar cubiculo

    app.get("/api/eliminarCubiculo/:idCubiculo", async (req, res) => {
      const { idCubiculo } = req.params;
      try {
        const result = await pool
          .request()
          .input("idCubiculo", sql.Int, idCubiculo)
          .output("Result", sql.Int)
          .execute("sp_EliminarCubiculo");

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

    app.get("/api/reservasEstudiante/:numCarnet", async (req, res) => {
      const { numCarnet } = req.params;
      try {
        const result = await pool
          .request()
          .input("numCarnet", sql.Int, numCarnet)
          .execute("sp_VerReservacionesPorEstudiante");

        res.json(result.recordset);
      } catch (error) {
        console.error("Error executing stored procedure:", error);
        res
          .status(500)
          .send("Error executing stored procedure: " + error.message);
      }
    });

    // Consultar reserva

    app.get("/api/consultarReserva", async (req, res) => {
      try {
        const result = await pool
          .request()
          .query(
            "SELECT [numCarnet],[fechaReserv],[horaInicio],[horaFinal],[capacidad],[servEsp],[estadoReserva] FROM Reservaciones;"
          );

        res.json(result.recordset);
      } catch (error) {
        console.error("Error executing stored procedure:", error);
        res
          .status(500)
          .send("Error executing stored procedure: " + error.message);
      }
    });

    //Consultar reserva cubiculo

    //.GET CON PARAMETROS, RETORNA TABLA(SELECT)
    app.get("/api/consultarReservaEsp/:numCubiculo", async (req, res) => {
      try {
        const numCubiculo = req.params.numCubiculo;
        const result = await pool
          .request()
          .input("idCubiculo", sql.Int, numCubiculo)
          .output("Result", sql.Int)
          .execute("sp_ObtenerReservacionesCubiculo");

        res.json(result.recordset);
      } catch (error) {
        console.error("Error executing SQL command:", error);
        res.status(500).send("Error executing SQL command: " + error.message);
      }
    });

    //Eliminar reserva

    app.get("/api/eliminarReserva/:idReserva", async (req, res) => {
      const { idReserva } = req.params;
      try {
        const result = await pool
          .request()
          .input("idReserva", sql.Int, idReserva)
          .output("existeReserva", sql.Int)
          .execute("sp_EliminarReserva");

        const outputValue = result.output.existeReserva;
        console.log("Output value:", outputValue);
        res.json({ success: true, result: outputValue });
      } catch (error) {
        console.error("Error executing stored procedure:", error);
        res
          .status(500)
          .send("Error executing stored procedure: " + error.message);
      }
    });

    //Modificar tiempos cubiclulos

    app.get(
      "/api/ModificarCubiculo/:idCubiculo/:nombre/:idEstado/:capacidad/:servEsp/:tiemposUso",
      async (req, res) => {
        const { idCubiculo, nombre, idEstado, capacidad, servEsp, tiemposUso } =
          req.params;
        try {
          const result = await pool
            .request()
            .input("idCubiculo", sql.Int, idCubiculo)
            .input("Nombre", sql.VarChar(128), nombre)
            .input("idEstado", sql.Int, idEstado)
            .input("capacidad", sql.Int, capacidad)
            .input("servEsp", sql.Int, servEsp)
            .input("tiempoDeUsoMaximo", sql.Int, tiemposUso)
            .output("Result", sql.Int)
            .execute("[sp_ModificarCubiculoPorID]");

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

    //FILTRAR

    app.get("/api/filtrar/:capacidad/:servEsp", async (req, res) => {
      const { capacidad, servEsp } = req.params;
      try {
        const result = await pool
          .request()
          .input("capacidad", sql.Int, capacidad)
          .input("servEsp", sql.Int, servEsp)
          .output("outResultCode", sql.Int)
          .execute("sp_FiltroCubiculo");
        res.json(result.recordset);
      } catch (error) {
        console.error("Error executing stored procedure:", error);
        res
          .status(500)
          .send("Error executing stored procedure: " + error.message);
      }
    });

    //

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

    app.use(express.static(path.join(__dirname, '../build')));

    app.use(function(req, res, next) {
      res.status(200).sendFile(path.join(__dirname, '../build', 'index.html'))
    });
    
    const port = process.env.PORT || 3001;
    app.listen(port, () => {
      console.log(`Server is running on port ${port}`);
    });
  })
  .patch((error) => {
    console.error("Error connecting to SQL Server:", error);
  });

