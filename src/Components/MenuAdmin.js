import React from 'react';
import TopBar from './TopBar';
import '../menu.css';
const Menu = () => {
const onTap = () => {
    console.log('Admin!');
};
return (
    <>
    <div  id = "menu-btns">
        <h1 className='page-title'>Menu Administradores</h1><br></br>
        <button onClick={onTap} className='est-chooseOption'>Ver informes de uso de cubiculos</button><br></br>
        <button onClick={onTap} className='est-chooseOption'>Agregar nuevos cubiculos</button><br></br>
        <button onClick={onTap} className='est-chooseOption'>Eliminar cubiculos</button><br></br>
        <button onClick={onTap} className='est-chooseOption'>Modificar estudiantes</button><br></br>
        <button onClick={onTap} className='est-chooseOption'>Eliminar estudiantes</button><br></br><br></br>
        <button onClick={onTap} className='est-chooseOption'>Regresar</button><br></br>
    </div>
    <TopBar/>
    </>
    );
};

export default Menu;