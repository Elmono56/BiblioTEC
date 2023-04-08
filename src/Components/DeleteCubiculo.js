import React from "react";
import { useNavigate } from 'react-router-dom';
import TopBar from "./TopBar";
import '../menu.css';

const DeleteCubiculo = () => {
    const navigate = useNavigate();
    return (
        <>
            <TopBar />
            <div id="menu-btns">
                <h1 className="page-title">Eliminar Cubículo</h1>
                <form id="form-eliminar">
                    <label>
                        Número de cubículo:<br></br>
                        <input type="number" name="name" min="1" max="39" required/><br></br><br></br>
                    </label>
                    <label>
                        Motivo de eliminación:<br></br>
                        <input type="text" name="name" /><br></br><br></br>
                    </label>
                </form>
                <button className='est-chooseOption'>
                    Eliminar
                </button>
                <button onClick={() => navigate('/menuAdmin')} className='est-chooseOption'>
                    Regresar
                </button>
            </div>
        </>
    )
}
export default DeleteCubiculo;