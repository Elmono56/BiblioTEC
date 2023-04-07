import React from 'react';
import TopBar from './TopBar';
import '../menu.css';
const Menu = () => {
const onTap = () => {
    console.log('Sirve!');
};
return (
    <>
    <div  id = "menu-btns">
        <button onClick={onTap} className='est-chooseOption'>Reservar cubiculo</button><br></br>
        <button onClick={onTap} className='est-chooseOption'>Cancelar reserva de cubiculo</button><br></br>
        <button onClick={onTap} className='est-chooseOption'>Ver cubiculos disponibles</button><br></br>
        <button onClick={onTap} className='est-chooseOption'>Ver historial de reservas</button><br></br>
    </div>
    <TopBar/>
    </>
    );
};

export default Menu;