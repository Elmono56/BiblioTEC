import React, { useState } from "react";
import { useNavigate } from "react-router-dom";
import axios from "axios"; // add this line
import TopBar from "./TopBar";
import "../menu.css";

const Disponibilidad = () => {
  const navigate = useNavigate();
  const [selectedCubiculo, setSelectedCubiculo] = useState("");
  const [cubiculoDisponible, setCubiculoDisponible] = useState(null);

  const handleAceptar = async (e) => {
    e.preventDefault();
    try {
      const response = await axios.get(
        `/api/disponibilidad/${selectedCubiculo}`
      );
      const result = response.data.result;
      console.log("Output value:", result);
      if (result === 1) {
        setCubiculoDisponible(true);
      } else {
        setCubiculoDisponible(false);
      }
    } catch (error) {
      console.error("Error executing stored procedure:", error);
    }
  };

  let message = null;
  if (cubiculoDisponible === true) {
    message = "Cubículo disponible";
  } else if (cubiculoDisponible === false) {
    message = "Cubículo no disponible";
  }

  return (
    <>
      <TopBar />
      <div id="menu-btns">
        <h1 className="page-title">Disponibilidad de cubículos</h1>
        <form id="disp-cubiculo">
          <label>
            Cubículo:
            <br></br>
            <br></br>
            <select
              name="cubiculo"
              onChange={(event) => setSelectedCubiculo(event.target.value)}
            >
              <option value="">Selecciona un cubículo</option>
              <optgroup label="Piso 1">
                <option value="1">1</option>
                <option value="2">2</option>
                <option value="3">3</option>
              </optgroup>
              <optgroup label="Piso 2">
                <option value="4">4</option>
                <option value="5">5</option>
                <option value="6">6</option>
              </optgroup>
              <optgroup label="Piso 3">
                <option value="7">7</option>
                <option value="8">8</option>
                <option value="9">9</option>
              </optgroup>
            </select>
          </label>
        </form>
        <button
          onClick={handleAceptar}
          className="est-chooseOption"
          disabled={!selectedCubiculo}
        >
          Aceptar
        </button>
        {message && <p>{message}</p>}
        <button onClick={() => navigate("/menu")} className="est-chooseOption">
          Regresar
        </button>
      </div>
    </>
  );
};
export default Disponibilidad;
