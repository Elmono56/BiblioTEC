import React from "react";
import { useNavigate } from 'react-router-dom';
import TopBar from './TopBar';
import '../menu.css';

const CancelarReserva = () => {
    const navigate = useNavigate();
    const navigateInfo = useNavigate();
    return (
        <>
            <TopBar />
            <div id="menu-btns">
                <h1 className="page-title">Cancelar Reserva</h1>
                <form className="form-reservar">
                    <label>
                        Número de reserva:
                        <input type="number" name="name"/><br></br><br></br>
                    </label>
                </form>
                <button onClick={() => navigateInfo('/menu')} className='est-chooseOption'>
                    Consultar
                </button>
                <button onClick={() => navigate('/menu')} className='est-chooseOption'>
                    Regresar
                </button>
            </div>
        </>
    )
}
export default CancelarReserva;