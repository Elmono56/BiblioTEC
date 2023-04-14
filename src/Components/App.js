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
        <Route path="/menuAdmin/informeEstudiante" element={<InformeUsoEstudiante />} />
        <Route path="/menuAdmin/informeEstudiante/reporteAdmin" element={<ReportAdmin />} />
        <Route path="/menuAdmin/eliminarEstudiante" element={<DeleteStudent />} />
        <Route path="/menuAdmin/modificarEstudiante" element={<ModifyStudent />} />
        <Route path="/menuAdmin/modificarEstudiante/informacionEstudiante" element={<InfoStudent />} />
      </Routes>
    </BrowserRouter>
  );
};
export default App;
