import React from "react";
import { useNavigate } from 'react-router-dom';
import TopBar from "./TopBar";
import '../menu.css';

const InformeUsoEstudiante = () => {
    const navigate = useNavigate();
    const navigateInfo = useNavigate();
    return (
        <>
            <TopBar />
            <div id="menu-btns">
                <h1 className="page-title">Consulta Estudiante</h1>
                <form id="mod-estudiante">
                    <label>
                        Número de carnet:<br></br><br></br>
                        <input type="number" name="name"/><br></br><br></br>
                    </label>
                </form>
                <button onClick={() => navigateInfo('./reporteAdmin')} className='est-chooseOption'>
                    Aceptar
                </button>
                <button onClick={() => navigate('/menuAdmin')} className='est-chooseOption'>
                    Regresar
                </button>
            </div>
        </>
    )
}
export default InformeUsoEstudiante;