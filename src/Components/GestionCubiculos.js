import React, {useState} from "react";
import { useNavigate } from 'react-router-dom';
import TopBar from "./TopBar";
import '../menu.css';
import axios from 'axios';


const GestionCubiculo = () => {
    const [numCubiculo, setNumCubiculo] = useState("");
    const [name, setName] = useState("");
    const [time, setTime] = useState("");
    const [capacity, setCapacity] = useState(3);
    const [id, setId] = useState("");
    const [status, setStatus] = useState("Disponible");

    const navigate = useNavigate();

    const handleStatusChange = (event) => {
        const value = event.target.value;
        if (value === "Disponible") {
          setStatus(1);
        } else if (value === "Bloqueado") {
          setStatus(2);
        } else if (value === "Fuera de Servicio") {
          setStatus(3);
        }
      };
    
    const handleAgregar = async (e) => {
        e.preventDefault();
        try {
          const idEstado = parseInt(idEstado);
          const capacidad = parseInt(capacidad);
          const servEspInt = parseInt(servEspInt);
    
          const response = await axios.get(
            `http://localhost:3001/api/agregarCubiculo/${idEstado}/${capacidad}/${servEspInt}/${name}`
          );
          const resultado = response.data.result;
    
          if (resultado === 1) {
            alert("Se agregó exitosamente");
          } else {
            alert("El nombre de cubículo ya existe");
          }
        } catch (error) {
          console.log("Error");
        }
      };


    return (
        <>
            <TopBar />
            <div id="menu-btns">
                <h1 className="page-title">Gestión de Cubículos</h1>
                <form id="mod-admin">
                    <label>
                        Número de cubículo:<br></br><br></br>
                        <input type="number" name="cubNum" value={numCubiculo} defaultValue={numCubiculo}
                        onChange={(e) => setNumCubiculo(e.target.value)}
                        min={1} max={39} required/><br></br><br></br>
                    </label>
                    <label>
                        Nombre de cubículo:<br></br><br></br>
                        <input type="text" name="name" value={name} autoComplete="off"  defaultValue={name}
                        onChange={(e) => setName(e.target.value)}/><br></br><br></br>
                    </label>
                    <label>
                        Tiempo de máximo uso (en horas):<br></br><br></br>
                        <input type="number" name="time" value={time} defaultValue={time}
                        onChange={(e) => setTime(e.target.value)}
                        min={1} max={24}/><br></br><br></br>
                    </label>
                    <label>
                        Capacidad:<br></br><br></br>
                        <input type="number" name="capacity" value={capacity} defaultValue={capacity}
                        onChange={(e) => setCapacity(e.target.value)}
                        min={3} max={8}/><br></br><br></br>
                    </label>
                    <label>
                        Servicio especial:
                        <input
                            type="checkbox"
                            name="cubAccs"
                            value={id}
                            defaultValue={id}
                            onChange={(e) => setId(e.target.value)}
                        />
                    </label>
                    <div className="container">
                        <label >
                            Estado de Cubículo: <br/>
                            <input
                                type="radio"
                                id="disponible"
                                name="estado"
                                value="Disponible"
                                className="radio-input"
                                checked={status === 'Disponible'}
                                onChange={handleStatusChange}
                            />
                            <label>Disponible</label>
                            <br />
                            <input
                                type="radio"
                                id="bloqueado"
                                name="estado"
                                value="Bloqueado"
                                className="radio-input"
                                checked={status === 'Bloqueado'}
                                onChange={handleStatusChange}
                            />
                            <label>Bloqueado</label>
                            <br />
                            <input
                                type="radio"
                                id="fuera de servicio"
                                name="estado"
                                value="Fuera de Servicio"
                                className="radio-input"
                                checked={status === 'Fuera de Servicio'}
                                onChange={handleStatusChange}
                            />
                            <label>Fuera de Servicio</label>
                        </label><br></br>
                    </div>
                </form><br></br><br></br>
                <div className="gestion-btns">
                    <button onClick={handleAgregar} className='gestion-chooseOption'>
                        Agregar
                    </button>
                    <button onClick={handleAgregar} className='gestion-chooseOption'>
                        Consultar
                    </button>
                    <button onClick={handleAgregar} className='gestion-chooseOption'>
                        Modificar
                    </button>
                    <button onClick={handleAgregar} className='gestion-chooseOption'>
                        Eliminar
                    </button>
                    <button onClick={() => navigate('/menuAdmin')} className='gestion-chooseOption'>
                        Regresar
                    </button>
                </div>
            </div>
        </>
    )
}
export default GestionCubiculo;