import React, {useState} from "react";
import { useNavigate } from 'react-router-dom';
import TopBar from "./TopBar";
import '../menu.css';

const InfoStudent = () => {
    const [name, setName] = useState("");
    const [username, setUsername] = useState("");
    const [password, setPassword] = useState("");
    const [id, setId] = useState("");

    const navigate = useNavigate();
    const navigateInfo = useNavigate();
    
    return (
        <>
            <TopBar />
            <div id="menu-btns">
                <h1 className="page-title">Información del estudiante</h1>
                <form id="form-agregar">
                    <label>
                        Nombre: <br></br>
                        <input type="text" className="loginBoxes" name="name" value={name} 
                            defaultValue={name}
                            onChange={(e) => setName(e.target.value)}/><br></br>
                    </label>
                    <label htmlFor="username">
                        Correo electrónico: <br></br>
                        <input type="text" id="username" name="username" className="loginBoxes" value={username} 
                            defaultValue={username}
                            onChange={(e) => setUsername(e.target.value)}/>
                    </label>
                    <label htmlFor="password">
                        Contraseña: <br></br>
                        <input type="password" id="password" className="loginBoxes" value={password} 
                            defaultValue={username}
                            onChange={(e) => setPassword(e.target.value)}/><br></br>
                    </label>
                    <label>
                        Servicio especial:
                        <input type="checkbox" name="cubAccs" value={id} 
                            defaultValue={id}
                            onChange={(e) => setId(e.target.value)}/>
                        <br></br><br></br>
                    </label>
                </form>
                <button onClick={() => navigateInfo('/menuAdmin/modificarEstudiante')} className='est-chooseOption'>
                    Aceptar
                </button>
                <button onClick={() => navigate('/menuAdmin/modificarEstudiante')} className='est-chooseOption'>
                    Regresar
                </button>
            </div>
        </>
    )
}

export default InfoStudent;