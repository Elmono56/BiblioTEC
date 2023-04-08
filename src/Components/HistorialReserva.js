import React from "react";
import { useNavigate } from 'react-router-dom';
import TopBar from "./TopBar";
import '../menu.css';

const HistorialReserva = () => {
    const navigate = useNavigate();
    return (
        <>
            <TopBar />
        </>
    )
}
export default HistorialReserva;