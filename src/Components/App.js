import React from "react";
import LogIn from "./LogIn";
import { Route, Routes, BrowserRouter } from 'react-router-dom';
import Menu from "./Menu";
import MenuAdmin from "./MenuAdmin";
import ReportAdmin from "./ReportAdmin";

const App = () => {
	return (
		<BrowserRouter>
			<Routes>
				<Route path="/" element={<LogIn />} />
				<Route path="/menu" element={<Menu />} />
				<Route path="/menuAdmin" element={<MenuAdmin />} />
				<Route path="/menuAdmin/reportAdmin" element={<ReportAdmin />} />
			</Routes>
		</BrowserRouter>

	);
};
export default App;