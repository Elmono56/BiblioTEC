import React from "react";
import { useNavigate } from "react-router-dom";
import TopBar from "./TopBar";
import QRCode from "qrcode.react";
import { saveAs } from "file-saver";
import emailjs from 'emailjs-com';
import "../menu.css";

const ReservarCubiculo = () => {
  const navigate = useNavigate();

  const downloadQRCode = () => {
    const canvas = document.getElementById("qr-code");
    canvas.toBlob((blob) => {
      saveAs(blob, "qrcode.png");
    });
  };

  const generatePDF = () => {
    const { jsPDF } = require("jspdf");
    // Obtener los valores del formulario
    const numPersonas = document.getElementById("numPersonas").value;
    const fecha = document.getElementById("fecha").value;
    const hora = document.getElementById("hora").value;
    const accesible = document.getElementById("accesible").value;
  
    // Crear un nuevo documento PDF
    const doc = new jsPDF();
  
    // Agregar el título del documento
    doc.setFontSize(20);
    doc.text("Reserva de cubículo", 10, 10);
  
    // Agregar los datos del formulario al PDF
    doc.setFontSize(12);
    doc.text(`Número de personas: ${numPersonas}`, 10, 30);
    doc.text(`Fecha: ${fecha}`, 10, 40);
    doc.text(`Hora: ${hora}`, 10, 50);
    doc.text(`Accesible: ${accesible}`, 10, 60);
  
    // Guardar el documento como un archivo PDF
    doc.save("reserva-cubiculo.pdf");

    return doc;
  };

  const sendEmail = (e) => {
    e.preventDefault();
  
    // Obtener los datos del usuario y el mensaje de la base de datos
    const user = {
      name: "Kevin Cruz",
      email: "kevincruz1606@outlook.es",
      idReserva: "88921"
    };
  
    const message = "La reserva se ha realizado con éxito. Su número de reserva es:";

    // Obtener el contenido del PDF como un Blob
    const pdfBlob = generatePDF().output("blob");

    // Crear un objeto File con el Blob generado
    const pdfFile = new File([pdfBlob], "reserva.pdf", { type: "application/pdf" });

    // Crear el objeto con los datos necesarios para enviar el correo electrónico
    const data = {
      template_params: {
        idReserva: user.idReserva,
        to_name: user.name,
        to_email: user.email,
        message: message,
      },
      attachment: pdfFile,
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
  };

  return (
    <>
      <TopBar />
      <section id="rsv-cub">
        <h1 className="page-title">Reservar cubículo</h1>
        {/*Formulario que pida el número de personas que van a usar el cubículo, un input tipo date y la hora*/}
        <form id="form-reservar" onSubmit={sendEmail}>
          <label>Disponibles: </label><br></br>
          <select name="cubDisponibles">
          <option value>Selecciona un cubículo</option>
          <option value=""></option>
          </select><br></br>
          <label htmlFor="numPersonas">Número de personas</label>
          <br></br>
          <input
            type="number"
            id="numPersonas"
            name="numPersonas"
            min="3"
            max="8"
            required
            className="UIReservar"
          />
          <label htmlFor="fecha">Fecha</label>
          <br></br>
          <input
            type="date"
            id="fecha"
            name="fecha"
            required
            className="UIReservar"
          />
          <label htmlFor="hora">Hora</label>
          <br></br>
          <input
            type="time"
            id="hora"
            name="hora"
            required
            className="UIReservar"
          />
          <label htmlFor="accesible">
            Cubiculo accesible:
            <input type="checkbox" name="accesible" id="accesible"/>
            <br></br><br></br>
          </label>
        </form>

        <button
          className="est-chooseOption"
          onClick={(e) => {
            downloadQRCode();
            sendEmail(e);
            generatePDF();
          }}
        >
          Reservar
        </button>
        <button onClick={() => navigate("/menu")} className="est-chooseOption">
          Regresar
        </button>

        <div style={{ display: "none" }}>
          <QRCode value="https://www.google.com" id="qr-code" />
        </div>
      </section>
    </>
  );
};

export default ReservarCubiculo;
