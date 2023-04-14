import React, {useState} from "react";
import { useNavigate } from 'react-router-dom';
import TopBar from "./TopBar";
import '../menu.css';

const GestionCubiculo = () => {
    const [numCubiculo, setNumCubiculo] = useState("");
    const [name, setName] = useState("");
    const [capacity, setCapacity] = useState("");
    const [id, setId] = useState("");
    const [status, setStatus] = useState("Disponible");

    const navigate = useNavigate();

    const handleStatusChange = (event) => {
        setStatus(event.target.value);
    };

    return (
        <>
            <TopBar />
            <div id="menu-btns">
                <h1 className="page-title">Gestión de Cubículos</h1>
                <form id="mod-admin">
                    <label>
                        Número de cubículo:<br></br><br></br>
                        <input type="number" name="cubNum" value={numCubiculo} defaultValue={numCubiculo}
                        onChange={(e) => setNumCubiculo(e.target.value)}
                        min={1} max={39} required/><br></br><br></br>
                    </label>
                    <label>
                        Nombre de cubículo:<br></br><br></br>
                        <input type="text" name="name" value={name} defaultValue={name}
                        onChange={(e) => setName(e.target.value)}/><br></br><br></br>
                    </label>
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
                    </label>
                    <div className="container">
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
                        </label><br></br>
                    </div>
                </form><br></br><br></br>
                <div className="gestion-btns">
                    <button onClick={() => navigate('./')} className='gestion-chooseOption'>
                        Agregar
                    </button>
                    <button onClick={() => navigate('./')} className='gestion-chooseOption'>
                        Consultar
                    </button>
                    <button onClick={() => navigate('./')} className='gestion-chooseOption'>
                        Modificar
                    </button>
                    <button onClick={() => navigate('/')} className='gestion-chooseOption'>
                        Eliminar
                    </button>
                </div>
            </div>
        </>
    )
}
export default GestionCubiculo;