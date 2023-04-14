import React, {useState} from "react";
import { useNavigate } from 'react-router-dom';
import TopBar from "./TopBar";
import '../menu.css';

const GestionReservas = () => {
    const navigate = useNavigate();
    const [capacity, setCapacity] = useState("");
    const [id, setId] = useState(0);
    const [status, setStatus] = useState("Confirmado");

    const handleStatusChange = (event) => {
        setStatus(event.target.value);
    };

    return (
        <>
            <TopBar />
            <div id="menu-btns">
                <h1 className="page-title">Gestión de reservas</h1>
                <form id="form-gestionReservas">
                    <label>
                        Número de reserva<br></br><br></br>
                        <input type="number" name="name"/><br></br><br></br>
                    </label>
                    <label>
                        Número de carnet<br></br><br></br>
                        <input type="text" name="name"/><br></br><br></br>
                    </label>
                    <label>Fecha de reserva</label><br></br>
                    <input
                        type="date"
                        id="fecha"
                        name="fecha"
                        required
                        className="form-gestionReserva"
                    /><br></br>
                    <label>Hora inicial</label><br></br>
                    <input
                        type="time"
                        id="hora"
                        name="hora"
                        required
                        className="form-gestionReserva"
                    /><br></br>
                    <label>Hora final</label><br></br>
                    <input
                        type="time"
                        id="hora"
                        name="hora"
                        required
                        className="form-gestionReserva"
                    /><br></br>
                    <label>
                        Capacidad<br></br><br></br>
                        <input type="number" name="capacity" value={capacity} defaultValue={capacity}
                        onChange={(e) => setCapacity(e.target.value)}
                        min={3} max={8}/><br></br><br></br>
                    </label>
                    <label>
                        Servicio especial:
                        <input
                            type="checkbox"
                            name="cubAccs"
                            value={id}
                            defaultValue={id}
                            onChange={(e) => setId(e.target.value)}
                        />
                    </label>
                    <div className="container">
                        <label >
                            Estado de reserva: <br/>
                            <input
                                type="radio"
                                id="confirmado"
                                name="estado"
                                value="Confirmado"
                                className="radio-input"
                                checked={status === 'Confirmado'}
                                onChange={handleStatusChange}
                            />
                            <label>Confirmado</label>
                            <br />
                            <input
                                type="radio"
                                id="en espera"
                                name="estado"
                                value="En Espera"
                                className="radio-input"
                                checked={status === 'En Espera'}
                                onChange={handleStatusChange}
                            />
                            <label>En Espera</label>
                            <br />
                            <input
                                type="radio"
                                id="cancelado"
                                name="estado"
                                value="Cancelado"
                                className="radio-input"
                                checked={status === 'Cancelado'}
                                onChange={handleStatusChange}
                            />
                            <label>Cancelado</label>
                        </label><br></br>
                    </div>
                </form>
                <div className="gestion-btns">
                    <button onClick={() => navigate('./')} className='gestion-chooseOption'>
                        Eliminar
                    </button>
                    <button onClick={() => navigate('/menuAdmin')} className='gestion-chooseOption'>
                        Modificar
                    </button>
                    <button onClick={() => navigate('/menuAdmin')} className='gestion-chooseOption'>
                        Regresar
                    </button>
                </div>
            </div>
        </>
    );
}
export default GestionReservas;