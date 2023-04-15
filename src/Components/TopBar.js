import React from "react";
import LogoTec from "../img/logoTEC.svg";
import { useNavigate } from 'react-router-dom';

const TopBar = () => {
	/*const { jsPDF } = require("jspdf");
	const doc = new jsPDF();
	doc.text("Hola mundo", 10, 10);

	doc.save("prueba.pdf");*/
	// doc.text("Hola mundo", 10, 10);	
	// doc.addImage(Logo, "PNG", 10, 10, 50, 50);
	// doc.save("prueba.pdf");
	const navigate = useNavigate();
	return (
		<div id="top-bar">
			<div id="logo">
				<img src={LogoTec} alt="logo" id="logoTEC" onClick={() => navigate('/')} />
				<h1 id="appTitle">BiblioTEC</h1>
				<h2 id="appDescription">Sistema Gestor de Cubículos</h2>
			</div>

		</div>
	);
}
export default TopBar;