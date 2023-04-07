import React from "react";
import LogIn from "./LogIn";
import { Route, Routes, Navigate } from 'react-router-dom';
import { BrowserRouter } from "react-router-dom";
import TopBar from "./TopBar";
import Menu from "./Menu";

const App = () => {
    return (
        <BrowserRouter>
        <Routes>
          <Route path="/" element={<LogIn />} />
          <Route path="/menu" element={<Menu />} />
        </Routes>
      </BrowserRouter>
        
    );
};
export default App;