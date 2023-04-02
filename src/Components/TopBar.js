import React from "react";
import LogoTec from "../img/logoTEC.png";
const TopBar = () => {
  return (
    <div id="top-bar">
      <div id="logo">
        <img src={LogoTec} alt="logo" id="logoTEC"/>
        <h1 id="appTitle">BiblioTEC</h1>
        <h2 id="appDescription">Sistema Gestor de Cubículos</h2>
      </div>
    </div>
  );
}
export default TopBar;