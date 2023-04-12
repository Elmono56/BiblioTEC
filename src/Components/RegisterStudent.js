import React, {useState} from 'react';
import { useNavigate } from 'react-router-dom';
import TopBar from './TopBar';
import '../menu.css';

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

    const navigate = useNavigate();
    return (
        <>
            <TopBar />
            <div id="menu-btns">
                <h1 className="page-title">Registrar estudiante</h1>
                <form id="form-agregar">
                    <div className="form-group">
                        <label for="cedula">Cédula</label>
                        <input type="text" className="loginBoxes" id="cedula" placeholder="Cédula" 
                        value={cedula}
                        onChange={(e) => setCedula(e.target.value)}/>
                    </div>
                    <div className="form-group">
                        <label for="carnet">Carné</label>
                        <input type="text" className="loginBoxes" id="carnet" placeholder="Carné    " 
                        value={carnet}
                        onChange={(e) => setCarnet(e.target.value)}/>
                    </div>
                    <div className="form-group">
                        <label for="nombre">Nombre</label>
                        <input type="text" className="loginBoxes" id="nombre" placeholder="Nombre" 
                        value={nombre}
                        onChange={(e) => setCarnet(e.target.value)}/>
                    </div>
                    <div className="form-group">
                        <label for="apellido1">Apellido 1</label>
                        <input type="text" className="loginBoxes" id="apellido1" placeholder="Apellido 1" 
                        value={apellido1}
                        onChange={(e) => setApellido1(e.target.value)}/>
                    </div>
                    <div className="form-group">
                        <label for="apellido2">Apellido 2</label>
                        <input type="text" className="loginBoxes" id="apellido2" placeholder="Apellido 2" 
                        value={apellido2}
                        onChange={(e) => setApellido2(e.target.value)}/>
                    </div>
                    <div className="form-group">
                        <label for="edad">Edad</label>
                        <input type="number" className="loginBoxes" id="edad" placeholder="Edad" min={17} max={100}
                        value={edad}
                        onChange={(e) => setEdad(e.target.value)}/>
                    </div>
                    <div className="form-group">
                        <label for="correo">Correo</label>
                        <input type="email" className="loginBoxes" id="correo" placeholder="Correo" 
                        value={correo}
                        onChange={(e) => setCorreo(e.target.value)}/>
                    </div>
                    <div className="form-group">
                        <label for="contrasena">Contraseña</label>
                        <input type="password" className="loginBoxes" id="contrasena" placeholder="Contraseña" 
                        value={contrasena}
                        onChange={(e) => setContrasena(e.target.value)}/>
                    </div>
                    <div className="form-group">
                        <label for="servicio">Servicio especial</label> <br></br>
                        <input type="checkbox" 
                        value={servicio}
                        onChange={(e) => setServicio(e.target.value)}/>
                    </div>
                    <div className="form-group">
                        <label for="fechaNacimiento">Fecha de Nacimiento</label>
                        <input type="date" className="loginBoxes" id="fechaNacimiento"
                        value={fechaNacimiento}
                        onChange={(e) => setFechaNacimiento(e.target.value)}/>
                    </div>
                    <button type="submit" className="est-chooseOption" onClick={() => navigate('/InfoStudent')} style={{marginLeft: 15}}>
                        Registrar
                    </button>
                    <button onClick={() => navigate('../')} className="est-chooseOption" style={{marginLeft: 15}}>
                        Regresar
                    </button>
                </form>
            </div>
        </>
    )
}

export default RegisterStudent;