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
				<button onClick={() => navigateReservar('/menu/reservarCubiculo')} className='est-chooseOption'>Filtrar cubículo</button><br></br>
				<button onClick={() => navigateCancelar('/menu/cancelarReserva')} className='est-chooseOption'>Cancelar reserva de cubículo</button><br></br>
				<button onClick={() => navigateVerCubiculos('/menu/verCubiculos')} className='est-chooseOption'>Ver cubículos disponibles</button><br></br>
				<button onClick={() => navigateVerHistorial('/menu/verHistorial')} className='est-chooseOption'>Ver historial de reservas</button><br></br><br></br>
				<button onClick={() => navigate('../')} className='est-chooseOption'>Salir</button><br></br>
			</div>
			<TopBar />
		</>
	);
};

export default Menu;