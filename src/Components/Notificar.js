import React, { useState } from "react";
import { useNavigate } from 'react-router-dom';
import TopBar from "./TopBar";
import '../menu.css';
import emailjs from 'emailjs-com';

const Notificar = () => {
    {/*crea un formulario que solicite correo, mensaje y botones de enviar y regresar*/ }
    const navigate = useNavigate();

    const sendEmail = (e) => {
        e.preventDefault();
        // Obtener los datos del usuario y el mensaje de la base de datos
        const user = {
            name: "Kevin Cruz",
            email: "kevincruz1606@outlook.es",
            idReserva: "88921"
        };
        const correo = document.getElementById('correo').value;
        const mensaje = document.getElementById('message').value;
        // const message = "Su reserva ha sido modificada por el administrador. Comuniquese con la biblioteca para más información.";

        // Crear el objeto con los datos necesarios para enviar el correo electrónico
        const data = {
            template_params: {
                idReserva: user.idReserva,
                to_name: user.name,
                to_email: correo,
                message: mensaje,
            },
        };

        // Enviar el correo electrónico utilizando la librería emailjs-com
        emailjs.send('service_ai4lqh7', 'template_af15w8r', data.template_params, 'Z2jaXVlQMZZMeMFfl').then(
            function (response) {
                console.log("Correo electrónico enviado con éxito:", response);
            },
            function (error) {
                console.error("Error al enviar el correo electrónico:", error);
            }
        );
        navigate("/menu");
    };

    return (
        <>
            <TopBar />
            <div id="menu-btns">
                <h1 className="page-title">Notificar estudiantes</h1>
                <form id="form-eliminar">
                    <label>
                        Correo electrónico<br></br>
                        <input type="text" name="correo" id="correo" autoComplete="off" /><br></br><br></br>
                    </label>
                    <label>
                        Mensaje<br></br>
                        <input type="text" name="message" id="message" autoComplete="off" /><br></br><br></br><br></br>
                    </label>
                </form>
                <button onClick={(e) => {
                    sendEmail(e);
                }} className='est-chooseOption'>
                    Enviar
                </button>
                <button onClick={() => navigate('/menuAdmin')} className='est-chooseOption'>
                    Regresar
                </button>
            </div>
        </>
    )
}

export default Notificar;