import React, { useState } from "react";
import { useNavigate } from 'react-router-dom';
import TopBar from "./TopBar";
import '../menu.css';

const InfoStudent = () => {
    const [servicio, setServicio] = useState("");
    const [status, setStatus] = useState("Activo");

    const [nombre, setNombre] = useState("");
    const [carnet, setCarnet] = useState("");
    const [correo, setCorreo] = useState("");
    const [contrasena, setContrasena] = useState("");
    const [apellido1, setApellido1] = useState("");
    const [apellido2, setApellido2] = useState("");
    const [cedula, setCedula] = useState("");
    const [edad, setEdad] = useState("");
    const [fechaNacimiento, setFechaNacimiento] = useState("");

    const navigate = useNavigate();

    const handleStatusChange = (event) => {
        setStatus(event.target.value);
    };

    return (
        <>
        <TopBar />
            <div id="menu-btns">
                <h1 className="page-title">Registrar estudiante</h1>
                <form id="form-agregar" >
                    <div className="form-group">
                        <label for="cedula">Cédula</label>
                        <input type="text" className="loginBoxes" id="cedula"
                            value={cedula}
                            onChange={(e) => setCedula(e.target.value)} />
                        <label for="carnet">Carné</label>
                        <input type="text" className="loginBoxes" id="carnet"
                            value={carnet}
                            onChange={(e) => setCarnet(e.target.value)} />
                        <label for="nombre">Nombre</label>
                        <input type="text" className="loginBoxes" id="nombre"
                            value={nombre}
                            autoComplete="off"
                            onChange={(e) => setCarnet(e.target.value)} />
                        <label for="apellido1">Apellido 1</label>
                        <input type="text" className="loginBoxes" id="apellido1"
                            value={apellido1}
                            autoComplete="off"
                            onChange={(e) => setApellido1(e.target.value)} />
                        <label for="apellido2">Apellido 2</label>
                        <input type="text" className="loginBoxes" id="apellido2"
                            value={apellido2}
                            autoComplete="off"
                            onChange={(e) => setApellido2(e.target.value)} />
                        <label for="edad">Edad</label>
                        <input type="number" className="loginBoxes" id="edad" min={17} max={100}
                            value={edad}
                            onChange={(e) => setEdad(e.target.value)} />
                        <label for="correo">Correo electrónico</label>
                        <input type="email" className="loginBoxes" id="correo"
                            value={correo}
                            autoComplete="off"
                            onChange={(e) => setCorreo(e.target.value)} />
                        <label for="contrasena">Contraseña</label>
                        <input type="password" className="loginBoxes" id="contrasena"
                            value={contrasena}
                            autoComplete="new-password"
                            onChange={(e) => setContrasena(e.target.value)} />
                        <label>
                        Servicio especial:
                        <input
                            type="checkbox"
                            name="cubAccs"
                            value={servicio}
                            defaultValue={servicio}
                            onChange={(e) => setServicio(e.target.value)}
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
                    </div><br></br>
                        <label for="fechaNacimiento">Fecha de Nacimiento</label>
                        <input type="date" className="loginBoxes" id="fechaNacimiento"
                            value={fechaNacimiento}
                            autoComplete="off"
                            onChange={(e) => setFechaNacimiento(e.target.value)} />
                    </div><br></br>
                    <button type="submit" className="est-chooseOption" onClick={() => navigate('/InfoStudent')} style={{ marginLeft: 15 }}>
                        Registrar
                    </button>
                    <button onClick={() => navigate('../')} className="est-chooseOption" style={{ marginLeft: 15 }}>
                        Regresar
                    </button>
                </form>
            </div>
        </>
    )
}

export default InfoStudent;