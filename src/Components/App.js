import React from "react";
import LogIn from "./LogIn";
import { Route, Routes, Navigate } from 'react-router-dom';
import { BrowserRouter } from "react-router-dom";
import TopBar from "./TopBar";
import Menu from "./Menu";
import MenuAdmin from "./MenuAdmin";

const App = () => {
    return (
        <BrowserRouter>
        <Routes>
          <Route path="/" element={<LogIn />} />
          <Route path="/menu" element={<Menu />} />
          <Route path="/menuAdmin" element={<MenuAdmin />} />
        </Routes>
      </BrowserRouter>
        
    );
};
export default App;