import './Login.css';
import React from 'react';
import Header from '../Header';
import { Link } from "react-router-dom"

const Login = () =>{

    return (
        <div className="container">
        <div className="login_wrapper">
            <div className="login">
            <div className="login_logo">
            <img className="login_logo_img" src="images/logo.png" />
          </div>
            <div className="login_box">
                
                <div className="input_box"><h3>아이디</h3>
                <input className="input_content" type="text" name="email" placeholder="아이디를 입력해주세요"/>
                <h3>비밀번호</h3>
      <input className="input_content" type="password" name="password" placeholder="비밀번호를 입력해주세요"/>
                
                </div>
                
                
                <div className="find_btn"><span><a href="#">아이디 찾기&nbsp;</a></span>
                <span>/&nbsp;</span>
                <span><a href="#">비밀번호 찾기</a></span></div>
                <div className="sign_btn">
                <input className="btn_style" type="submit" value="로그인" />
                </div>
                <div className="sign_up"><span>아직 계정이 없으신가요?&nbsp;</span>
                <Link to="/SignUp"><span>&nbsp;회원 가입</span></Link></div>
                </div>
            </div>
        </div>
        </div>
    );
  }

  
  export default Login;