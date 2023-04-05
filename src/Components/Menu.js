import React from 'react';

const Menu = () => {
const onTap = () => {
    console.log('Sirve!');
};
return (
    <div style={styles.container}>
        <button onClick={onTap}>Reservar cubiculo</button><br></br>
        <button onClick={onTap}>Cancelar reserva de cubiculo</button><br></br>
        <button onClick={onTap}>Ver cubiculos disponibles</button><br></br>
        <button onClick={onTap}>Ver historial de reservas</button><br></br>
    </div>
    );
};

const styles = {
container: {
    display: 'flex',
    justifyContent: 'center',
    margin: '0 auto',
    height: '100px',
    width: '500px',
    maxWidth: '400px',
    }
};

export default Menu;