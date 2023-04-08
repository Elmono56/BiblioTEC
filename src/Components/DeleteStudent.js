import React from 'react';
import { useNavigate } from 'react-router-dom';
import TopBar from './TopBar';
import '../menu.css';

const DeleteStudent = () => {
    const navigate = useNavigate();

    const handleDelete = (event) => {
        event.preventDefault();
        console.log('Eliminar estudiante!');
    };

    return (
        <>
            <TopBar />
            <div id="menu-btns">
                <h1 className="page-title">Eliminar Estudiante</h1>
                <form id="del-estudiante">
                    <label>
                        Numero de carnet:<br></br><br></br>
                        <input type="text" name="name"/><br></br><br></br>
                    </label>
                    <label>
                        Motivo de eliminación:<br></br><br></br>
                        <input type="text" name="name" /><br></br><br></br>
                    </label>
                </form>
                <button className='est-chooseOption' onClick={handleDelete}>
                    Eliminar
                </button>
                <button className='est-chooseOption' onClick={() => navigate('/menuAdmin')}>
                    Regresar
                </button>
            </div>
        </>
    );
};

export default DeleteStudent;
