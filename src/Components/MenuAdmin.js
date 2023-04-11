import React, { useState } from 'react';
import { useNavigate } from 'react-router-dom';
import TopBar from './TopBar';
import '../menu.css';
const MenuAdmin = () => {
	const navigate = useNavigate();

	return (
		<>
		<TopBar />
			<div id="menu-btns">
				<h1 className='page-title'>Menu Administradores</h1><br></br>
				<button onClick={()=>navigate('./informeEstudiante')} className='est-chooseOption'>Ver informes de uso de cubículos</button><br></br>
				<button onClick={()=>navigate('./consultarCubiculo')} className = 'est-chooseOption'>Consultar Cubículo</button><br></br>
				<button onClick={()=>navigate('./agregarCubiculo')} className='est-chooseOption'>Agregar nuevos cubículos</button><br></br>
				<button onClick={()=>navigate('./modificarCubiculo')} className='est-chooseOption'>Modificar cubículos</button><br></br>
				<button onClick={()=>navigate('./eliminarCubiculo')} className='est-chooseOption'>Eliminar cubículos</button><br></br>
				<button onClick={()=>navigate('./modificarEstudiante')} className='est-chooseOption'>Modificar estudiantes</button><br></br>
				<button onClick={()=>navigate('./eliminarEstudiante')} className='est-chooseOption'>Eliminar estudiantes</button><br></br><br></br>
				<button onClick={() => navigate('../')} className='est-chooseOption'>Salir</button><br></br>
			</div>
		</>
	);
};

export default MenuAdmin;