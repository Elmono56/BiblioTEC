import React, { useState } from "react";
import { useNavigate } from "react-router-dom";
import TopBar from "./TopBar";
import "../menu.css";
import axios from "axios";

const CancelarReserva = () => {
  const navigate = useNavigate();
  const navigateInfo = useNavigate();
  const [numeroReserva, setNumeroReserva] = useState("");
  const [message, setMessage] = useState("");

  const handleAceptar = async (e) => {
    e.preventDefault();
    try {
      const response = await axios.get(
        `http://localhost:3001/api/reservacion/${numeroReserva}`
      );
      const result = response.data.result;
      console.log("Output value:", result);
      if (result === 1) {
        setMessage("Cancelación exitosa");
      } else {
        setMessage("El cubiculo no se encuentra reservado");
      }
    } catch (error) {
      console.error("Error executing stored procedure:", error);
    }
  };

  return (
    <>
      <TopBar />
      <div id="menu-btns">
        <h1 className="page-title">Cancelar Reserva</h1>
        <form id="form-cancelar">
          <label>
            Número de reserva: <br></br>
            <input
              type="number"
              name="numeroReserva"
              value={numeroReserva}
              onChange={(e) => setNumeroReserva(e.target.value)}
            />
            <br></br>
            <br></br>
          </label>
        </form>
        <button onClick={handleAceptar} className="est-chooseOption">
          Aceptar
        </button>
        <button onClick={() => navigate("/menu")} className="est-chooseOption">
          Regresar
        </button>
        {message && <p>{message}</p>}
      </div>
    </>
  );
};

export default CancelarReserva;
