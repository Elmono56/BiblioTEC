import React from "react";
import { useNavigate } from 'react-router-dom';
import TopBar from "./TopBar";
import '../menu.css';

const ModifyStudent = () => {
    const navigate = useNavigate();
    const navigateInfo = useNavigate();
    return (
        <>
            <TopBar />
            <div id="menu-btns">
                <h1 className="page-title">Modificar estudiante</h1>
                <form id="del-estudiante">
                    <label>
                        Número de carnet:<br></br><br></br>
                        <input type="text" name="name" autoComplete="off" required/><br></br><br></br>
                    </label>
                </form>
                <button onClick={() => navigateInfo('./informacionEstudiante')} className='est-chooseOption'>
                    Aceptar
                </button>
                <button onClick={() => navigate('/menuAdmin')} className='est-chooseOption'>
                    Regresar
                </button>
            </div>
        </>
    )
}
export default ModifyStudent;