import React from "react";
import LogIn from "./LogIn";
import { Route, Routes, BrowserRouter } from "react-router-dom";
import Menu from "./Menu";
import MenuAdmin from "./MenuAdmin";
import ReportAdmin from "./ReportAdmin";
import ReservarCubiculo from "./ReservarCubiculo";
import DeleteStudent from "./DeleteStudent";
import ModifyStudent from "./ModifyStudent";
import CancelarReserva from "./CancelarReserva";
import Disponibilidad from "./Disponibilidad";
import HistorialReserva from "./HistorialReserva";
import InfoStudent from "./InfoStudent";
import RegisterStudent from "./RegisterStudent";
import InformeUsoEstudiante from "./InformeEstudiante";
import GestionCubiculo from "./GestionCubiculos";
import GestionReservas from "./GestionReservas";
import ConsultarReservas from "./ConsultarReservas";
import Notificar from "./Notificar";
import ConsultarCubiculo from "./ConsultarCubiculo";

const App = () => {
  return (
    <BrowserRouter>
      <Routes>
        <Route path="/" element={<LogIn />} />
        <Route path="/registrarEstudiante" element={<RegisterStudent />} />
        <Route path="/menu" element={<Menu />} />
        <Route path="/menu/reservarCubiculo" element={<ReservarCubiculo />} />
        <Route path="/menu/cancelarReserva" element={<CancelarReserva />} />
        <Route path="/menu/verCubiculos" element={<Disponibilidad />} />
        <Route path="/menu/verHistorial" element={<HistorialReserva />} />
        <Route path="/menuAdmin" element={<MenuAdmin />} />
        <Route path="/menuAdmin/gestionCubiculos" element={<GestionCubiculo />} />
        <Route path="/menuAdmin/gestionReservas" element={<GestionReservas />} />
        <Route path="/menuAdmin/consultarCubiculo" element={<ConsultarCubiculo />} />
        <Route path="/menuAdmin/consultarReservas" element={<ConsultarReservas />} />
        <Route path="/menuAdmin/informeEstudiante" element={<InformeUsoEstudiante />} />
        <Route path="/menuAdmin/informeEstudiante/reporteAdmin" element={<ReportAdmin />} />
        <Route path="/menuAdmin/eliminarEstudiante" element={<DeleteStudent />} />
        <Route path="/menuAdmin/modificarEstudiante" element={<ModifyStudent />} />
        <Route path="/menuAdmin/modificarEstudiante/informacionEstudiante" element={<InfoStudent />} />
        <Route path="/menuAdmin/notificarEstudiante" element={<Notificar />} />
      </Routes>
    </BrowserRouter>
  );
};
export default App;
