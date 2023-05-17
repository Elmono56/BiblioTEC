import React, { useState, useEffect } from 'react';
import { useNavigate } from 'react-router-dom';
import axios from 'axios';
import TopBar from './TopBar';
import '../menu.css';

const ReportAdmin = () => {
  const navigate = useNavigate();
  const [users, setUsers] = useState([]);
  const carnet = localStorage.getItem('carnet');

  useEffect(() => {
    async function fetchUsers() {
      try {
        const response = await axios.get(`/api/reservasEstudiante/${carnet}`);
        setUsers(response.data);
      } catch (error) {
        console.error('Error fetching users:', error);
      }
    }
    fetchUsers();
  }, []);

  return (
    <>
      <h1 className="page-title" style={{ marginLeft: 480 }}>
        Informe de uso del cubículo
      </h1>
      <div id="menu-btns">
        <div id="report-content">
          <table id="table">
            <thead>
              <tr>
                <th>Número cubículo</th>
                <th>Número de reserva</th>
                <th>Fecha</th>
                <th>Hora de inicio</th>
                <th>Hora de final</th>
              </tr>
            </thead>
            <tbody>
              {users.map((user) => (
                <tr key={user.carnet}>
                  <td>{user.idCubiculo}</td>
                  <td>{user.idReserva}</td>
                  <td>{user.fechaReserv}</td>
                  <td>{user.horaInicio}</td>
                  <td>{user.horaFinal}</td>
                </tr>
              ))}
            </tbody>
          </table>
        </div>
        <br></br>
        <button onClick={() => navigate('/menuAdmin/informeEstudiante')} className="est-chooseOption">
          Regresar
        </button>
      </div>
      <TopBar />
    </>
  );
};

export default ReportAdmin;
