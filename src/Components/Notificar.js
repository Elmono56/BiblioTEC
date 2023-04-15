import React, {useState} from "react";
import { useNavigate } from 'react-router-dom';
import TopBar from "./TopBar";
import '../menu.css';

const Notificar = () => {
    {/*crea un formulario que solicite correo, mensaje y botones de enviar y regresar*/}
    const navigate = useNavigate();
    const navigateInfo = useNavigate();
    return (
        <>
            <TopBar />
            <div id="menu-btns">
                <h1 className="page-title">Notificar estudiantes</h1>
                <form id="form-eliminar">
                    <label>
                        Correo electrónico<br></br>
                        <input type="text" name="name" autoComplete="off" /><br></br><br></br>
                    </label>
                    <label>
                        Mensaje<br></br>
                        <input type="text" name="name" autoComplete="off" /><br></br><br></br><br></br>
                    </label>
                </form>
                <button onClick={() => navigateInfo('./menuAdmin')} className='est-chooseOption'>
                    Enviar
                </button>
                <button onClick={() => navigate('/menuAdmin')} className='est-chooseOption'>
                    Regresar
                </button>
            </div>
        </>
    )
}

export default Notificar;