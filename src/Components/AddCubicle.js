import React from 'react';
import { useNavigate } from 'react-router-dom';
import TopBar from './TopBar';
import '../menu.css';

const AddCubicle = () => {
	const navigate = useNavigate();
    const onTap = () => {
        console.log('Se agrega!');
    };
	return (
		<>
			<div id="menu-btns">
				<h1 className="page-title">Agregar Cubículo</h1><br><br></br></br>
				{/*<div id="report-content">
					{/* Agrega aquí el contenido del cubiculo
				</div>*/}
                <button onClick={onTap} className='est-chooseOption'>
                    Agregar
                </button>
				<button onClick={() => navigate('../')} className='est-chooseOption'>
					Regresar
				</button>
			</div>
			<TopBar />
		</>
	);
};

export default AddCubicle;