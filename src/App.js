import logo from './logo.svg';
import './App.css';

function App() {
  return (
    <div className="container">
      <div className="header">
        <div className="header_bar">
          <div className="logo">
            <a href="#"><img className="logo_img" src="images/logo.png" /></a>
          </div>
          <div className="search_bar">
            <img className="search_icon" src="images/search.png"/>
              <input className="search_box" type="text" placeholder="Keyword Search" />
          </div>
          <div className="menu">
            <ul className="menu_btn">
              <li ><img className="alarm_btn" src="images/bell.png" /></li>
              <a href="#"><li className="login_btn">로그인</li></a>
            </ul>
          </div>
        </div>
    </div>
    </div>
  );
}

export default App;
