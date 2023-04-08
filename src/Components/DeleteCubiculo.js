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
                <h1 className="page-title">Eliminar Cubiculo</h1>
                <form className="form-reservar">
                    <label>
                        Numero de cubiculo:
                        <input type="number" name="name" min="1" max="39" required/><br></br><br></br>
                    </label>
                    <label>
                        Motivo de eliminacion:
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