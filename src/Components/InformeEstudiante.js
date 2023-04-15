import React, { useState } from "react";
import { useNavigate } from "react-router-dom";
import TopBar from "./TopBar";
import "../menu.css";

const InformeUsoEstudiante = () => {
  const navigate = useNavigate();
  const navigateInfo = useNavigate();
  const [carnet, setCarnet] = useState("");

  const handleChange = (event) => {
    setCarnet(event.target.value);
  };

  const handleSubmit = (event) => {
    event.preventDefault();
    localStorage.setItem("carnet", carnet);
    navigateInfo("./reporteAdmin");
  };

  return (
    <>
      <TopBar />
      <div id="menu-btns">
        <h1 className="page-title">Consulta Estudiante</h1>
        <form id="mod-estudiante" onSubmit={handleSubmit}>
          <label>
            Número de carnet:<br></br>
            <br></br>
            <input
              type="number"
              name="name"
              autoComplete="off"
              onChange={handleChange}
            />
            <br></br>
            <br></br>
          </label>
          <button type="submit" className="est-chooseOption">
            Aceptar
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

export default InformeUsoEstudiante;
