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
                <form id="mod-estudiante">
                    <label>
                        Número de carnet:<br></br><br></br>
                        <input type="number" name="name"/><br></br><br></br>
                    </label>
                </form>
                {/*Se tiene que hacer otra ventana donde se muestre la informacion del estudiante si existe y se pueda modificar*/}
                <button onClick={() => navigateInfo('/menuAdmin/modificarEstudiante/infoStudent')} className='est-chooseOption'>
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