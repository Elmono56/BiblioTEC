import React from "react";
import TopBar from "./TopBar";
import "../menu.css";
import { useNavigate } from 'react-router-dom';
const ConsultarCubiculo = () => {
	const navigate = useNavigate();
    return (
        <>
        <TopBar />
        <h1 className="page-title" style={{marginLeft: 530}}>Consultar Cubículo</h1>
        <form id="cons-cubiculo">
        <label>Número de cubiculo:</label><br></br><br></br>
        <input type='number' name='numCubiculo' min='1' required></input><br></br>
        <input type='submit' value='Consultar' className="est-chooseOption" style={{marginLeft: -10}}></input>
        </form>
        <button onClick={() => navigate('/menuAdmin')} className='est-chooseOption' style={{marginLeft: 681}}>
                    Regresar
        </button>
        </>

    );
}
export default ConsultarCubiculo;