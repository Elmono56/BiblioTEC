import React from "react";
const LogIn = (children) => {
const map = "https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2364.7071527850835!2d-83.91204070884748!3d9.854381380374436!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x8fa0dff31bc32303%3A0x6fa2b81321df9631!2sBiblioteca%20Jos%C3%A9%20Figueres%20Ferrer!5e1!3m2!1ses-419!2scr!4v1680422537643!5m2!1ses-419!2scr";
  return (
    //Create a horizontal line div to the top of the window adding css efects
    <><div id="login">
    <form>
        <label for='username'>Usuario </label><br></br>
        <input type="text" id="username" name="username" /><br></br>
        <label for='password'>Contraseña </label><br></br>
        <input type="password" id="password" name="password" /><br></br>
        <input type="submit" value="Iniciar sesión" id="login-btn"/>
    </form>
    </div>
    <div id = "map">
    <iframe src={map} loading="lazy" allowFullScreen="" referrerpolicy="no-referrer-when-downgrade" id="map" title="Mapa Biblioteca José Figueres Ferrer"></iframe>
    </div></>
  );
};
export default LogIn;