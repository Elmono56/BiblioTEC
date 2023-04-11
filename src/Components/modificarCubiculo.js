import React from "react";
import { useNavigate } from 'react-router-dom';
import TopBar from "./TopBar";
import '../menu.css';

const ModificarCubiculo = () => {
    const navigate = useNavigate();
    const navigateInfo = useNavigate();
    return (
        <>
            <TopBar />
            <div id="menu-btns">
                <h1 className="page-title">Modificar Cubículo</h1>
                <form id="mod-estudiante">
                    <label>
                        Número de cubículo:<br></br><br></br>
                        <input type="number" name="name" min={1} max={39} required/><br></br><br></br>
                    </label>
                </form>
                <button onClick={() => navigateInfo('./informacionCubiculo')} className='est-chooseOption'>
                    Aceptar
                </button>
                <button onClick={() => navigate('/menuAdmin')} className='est-chooseOption'>
                    Regresar
                </button>
            </div>
        </>
    )
}

export default ModificarCubiculo;