import React, { useState, useEffect } from "react";
import { useNavigate } from "react-router-dom";
import axios from "axios";
import TopBar from "./TopBar";
import "../menu.css";

const ConsultarCubiculo = () => {
    const navigate = useNavigate();
    const [reservations, setReservations] = useState([]);
    const [reservationNumber, setReservationNumber] = useState(1);
    const [numCubiculo, setNumCubiculo] = useState("");
    const [name, setName] = useState("");
    const [time, setTime] = useState("");
    const [capacity, setCapacity] = useState(3);
    const [id, setId] = useState(1);
    const [status, setStatus] = useState(1);

    const handleReservationNumberChange = (e) => {
        setReservationNumber(e.target.value);
    };

    return (
        <>
            <TopBar />
            <div id="menu-btns">
                <h1 className="page-title">Consultar cubículo</h1>
                <form id="form-gestionReservas">
                    <label style={{ marginRight: "20px" }}>Número de cubículo </label>
                    <br></br>
                    <input type="number" name="name" min={1} autoComplete="off" value={reservationNumber} onChange={handleReservationNumberChange} />
                    <br></br>
                    <br></br>
                    <table id="table">
                        <thead>
                            <tr>
                                <th>Nombre de cubículo</th>
                                <th>Tiempo de máximo uso (en horas)</th>
                                <th>Capacidad</th>
                                <th>Servicio especial</th>
                                <th>Estado</th>
                            </tr>
                        </thead>
                        <tbody>
                            {reservations.map((reservation) => (
                                <tr key={reservation.name}>
                                    <td>{reservation.time}</td>
                                    <td>{reservation.capacity}</td>
                                    <td>{reservation.id}</td>
                                    <td>{reservation.status}</td>
                                </tr>
                            ))}
                        </tbody>
                    </table>
                    <br />
                    <br />
                    <button
                        onClick={() => navigate("/menuAdmin")}
                        className="gestion-chooseOption"
                    >
                        Consultar
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

export default ConsultarCubiculo;
