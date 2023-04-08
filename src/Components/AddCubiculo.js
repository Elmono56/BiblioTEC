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
                <form className="form-reservar">
                    <label>
                        Numero de cubiculo:
                        <input type="number" name="name" min="1" max="39" required/><br></br><br></br>
                    </label>
                    <label>
                        Capacidad de personas:
                        <input type="text" name="name" /><br></br><br></br>
                    </label>
                    <label>
                        Cubiculo accesible:
                        <input type="checkbox" name="name" /><br></br><br></br>
                    </label>
                </form>
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