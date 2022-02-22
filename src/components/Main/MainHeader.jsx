import './MainHeader.css';
import React, {useState, useEffect} from 'react';
import { Link } from "react-router-dom"
import Subnav from './Subnav';


const MainHeader = () => {

  // 지혜 작성 코드
  const para = document.location.href.split("/").reverse()[0];
  console.log("para: " + para);


    const [scrollPosition, setScrollPosition] = useState(0);
    const updateScroll = () => {
        setScrollPosition(window.scrollY || document.documentElement.scrollTop);
    }
    useEffect(()=>{
        window.addEventListener('scroll', updateScroll);
    });
  return (
      <div className={scrollPosition < 1 && para == "" ? "original_header" : "change_header"}>
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

        { para =="" && scrollPosition < 1 ? <Subnav />: ""}

    </div>
  );
}

export default MainHeader;
