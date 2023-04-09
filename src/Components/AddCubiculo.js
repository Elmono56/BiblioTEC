import React, { useState } from "react";
import axios from "axios";
import { useNavigate } from "react-router-dom";
import TopBar from "./TopBar";
import "../menu.css";

const AddCubiculo = () => {
  const navigate = useNavigate();
  const [mensaje, setMensaje] = useState("");

  const handleSubmit = async (event) => {
    event.preventDefault();
    const form = event.target;
    const capPersonas = parseInt(form.capPersonas.value);
    const cubAccs = form.cubAccs.checked ? 2 : 1;

    try {
      await axios.get(
        `http://localhost:3001/api/insertar/${capPersonas}/${cubAccs}`
      );
      setMensaje("Cubículo agregado correctamente");
    } catch (error) {
      console.error("Error al agregar cubículo:", error);
      setMensaje("Error al agregar cubículo: " + error.message);
    }
  };

  return (
    <>
      <TopBar />
      <h1 className="page-title">Agregar Cubículo</h1>
      {mensaje && <p>{mensaje}</p>}
      <div id="menu-btns">
        <form onSubmit={handleSubmit} id="form-agregar">
          <label>
            Capacidad de personas:
            <input type="number" name="capPersonas" />
            <br></br>
            <br></br>
          </label>
          <label>
            Cubiculo accesible:
            <input type="checkbox" name="cubAccs" />
            <br></br>
            <br></br>
          </label>
          <button type="submit" className="est-chooseOption">
            Agregar
          </button>
        </form>
        <button
          onClick={() => navigate("/menuAdmin")}
          className="est-chooseOption"
        >
          Regresar
        </button>
      </div>
    </>
  );
};

export default AddCubiculo;
