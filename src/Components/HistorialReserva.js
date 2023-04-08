import React from "react";
import { useNavigate } from 'react-router-dom';
import TopBar from "./TopBar";
import '../menu.css';

const HistorialReserva = () => {
    const navigate = useNavigate();
    const reservations = [
        { id: 1, date: '2023-04-08', cubicle: 14, status: 'aprobada' },
        { id: 2, date: '2023-04-09', cubicle: 8, status: 'cancelada' },
        { id: 3, date: '2023-04-10', cubicle: 22, status: 'pendiente' },
        //datos de prueba
        //aqui se debe hacer la consulta a la base de datos
    ];
    return (
        <>
        <TopBar />
        <div id="menu-btns">
            <h1 className="page-title">Historial de reservas</h1>
            {reservations.length === 0 ? (
                <p>No hay reservas que mostrar</p>
            ) : (
                <table id="form-reservar">
                    <thead>
                        <tr>
                            <th>Fecha</th>
                            <th>Cubículo</th>
                            <th>Estado</th>
                        </tr>
                    </thead>
                    <tbody>
                        {reservations.map(reservation => (
                            <tr key={reservation.id}>
                                <td>{reservation.date}</td>
                                <td>{reservation.cubicle}</td>
                                <td>{reservation.status}</td>
                            </tr>
                        ))}
                    </tbody>
                </table>
            )}
            <button onClick={() => navigate('/menu')} className="est-chooseOption">Regresar</button>
        </div>
        </>
    );
}
export default HistorialReserva;