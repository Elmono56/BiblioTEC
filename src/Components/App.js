import React from "react";
import LogIn from "./LogIn";
import { Route, Routes } from 'react-router-dom';
import { BrowserRouter } from "react-router-dom";
import Menu from "./Menu";
import MenuAdmin from "./MenuAdmin";
import ReportAdmin from "./ReportAdmin";
import AddCubiculo from "./AddCubiculo";

const App = () => {
	return (
		<BrowserRouter>
			<Routes>
				<Route path="/" element={<LogIn />} />
				<Route path="/menu" element={<Menu />} />
				<Route path="/menuAdmin" element={<MenuAdmin />} />
				<Route path="/menuAdmin/reportAdmin" element={<ReportAdmin />} />
				<Route path="/menuAdmin/agregarCubiculo" element={<AddCubiculo/>} />
			</Routes>
		</BrowserRouter>

	);
};
export default App;