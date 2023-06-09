import React from 'react'
import LogoTec from '../img/logoTEC.png'
import { useNavigate } from 'react-router-dom'

const TopBar = () => {
  /* const { jsPDF } = require("jspdf");
	const doc = new jsPDF();
	doc.text("Hola mundo", 10, 10);

	doc.save("prueba.pdf"); */
  // doc.text("Hola mundo", 10, 10);
  // doc.addImage(Logo, "PNG", 10, 10, 50, 50);
  // doc.save("prueba.pdf");
  const navigate = useNavigate()
  return (
    <div id='top-bar'>
      <div className='top-bar-top-container' />
      <div className='top-bar-bottom-container'>
        <img src={LogoTec} alt='logo' id='logoTEC' onClick={() => navigate('/')} />
        <div className='text-container'>
          <h1 id='appTitle'>BiblioTEC</h1>
          <h2 id='appDescription'>Sistema Gestor de Cubículos</h2>
        </div>

      </div>

    </div>
  )
}
export default TopBar
