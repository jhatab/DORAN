import './App.css';
import React from 'react';
import { BrowserRouter as Router, Route, Routes } from "react-router-dom";
import Login from './Components/Login/Login';
import Main from './Components/Main/Main';
import Header from './Components/Header';
import Group from './Components/GroupPage/Group';

const App = () => {
  return(
    <div>
    <Router>
                  <Header />
      <Routes>
        <Route 
          path="/" 
          element={<Main />}  
        />
        <Route 
          path="/Login" 
          element={<Login />}
          />
        <Route
          path="/Group"
          element={<Group />}  
        />
      </Routes>
    </Router>
    </div>
  );
};

export default App;
