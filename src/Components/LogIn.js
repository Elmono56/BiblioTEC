import React, { useState } from "react";
import { useNavigate } from "react-router-dom";
import TopBar from "./TopBar";
import axios from "axios";

const LogIn = () => {
  const [username, setUsername] = useState("");
  const [password, setPassword] = useState("");
  const [error, setError] = useState("");

  const handleClick = async () => {
    try {
      const response = await axios.get(
        `/api/login/${username}/${password}`
      );
      const isValid = response.data.result;
      return isValid;
    } catch (error) {
      console.error("Error al enviar la solicitud:", error);
      return false;
    }
  };

  const navigate = useNavigate();
  const map =
    "https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2364.7071527850835!2d-83.91204070884748!3d9.854381380374436!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x8fa0dff31bc32303%3A0x6fa2b81321df9631!2sBiblioteca%20Jos%C3%A9%20Figueres%20Ferrer!5e1!3m2!1ses-419!2scr!4v1680422537643!5m2!1ses-419!2scr";

  const onClickLogIn = async (event) => {
    event.preventDefault();
    const isValid = await handleClick();
    if (isValid === 1) {
      localStorage.setItem("correoITCR", username);
      navigate("/Menu");
    } else if (isValid === 2) {
      navigate("/MenuAdmin");
    } else {
      setError("Credenciales inválidas");
    }
  };

  return (
    <>
      <TopBar />
      <div id="login">
        <form onSubmit={onClickLogIn}>
          <label htmlFor="username">Usuario</label>
          <br />
          <input
            type="text"
            id="username"
            name="username"
            className="loginBoxes"
            value={username}
            autoComplete="off" 
            onChange={(e) => setUsername(e.target.value)}
          />
          <br />
          <label htmlFor="password">Contraseña</label>
          <br />
          <input
            type="password"
            id="password"
            name="password"
            className="loginBoxes"
            autoComplete="new-password" 
            value={password}
            onChange={(e) => setPassword(e.target.value)}
          />
          <br />
          <input type="submit" value="Iniciar sesión" id="login-btn" />
          {error && <p>{error}</p>}
          <input
            type="button"
            value="Registrarse"
            id="login-btn"
            onClick={() => navigate("./registrarEstudiante")}
            style={{ marginLeft: 80, width: 135 }}
          />
        </form>
      </div>
      <div id="map">
        <iframe
          src={map}
          loading="lazy"
          allowFullScreen=""
          referrerPolicy="no-referrer-when-downgrade"
          id="map"
          title="Mapa Biblioteca José Figueres Ferrer"
        ></iframe>
      </div>
    </>
  );
};

export default LogIn;
