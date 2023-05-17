import React, { useState, useEffect } from "react";
import { useNavigate } from "react-router-dom";
import axios from "axios";
import TopBar from "./TopBar";
import "../menu.css";

const ConsultarReservas = () => {
  const navigate = useNavigate();
  const [reservations, setReservations] = useState([]);
  const [reservationNumber, setReservationNumber] = useState();

  const handleConsultarClick = async (e) => {
    
    e.preventDefault();
    try {
      const response = await axios.get(
        "/api/consultarReserva"
      );
      setReservations(response.data);
    } catch (error) {
      console.error(error);
    }
  };


  const handleConsultarEspecifico = async (e) => {
    
    e.preventDefault();
    try {
      const response = await axios.get(
        `/api/consultarReservaEsp/${reservationNumber}`
      );
      setReservations(response.data);
    } catch (error) {
      console.error(error);
    }
  };

  const handleReservationNumberChange = (e) => {
    setReservationNumber(e.target.value);
  };

  return (
    <>
      <TopBar />
      <div id="menu-btns">
        <h1 className="page-title">Consultar reservas</h1>
        <form id="form-gestionReservas">
          <label style={{ marginRight: "20px" }}>Número de reserva </label>
          <br></br>
          <input type="number" name="name" min={1} autoComplete="off" value={reservationNumber} onChange={handleReservationNumberChange} />
          <br></br>
          <br></br>
          <table id="table">
            <thead>
              <tr>
                <th>Número de carnet</th>
                <th>Fecha de reserva</th>
                <th>Hora inicial</th>
                <th>Hora final</th>
                <th>Capacidad</th>
                <th>Servicio especial</th>
                <th>Estado</th>
              </tr>
            </thead>
            <tbody>
              {reservations.map((reservation) => (
                <tr key={reservation.idReserva}>
                  <td>{reservation.numCarnet}</td>
                  <td>{reservation.fechaReserv}</td>
                  <td>{reservation.horaInicio}</td>
                  <td>{reservation.horaFin}</td>
                  <td>{reservation.capacidad}</td>
                  <td>{reservation.servEsp}</td>
                  <td>{reservation.estadoReserva}</td>
                </tr>
              ))}
            </tbody>
          </table>
          <br />
          <br />
          <button
            onClick={handleConsultarClick}
            className="gestion-chooseOption"
          >
            Consultar todos
          </button>
          <button
            onClick={handleConsultarEspecifico}
            className="gestion-chooseOption"
          >
            Consultar cubiculo
          </button>
          <button
            onClick={() => navigate("/menuAdmin")}
            className="gestion-chooseOption"
          >
            Regresar
          </button>
        </form>
      </div>
    </>
  );
};

export default ConsultarReservas;
