import React, { useState, useEffect } from "react";
import { useNavigate } from 'react-router-dom';
import axios from 'axios';
import TopBar from "./TopBar";
import '../menu.css';

const HistorialReserva = () => {
    const navigate = useNavigate();
    const [reservations, setReservations] = useState([]);
    const carnet = localStorage.getItem('carnet');

    useEffect(() => {
        const fetchData = async () => {
            try {
                const response = await axios.get(`/api/historial/${carnet}`);
                setReservations(response.data);
            } catch (error) {
                console.error("Error fetching reservations:", error);
            }
        };
        fetchData();
    }, [carnet]);

    return (
        <>
        <TopBar />
        <div id="menu-btns">
            <h1 className="page-title">Historial de reservas</h1>
            <table id="table">
                <thead>
                    <tr>
                        <th>Número de cubículo</th>
                        <th>Fecha de reserva</th>
                        <th>Número de reserva</th>
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
            <button onClick={() => navigate('/menu')} className="est-chooseOption">Regresar</button>
        </div>
        </>
    );
}

export default HistorialReserva;