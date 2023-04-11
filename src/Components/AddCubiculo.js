import React from "react";
import { useNavigate } from 'react-router-dom';
import TopBar from "./TopBar";
import '../menu.css';

const AddCubiculo = () => {
    const navigate = useNavigate();
    return (
        <>
            <TopBar />
            <h1 className="page-title">Agregar Cubículo</h1>
            <div id="menu-btns">
                <form id="form-agregar">
                    <label>
                        Número de cubículo:
                        <input type="number" name="name" min="1" max="39" required/><br></br><br></br>
                    </label>
                    <label>
                        Capacidad de personas:
                        <input type="number" name="name" /><br></br><br></br>
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