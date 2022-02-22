import './App.css';
import React from 'react';
import { BrowserRouter as Router, Route, Routes } from "react-router-dom";
import Login from './components/Login/Login';
import Main from './components/Main/Main';
import Header from './components/Header';
import Group from './components/GroupPage/Group';
import SignUp from './components/SignUp/SignUp';
import MainHeader from 'components/Main/MainHeader';
import Footer from 'components/Footer';

const App = () => {
  return(
    <div>
    <Router>
                  <MainHeader />
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
          path="/SignUp" 
          element={<SignUp />}
          />
        <Route
          path="/Group"
          element={<Group />}  
        />
      </Routes>

      <Footer />
    </Router>
    </div>
  );
};

export default App;
