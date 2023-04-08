import React from "react";
import { useNavigate } from 'react-router-dom';
import TopBar from './TopBar';
import '../menu.css';

const Disponibilidad = () => {
    {/*Formulario donde se muestre un input de lista tipo cascada de los cubiculos disponibles*/}
    const navigate = useNavigate();
    return (
        <>
            <TopBar />
            <div id="menu-btns">
                <h1 className="page-title">Disponibilidad de cubiculos</h1>
                <form className="form-reservar">
                    <label>
                        Cubiculo:
                        <select name="cubiculo">
                            <option value="">Selecciona un cubículo</option>
                            <optgroup label="Piso 1">
                                <option value="C1-01">C1-01</option>
                                <option value="C1-02">C1-02</option>
                                <option value="C1-03">C1-03</option>
                            </optgroup>
                            <optgroup label="Piso 2">
                                <option value="C2-01">C2-01</option>
                                <option value="C2-02">C2-02</option>
                                <option value="C2-03">C2-03</option>
                            </optgroup>
                            <optgroup label="Piso 3">
                                <option value="C3-01">C3-01</option>
                                <option value="C3-02">C3-02</option>
                                <option value="C3-03">C3-03</option>
                            </optgroup>
                        </select>
                    </label>
                </form>
                <button onClick={() => navigate('/menu')} className='est-chooseOption'>
                    Regresar
                </button>
            </div>
        </>
    )
}
export default Disponibilidad;