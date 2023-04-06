import React from "react";
import TopBar from "./TopBar";
import LogIn from "./LogIn";
const onClickLogIn = () => {
    console.log("LogIn");
}
const App = () => {
    return (
        <>
        <TopBar /><LogIn />
        </>
    );
};
export default App;