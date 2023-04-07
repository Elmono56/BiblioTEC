import React from "react";
const LoginButton = () => {
    const onClickLogIn = (event) => {
        alert("Botón");
    };
    return (
        <button id="login-btn" onClick={onClickLogIn}>
            Iniciar Sesión
        </button>
    );
}
export default LoginButton;