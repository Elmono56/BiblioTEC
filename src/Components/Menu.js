import React from 'react'
import { useNavigate } from 'react-router-dom'
import TopBar from './TopBar'
import '../menu.css'
const Menu = () => {
  const navigate = useNavigate()
  const navigateReservar = useNavigate()
  const navigateCancelar = useNavigate()
  const navigateVerCubiculos = useNavigate()
  const navigateVerHistorial = useNavigate()

  return (
    <div>
      <TopBar />
      <div className='buttons-and-text-container'>
        <h1 className='page-title'>
          Menu Estudiantes
        </h1>

        <div id='menu-btns'>
          <button
            onClick={() => navigateReservar('/menu/reservarCubiculo')}
            className='est-chooseOption'
          >
            Filtrar cubículo
          </button>
          <button
            onClick={() => navigateCancelar('/menu/cancelarReserva')}
            className='est-chooseOption'
          >
            Cancelar reserva de cubículo
          </button>
          <button
            onClick={() => navigateVerCubiculos('/menu/verCubiculos')}
            className='est-chooseOption'
          >
            Ver cubículos disponibles
          </button>
          <button
            onClick={() => navigateVerHistorial('/menu/verHistorial')}
            className='est-chooseOption'
          >
            Ver historial de reservas
          </button>
          <button
            onClick={() => navigate('../')}
            className='est-chooseOption'
          >
            Salir
          </button>
        </div>
      </div>

    </div>
  )
}

export default Menu
