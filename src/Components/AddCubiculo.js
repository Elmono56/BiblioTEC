import React from "react";
import { useNavigate } from 'react-router-dom';
import TopBar from "./TopBar";
import '../menu.css';

const AddCubiculo = () => {
    const navigate = useNavigate();
    return (
        <>
            <TopBar />
            <div id="menu-btns">
                <h1 className="page-title">Agregar Cubiculo</h1>
                {/*<div id="report-content">
					{/* Agrega aquí el contenido del cubiculo
				</div>*/}
                <button className='est-chooseOption'>
                    Agregar
                </button>
				<button onClick={() => navigate('/menuAdmin')} className='est-chooseOption'>
					Regresar
				</button>
            </div>
        </>
    )
}
export default AddCubiculo;