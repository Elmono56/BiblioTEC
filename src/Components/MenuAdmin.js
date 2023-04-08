import React, { useState } from 'react';
import { useNavigate } from 'react-router-dom';
import TopBar from './TopBar';
import '../menu.css';
const MenuAdmin = () => {
	const navigate = useNavigate();
	const navigateToStats = useNavigate();
	const navigateToAdd = useNavigate();
	const navigateToDelete = useNavigate();
	const navigateToDeleteCubic = useNavigate();
	const navigateToModify = useNavigate();

	return (
		<>
		<TopBar />
			<div id="menu-btns">
				<h1 className='page-title'>Menu Administradores</h1><br></br>
				<button onClick={()=>navigateToStats('./reportAdmin')} className='est-chooseOption'>Ver informes de uso de cubiculos</button><br></br>
				<button onClick={()=>navigateToAdd('./agregarCubiculo')} className='est-chooseOption'>Agregar nuevos cubiculos</button><br></br>
				<button onClick={()=>navigateToDeleteCubic('./eliminarCubiculo')} className='est-chooseOption'>Eliminar cubiculos</button><br></br>
				<button onClick={()=>navigateToModify('./modificarEstudiante')} className='est-chooseOption'>Modificar estudiantes</button><br></br>
				<button onClick={()=>navigateToDelete('./eliminarEstudiante')} className='est-chooseOption'>Eliminar estudiantes</button><br></br><br></br>
				<button onClick={() => navigate('../')} className='est-chooseOption'>Salir</button><br></br>
			</div>
		</>
	);
};

export default MenuAdmin;