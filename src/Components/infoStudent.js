import React from "react";
import { useNavigate } from 'react-router-dom';
import TopBar from "./TopBar";
import '../menu.css';

const infoStudent = () => {
    const navigate = useNavigate();
    const navigateInfo = useNavigate();
    
    return (
        <>
            <TopBar />
            <div id="menu-btns">
                <h1 className="page-title">Información del estudiante</h1>
                <form id="form-agregar">
                    <label>
                        Nombre: <br></br>
                        <input type="text" name="name"/><br></br><br></br>
                    </label>
                    <label htmlFor="username">
                        Correo electrónico: <br></br>
                        <input type="text" id="username" name="username" className="loginBoxes" value={username}/><br></br><br></br>
                    </label>
                    <label htmlFor="password">
                        Contraseña: <br></br>
                        <input type="password" id="password" className="loginBoxes" value={password}/><br></br><br></br>
                    </label>
                    <label>
                        ID de servicio especial: <br></br>
                        <input type="text" name="name"/><br></br><br></br>
                    </label>
                </form>
                <button onClick={() => navigateInfo('/menu')} className='est-chooseOption'>
                    Aceptar
                </button>
                <button onClick={() => navigate('/menu')} className='est-chooseOption'>
                    Regresar
                </button>
            </div>
        </>
    )
}

export default infoStudent;