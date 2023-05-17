import React, { useState } from "react";
import { useNavigate } from "react-router-dom";
import TopBar from "./TopBar";
import "../menu.css";
import axios from "axios";

const RegisterStudent = () => {
    const [carnet, setCarnet] = useState("");
    const [correo, setCorreo] = useState("");
    const [contrasena, setContrasena] = useState("");
    const [servicio, setServicio] = useState(false);
    const [nombre, setNombre] = useState("");
    const [apellido1, setApellido1] = useState("");
    const [apellido2, setApellido2] = useState("");
    const [cedula, setCedula] = useState("");
    const [edad, setEdad] = useState("");
    const [fechaNacimiento, setFechaNacimiento] = useState("");

    const handleRegister = async (e) => {
        e.preventDefault();
        try {
            const cedulaInt = parseInt(cedula);
            const carnetInt = parseInt(carnet);

            const response = await axios.get(
                `/api/login/${correo}/${apellido1}/${apellido2}/${nombre}/${carnetInt}/${fechaNacimiento}/${contrasena}/${cedulaInt}`
            );
            const resultado = response.data.result;

            if (resultado === 1) {
                alert("Registro exitoso");
                navigate("../");
            } else {
                alert("El usuario ya existe");
            }
            // Do something with the response, e.g. navigate to a new page
        } catch (error) {
            console.log("Error");
        }
    };

    const navigate = useNavigate();
    return (
        <>
            <TopBar />
            <div id="menu-btns">
                <h1 className="page-title">Registrar estudiante</h1>
                <form id="form-agregar">
                    <div className="form-group">
                        <label htmlFor="cedula">Cédula</label>
                        <input
                            type="text"
                            className="loginBoxes"
                            id="cedula"
                            value={cedula}
                            onChange={(e) => setCedula(e.target.value)}
                        />
                    </div>
                    <div className="form-group">
                        <label htmlFor="carnet">Carné</label>
                        <input
                            type="text"
                            className="loginBoxes"
                            id="carnet"
                            value={carnet}
                            onChange={(e) => setCarnet(e.target.value)}
                        />
                    </div>
                    <div className="form-group">
                        <label htmlFor="nombre">Nombre</label>
                        <input
                            type="text"
                            className="loginBoxes"
                            id="nombre"
                            value={nombre}
                            onChange={(e) => setNombre(e.target.value)}
                        />
                    </div>
                    <div className="form-group">
                        <label htmlFor="apellido1">Apellido 1</label>
                        <input
                            type="text"
                            className="loginBoxes"
                            id="apellido1"
                            value={apellido1}
                            onChange={(e) => setApellido1(e.target.value)}
                        />
                    </div>
                    <div className="form-group">
                        <label htmlFor="apellido2">Apellido 2</label>
                        <input
                            type="text"
                            className="loginBoxes"
                            id="apellido2"
                            value={apellido2}
                            onChange={(e) => setApellido2(e.target.value)}
                        />
                    </div>
                    <div className="form-group">
                        <label htmlFor="edad">Edad</label>
                        <input
                            type="number"
                            className="loginBoxes"
                            id="edad"
                            min={17}
                            max={100}
                            value={edad}
                            onChange={(e) => setEdad(e.target.value)}
                        />
                    </div>
                    <div className="form-group">
                        <label htmlFor="correo">Correo</label>
                        <input
                            type="email"
                            className="loginBoxes"
                            id="correo"
                            value={correo}
                            onChange={(e) => setCorreo(e.target.value)}
                        />
                    </div>
                    <div className="form-group">
                        <label htmlFor="contrasena">Contraseña</label>
                        <input
                            type="password"
                            className="loginBoxes"
                            id="contrasena"
                            value={contrasena}
                            onChange={(e) => setContrasena(e.target.value)}
                        />
                    </div>
                    <div className="form-group">
                        <label htmlFor="servicio">Servicio especial</label> <br></br>
                        <input
                            type="checkbox"
                            checked={servicio === 1}
                            onChange={(e) => setServicio(e.target.checked ? 1 : 2)}
                        />
                    </div>
                    <div className="form-group">
                        <label htmlFor="fechaNacimiento">Fecha de Nacimiento</label>
                        <input
                            type="date"
                            className="loginBoxes"
                            id="fechaNacimiento"
                            value={fechaNacimiento}
                            onChange={(e) => setFechaNacimiento(e.target.value)}
                        />
                    </div>
                    <button
                        type="submit"
                        className="est-chooseOption"
                        onClick={handleRegister}
                        style={{ marginLeft: 15 }}
                    >
                        Registrar
                    </button>
                    <button
                        onClick={() => navigate("../")}
                        className="est-chooseOption"
                        style={{ marginLeft: 15 }}
                    >
                        Regresar
                    </button>
                </form>
            </div>
        </>
    );
};

export default RegisterStudent;
