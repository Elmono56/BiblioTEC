import React, {useState} from 'react';
import { useNavigate } from 'react-router-dom';
import TopBar from './TopBar';
import '../menu.css';

const RegisterStudent = () => {
    const [carnet, setCarnet] = useState("");
    const [correo, setCorreo] = useState("");
    const [contrasena, setContrasena] = useState("");
    const [servicio, setServicio] = useState(false);

    const navigate = useNavigate();
    const navigateInfo = useNavigate();
    return (
        <>
            <TopBar />
            <div id="menu-btns">
                <h1 className="page-title">Registrar estudiante</h1>
                <form id="form-agregar">
                    <div className="form-group">
                        <label for="carnet">Carnet</label>
                        <input type="text" className="loginBoxes" id="carnet" placeholder="Carnet" 
                        value={carnet}
                        onChange={(e) => setCarnet(e.target.value)}/>
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
                        <label for="servicio">Servicio especial</label>
                        <input type="checkbox" className="loginBoxes" id="servicio" 
                        value={servicio}
                        onChange={(e) => setServicio(e.target.value)}/>
                    </div>
                    <button type="submit" className="est-chooseOption" onClick={() => navigateInfo('/InfoStudent')} style={{marginLeft: 15}}>
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