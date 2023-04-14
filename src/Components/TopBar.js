import React from "react";
import LogoTec from "../img/logoTEC.svg";
import { useNavigate } from 'react-router-dom';

const TopBar = () => {
	/*const { jsPDF } = require("jspdf");
	const doc = new jsPDF();
	doc.text("Hola mundo", 10, 10);

<<<<<<< HEAD
	doc.save("prueba.pdf");*/
=======
	//doc.save("prueba.pdf");
>>>>>>> 3a2fee1f9eabafb7057824e8460c5c046bdc04c6
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