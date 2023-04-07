import React from 'react';
import { useNavigate } from 'react-router-dom';
import TopBar from './TopBar';
import '../menu.css';
const Menu = () => {
	const navigate = useNavigate();
	const onTap = () => {
		console.log('Sirve!');
	};
	return (
		<>
			<div id="menu-btns">
				<h1 className='page-title'>Menu Estudiantes</h1><br></br>
				<button onClick={() => navigate('/menuAdmin/agregarCubiculo')} className='est-chooseOption'>Reservar cubiculo</button><br></br>
				<button onClick={onTap} className='est-chooseOption'>Cancelar reserva de cubiculo</button><br></br>
				<button onClick={onTap} className='est-chooseOption'>Ver cubiculos disponibles</button><br></br>
				<button onClick={onTap} className='est-chooseOption'>Ver historial de reservas</button><br></br><br></br>
				<button onClick={() => navigate('../')} className='est-chooseOption'>Salir</button><br></br>
			</div>
			<TopBar />
		</>
	);
};

export default Menu;