import './Login.css';
import React from 'react';

const Login = () =>{

    return (
        <div className="container">
            <div className="login">
            <div className="logo"></div>
            <div className="login_box">
                <h2>아이디</h2>
                <div className="id_box">
                </div>
                <h2>비밀번호</h2>
                <div className="password_box"></div>
                <div className="find_btn"><p>아이디 찾기</p>
                <p>/</p>
                <p>비밀번호 찾기</p></div>
                <div className="login_btn"></div>
                <div className="sign_up"><p>아직 계정이 없으신가요?</p>
                <p>회원 가입</p></div>
                </div>
            </div>
        </div>
    );
  }

  
  export default Login;