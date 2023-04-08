import React from 'react';
import { useNavigate } from 'react-router-dom';
import TopBar from './TopBar';
import '../menu.css';

const ReportAdmin = () => {
	const navigate = useNavigate();
	return (
		<>
			<h1 className="page-title" style={{marginLeft: 400}}>Informe de uso del cubículo</h1>
			<div id="menu-btns">

				{/*<div id="report-content">
					{/* Agrega aquí el contenido del informe 
				</div>*/}
				<button onClick={() => navigate('/menuAdmin')} className='est-chooseOption'>
					Regresar
				</button>
			</div>
			<TopBar />
		</>
	);
};

export default ReportAdmin;