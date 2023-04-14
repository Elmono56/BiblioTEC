import React, { useState, useEffect } from "react";
import { useNavigate } from 'react-router-dom';
import axios from 'axios';
import TopBar from "./TopBar";
import '../menu.css';

const ConsultarReservas = () => {
    const navigate = useNavigate();
    const [reservations, setReservations] = useState([]);
    const carnet = localStorage.getItem('carnet');

    return (
        <>
        <TopBar />
        <div id="menu-btns">
            <h1 className="page-title">Consultar reservas</h1>
            <form id="form-gestionReservas">
                <label style={{marginRight: "20px"}}>
                    Número de reserva </label><br></br>
                    <input type="number" name="name"/><br></br><br></br>
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
                    {reservations.map(reservation => (
                        <tr key={reservation.idReserva}>
                            <td>{reservation.numCubiculo}</td>
                            <td>{reservation.fechaReserv}</td>
                            <td>{reservation.numReserva}</td>
                        </tr>
                    ))}
                </tbody>
            </table>
            <br/><br/>
            <button onClick={() => navigate('/menuAdmin')} className='gestion-chooseOption'>Regresar</button>
            </form>
        </div>
        </>
    )
}

export default ConsultarReservas;