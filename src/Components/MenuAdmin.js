import React, { useState } from 'react';
import { useNavigate } from 'react-router-dom';
import TopBar from './TopBar';
import '../menu.css';
const MenuAdmin = () => {
	const [onClick, setOnClick] = useState(false);
	const navigate = useNavigate();
	const onTap = () => {
		console.log('Admin!');
	};
	const onClickReport = (event) => {
		event.preventDefault();
		setOnClick(true);
	};
	if (onClick) {
		return navigate('/menuAdmin/reportAdmin');
	}
	return (
		<>
			<div id="menu-btns">
				<h1 className='page-title'>Menu Administradores</h1><br></br>
				<button onClick={onClickReport} className='est-chooseOption'>Ver informes de uso de cubiculos</button><br></br>
				<button onClick={onTap} className='est-chooseOption'>Agregar nuevos cubiculos</button><br></br>
				<button onClick={onTap} className='est-chooseOption'>Eliminar cubiculos</button><br></br>
				<button onClick={onTap} className='est-chooseOption'>Modificar estudiantes</button><br></br>
				<button onClick={onTap} className='est-chooseOption'>Eliminar estudiantes</button><br></br><br></br>
				<button onClick={() => navigate('../')} className='est-chooseOption'>Salir</button><br></br>
			</div>
			<TopBar />
		</>
	);
};

export default MenuAdmin;