import React from "react";
import LogIn from "./LogIn";
import { Route, Routes, BrowserRouter } from 'react-router-dom';
import Menu from "./Menu";
import MenuAdmin from "./MenuAdmin";
import ReportAdmin from "./ReportAdmin";
import AddCubiculo from "./AddCubiculo";
import ReservarCubiculo from "./ReservarCubiculo";
import DeleteStudent from "./DeleteStudent";

const App = () => {
	return (
		<BrowserRouter>
			<Routes>
				<Route path="/" element={<LogIn />} />
				<Route path="/menu" element={<Menu />} />
				<Route path="/menu/reservarCubiculo" element={<ReservarCubiculo/>} />
				<Route path="/menuAdmin" element={<MenuAdmin />} />
				<Route path="/menuAdmin/reportAdmin" element={<ReportAdmin />} />
				<Route path="/menuAdmin/agregarCubiculo" element={<AddCubiculo/>} />
				<Route path="/menuAdmin/eliminarEstudiante" element={<DeleteStudent/>} />
			</Routes>
		</BrowserRouter>
	);
};
export default App;