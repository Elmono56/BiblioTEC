import React from "react";
import { useNavigate } from 'react-router-dom';
import TopBar from "./TopBar";
import '../menu.css';
const ReservarCubiculo = () => {
    const navigate = useNavigate();
    return(
        <>
            <TopBar/>
            <section id="rsv-cub">
                <h1 className="page-title">Reservar cubículo</h1>
                {/*Formulario que pida el número de personas que van a usar el cubículo, un input tipo date y la hora*/}
                <form id="form-reservar">
                    <label htmlFor="numPersonas">Número de personas</label><br></br>
                    <input type="number" id="numPersonas" name="numPersonas" min="3" max="8" required className="UIReservar"/>
                    <label htmlFor="fecha">Fecha</label><br></br>
                    <input type="date" id="fecha" name="fecha" required className="UIReservar"/>
                    <label htmlFor="hora">Hora</label><br></br>
                    <input type="time" id="hora" name="hora" required className="UIReservar"/>
                </form>

                <button className="est-chooseOption">Reservar</button>
                <button onClick={() => navigate('/menu')} className="est-chooseOption">Regresar</button>
            </section>
        </>

    );
};
export default ReservarCubiculo;