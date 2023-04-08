import React from 'react';
import { useNavigate } from 'react-router-dom';
import TopBar from './TopBar';
import '../menu.css';
const Menu = () => {
	const navigate = useNavigate();
	const navigateReservar = useNavigate();
	const navigateCancelar = useNavigate();
	const navigateVerCubiculos = useNavigate();
	const navigateVerHistorial = useNavigate();

	return (
		<>
			<div id="menu-btns">
				<h1 className='page-title'>Menu Estudiantes</h1><br></br>
				<button onClick={() => navigateReservar('/menu/reservarCubiculo')} className='est-chooseOption'>Reservar cubiculo</button><br></br>
				<button onClick={() => navigateCancelar('/menu/cancelarReserva')} className='est-chooseOption'>Cancelar reserva de cubiculo</button><br></br>
				<button onClick={() => navigateVerCubiculos('')} className='est-chooseOption'>Ver cubiculos disponibles</button><br></br>
				<button onClick={() => navigateVerHistorial('')} className='est-chooseOption'>Ver historial de reservas</button><br></br><br></br>
				<button onClick={() => navigate('../')} className='est-chooseOption'>Salir</button><br></br>
			</div>
			<TopBar />
		</>
	);
};

export default Menu;