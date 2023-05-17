import React, { useState } from "react";
import { useNavigate } from "react-router-dom";
import TopBar from "./TopBar";
import "../menu.css";
import axios from "axios";

const GestionCubiculo = () => {
  const [numCubiculo, setNumCubiculo] = useState("");
  const [name, setName] = useState("");
  const [time, setTime] = useState("");
  const [capacity, setCapacity] = useState(3);
  const [id, setId] = useState(1);
  const [status, setStatus] = useState(1);

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
      const response = await axios.get(
        `/api/agregarCubiculo/${status}/${capacity}/${id}/${name}`
      );
      const resultado = response.data.result;

      if (resultado === 1) {
        alert("Se agregó exitosamente");
      } else {
        alert("El nombre de cubículo ya existe");
      }
    } catch (error) {}
  };


  const handleModificar = async (e) => {
    e.preventDefault();
    try {
      const response = await axios.get(
        `/api/ModificarCubiculo/${numCubiculo}/${name}/${status}/${capacity}/${id}/${time}`
      );
      const resultado = response.data.result;

      if (resultado === 1) {
        alert("Se modificó exitosamente");
      } else {
        alert("El cubículo no existe");
      }
    } catch (error) {}
  };
  


  const handleEliminar = async (e) => {
    e.preventDefault();
    try {
      const response = await axios.get(
        `/api/eliminarCubiculo/${numCubiculo}`
      );
      const resultado = response.data.result;

      if (resultado === 1) {
        alert("Se eliminó exitosamente");
      } else {
        alert("El cubículo no existe");
      }
    } catch (error) {}
  };

  const handleIdChange = (e) => {
    const isChecked = e.target.checked;
    if (isChecked) {
      setId(2);
    } else {
      setId(1);
    }
  };

  return (
    <>
      <TopBar />
      <div id="menu-btns">
        <h1 className="page-title">Gestión de Cubículos</h1>
        <form id="mod-admin">
          <label>
            Número de cubículo:<br></br>
            <br></br>
            <input
              type="number"
              name="cubNum"
              value={numCubiculo}
              onChange={(e) => setNumCubiculo(e.target.value)}
              min={1}
              max={39}
              required
            />
            <br></br>
            <br></br>
          </label>
          <label>
            Nombre de cubículo:<br></br>
            <br></br>
            <input
              type="text"
              name="name"
              value={name}
              autoComplete="off"
              onChange={(e) => setName(e.target.value)}
            />
            <br></br>
            <br></br>
          </label>
          <label>
            Tiempo de máximo uso (en horas):<br></br>
            <br></br>
            <input
              type="number"
              name="time"
              value={time}
              onChange={(e) => setTime(e.target.value)}
              min={1}
              max={24}
            />
            <br></br>
            <br></br>
          </label>
          <label>
            Capacidad:<br></br>
            <br></br>
            <input
              type="number"
              name="capacity"
              value={capacity}
              onChange={(e) => setCapacity(e.target.value)}
              min={3}
              max={8}
            />
            <br></br>
            <br></br>
          </label>
          <label>
            Servicio especial:
            <input
              type="checkbox"
              id="cubAccs"
              name="cubAccs"
              checked={id === 2}
              onChange={handleIdChange}
            />
          </label>
          <div className="container">
            <label>
              Estado de Cubículo: <br />
              <input
                type="radio"
                id="disponible"
                name="estado"
                value="Disponible"
                className="radio-input"
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
                onChange={handleStatusChange}
              />
              <label>Fuera de Servicio</label>
            </label>
            <br></br>
          </div>
        </form>
        <br></br>
        <br></br>
        <div className="gestion-btns">
          <button onClick={handleAgregar} className="gestion-chooseOption">
            Agregar
          </button>
          <button onClick={handleAgregar} className="gestion-chooseOption">
            Consultar
          </button>
          <button onClick={handleModificar} className="gestion-chooseOption">
            Modificar
          </button>
          <button onClick={handleEliminar} className="gestion-chooseOption">
            Eliminar
          </button>
          <button
            onClick={() => navigate("/menuAdmin")}
            className="gestion-chooseOption"
          >
            Regresar
          </button>
        </div>
      </div>
    </>
  );
};
export default GestionCubiculo;
