import React, {useEffect} from 'react';
import TopBar from './TopBar';
import '../menu.css';
const Menu = () => {
const onTap = () => {
    console.log('Sirve!');
};
return (
    <>
    <div  id = "menu-btns">
        <h1 className='page-title'>Menu Estudiantes</h1><br></br>
        <button onClick={onTap} className='est-chooseOption'>Reservar cubiculo</button><br></br>
        <button onClick={onTap} className='est-chooseOption'>Cancelar reserva de cubiculo</button><br></br>
        <button onClick={onTap} className='est-chooseOption'>Ver cubiculos disponibles</button><br></br>
        <button onClick={onTap} className='est-chooseOption'>Ver historial de reservas</button><br></br><br></br>
        <button onClick={onTap} className='est-chooseOption'>Regresar</button><br></br>
    </div>
    <TopBar/>
    </>
    );
};

export default Menu;