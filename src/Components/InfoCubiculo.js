import React, {useState} from "react";
import { useNavigate } from 'react-router-dom';
import TopBar from "./TopBar";
import '../menu.css';

const InfoCubiculo = () => {
    const [capacity, setCapacity] = useState("");
    const [id, setId] = useState("");
    const [status, setStatus] = useState("Disponible");

    const navigate = useNavigate();
    const navigateInfo = useNavigate();

    const handleStatusChange = (event) => {
        setStatus(event.target.value);
    };

    return (
        <>
            <TopBar />
            <div id="menu-btns">
                <h1 className="page-title">Modificar Cubículo</h1>
                <form id="mod-estudiante">
                    <label>
                        Capacidad:<br></br><br></br>
                        <input type="number" name="capacity" value={capacity} defaultValue={capacity}
                        onChange={(e) => setCapacity(e.target.value)}/><br></br><br></br>
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
                        <br />
                        <br />
                    </label>
                    <div className="radio-container">
                        <label >
                            Estado de Cubículo: <br/>
                            <input
                                type="radio"
                                id="disponible"
                                name="estado"
                                value="Disponible"
                                className="radio-input"
                                checked={status === 'Disponible'}
                                onChange={handleStatusChange}
                            />
                            <label>Disponible</label>
                            <br />
                            <input
                                type="radio"
                                id="bloqueado"
                                name="estado"
                                value="Bloqueado"
                                className="radio-input"
                                checked={status === 'Bloqueado'}
                                onChange={handleStatusChange}
                            />
                            <label>Bloqueado</label>
                            <br />
                            <input
                                type="radio"
                                id="fuera de servicio"
                                name="estado"
                                value="Fuera de Servicio"
                                className="radio-input"
                                checked={status === 'Fuera de Servicio'}
                                onChange={handleStatusChange}
                            />
                            <label>Fuera de Servicio</label>
                        </label>
                    </div>
                </form>
                <button onClick={() => navigateInfo('./modificarCubiculo')} className='est-chooseOption'>
                    Aceptar
                </button>
                <button onClick={() => navigate('/menuAdmin')} className='est-chooseOption'>
                    Regresar
                </button>
            </div>
        </>
    )
}
export default InfoCubiculo;