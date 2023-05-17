import React, { useState } from "react";
import { useNavigate } from "react-router-dom";
import axios from "axios";
import TopBar from "./TopBar";
import "../menu.css";

const DeleteStudent = () => {
  const navigate = useNavigate();
  const [studentId, setStudentId] = useState("");

  const handleIdChange = (event) => {
    setStudentId(event.target.value);
  };
  const handleDelete = async (event) => {
    event.preventDefault();
    try {
      const parsedStudentId = parseInt(studentId);

      const response = await axios.get(
        `/api/eliminar/${parsedStudentId}`
      );
      const resultado = response.data.result;

      if (resultado === 1) {
        alert("Estudiante eliminado");
      } else {
        alert("El estudiante no existe");
      }
    } catch (error) {
      console.log("Error");
    }
  };

  return (
    <>
      <TopBar />
      <div id="menu-btns">
        <h1 className="page-title">Eliminar Estudiante</h1>
        <form id="del-estudiante">
          <label>
            Numero de carnet:<br></br>
            <br></br>
            <input
              type="text"
              name="name"
              value={studentId}
              onChange={handleIdChange}
            />
            <br></br>
            <br></br>
          </label>
        </form>
        <button className="est-chooseOption" onClick={handleDelete}>
          Eliminar
        </button>
        <button
          className="est-chooseOption"
          onClick={() => navigate("/menuAdmin")}
        >
          Regresar
        </button>
      </div>
    </>
  );
};

export default DeleteStudent;
