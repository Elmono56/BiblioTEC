import React from "react";
import LogoTec from "../img/logoTEC.png";
import { useNavigate } from 'react-router-dom';
const TopBar = () => {
	const navigate = useNavigate();
	return (
		<div id="top-bar">
			<div id="logo">
				<img src={LogoTec} alt="logo" id="logoTEC" onClick={() => navigate('/')}/>
				<h1 id="appTitle">BiblioTEC</h1>
				<h2 id="appDescription">Sistema Gestor de Cubículos</h2>
			</div>
		</div>
	);
}
export default TopBar;