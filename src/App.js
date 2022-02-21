import './App.css';
import React from 'react';
import { BrowserRouter as Router, Route, Routes } from "react-router-dom";
import Login from './components/Login/Login';
import Main from './components/Main/Main';

const App = () => {
  return(
    <div>
      <Routes>
      <Route path="/" element={<Main />}/>
      <Route path="/Login" element={<Login />}/>
      </Routes>
    </div>
  );
};

export default App;
