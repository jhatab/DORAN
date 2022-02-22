import './Header.css';
import React from 'react';
import { Link } from "react-router-dom"


const Header = () => {
  return (
      <div className="header_box">
        <div className="header_bar">
          <div className="logo">
            <Link to="/"><img className="logo_img" src="images/logo.png" /></Link>
          </div>
          <div className="search_bar">
            <img className="search_icon" src="images/search.png"/>
              <input className="search_box" type="text" placeholder="Keyword Search" />
          </div>
          <div className="menu">
            <ul className="menu_btn">
              <li ><img className="alarm_btn" src="images/bell.png" /></li>
              <Link to="/Login"><li className="login_btn">로그인</li></Link>
            </ul>
          </div>
        </div>
    </div>
  );
}

export default Header;
