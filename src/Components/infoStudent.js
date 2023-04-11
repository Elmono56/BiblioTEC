import React, { useState } from "react";
import { useNavigate } from 'react-router-dom';
import TopBar from "./TopBar";
import '../menu.css';

const InfoStudent = () => {
    const [name, setName] = useState("");
    const [username, setUsername] = useState("");
    const [password, setPassword] = useState("");
    const [id, setId] = useState("");
    const [status, setStatus] = useState("Activo");

    const navigate = useNavigate();
    const navigateInfo = useNavigate();

    const handleStatusChange = (event) => {
        setStatus(event.target.value);
    };

    return (
        <>
            <TopBar />
            <div id="menu-btns">
                <h1 className="page-title">Información del estudiante</h1>
                <form id="form-agregar">
                    <label>
                        Nombre: <br />
                        <input
                            type="text"
                            className="loginBoxes"
                            name="name"
                            value={name}
                            onChange={(e) => setName(e.target.value)}
                        />
                        <br />
                    </label>
                    <label htmlFor="username">
                        Correo electrónico: <br />
                        <input
                            type="text"
                            id="username"
                            name="username"
                            className="loginBoxes"
                            value={username}
                            onChange={(e) => setUsername(e.target.value)}
                        />
                    </label>
                    <label htmlFor="password">
                        Contraseña: <br />
                        <input
                            type="password"
                            id="password"
                            className="loginBoxes"
                            value={password}
                            onChange={(e) => setPassword(e.target.value)}
                        />
                        <br />
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
                            Estado de Estudiante: <br/>
                            <input
                                type="radio"
                                id="activo"
                                name="estado"
                                value="Activo"
                                className="radio-input"
                                checked={status === 'Activo'}
                                onChange={handleStatusChange}
                            />
                            <label>Activo</label>
                            <br />
                            <input
                                type="radio"
                                id="inactivo"
                                name="estado"
                                value="Inactivo"
                                className="radio-input"
                                checked={status === 'Inactivo'}
                                onChange={handleStatusChange}
                            />
                            <label>Inactivo</label>
                            <br />
                            <input
                                type="radio"
                                id="moroso"
                                name="estado"
                                value="Moroso"
                                className="radio-input"
                                checked={status === 'Moroso'}
                                onChange={handleStatusChange}
                            />
                            <label>Moroso</label>
                        </label>
                    </div>
                </form>
                <button onClick={() => navigateInfo('/menuAdmin/modificarEstudiante')} className='est-chooseOption'>
                    Aceptar
                </button>
                <button onClick={() => navigate('/menuAdmin/modificarEstudiante')} className='est-chooseOption'>
                    Regresar
                </button>
            </div>
        </>
    )
}

export default InfoStudent;