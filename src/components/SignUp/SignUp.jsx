import './SignUp.css';
import React from 'react';
import Header from '../Header';

const SignUp = () =>{

    return (
        <div className="container">
        <div>
            <Header />
        </div>
        <div className="sign_wrapper">
            <div className="sign">
            <div className="sign_logo">
            <img className="sign_logo_img" src="images/logo.png" />
          </div>
            <div className="login_box">
                
                <div className="input_box"><h3>아이디</h3>
                <input className="input_content" type="text" name="email" placeholder="아이디를 입력해주세요"/>
                <h3>비밀번호</h3>
      <input className="input_content" type="password" name="password" placeholder="비밀번호를 입력해주세요"/>
      <h3>비밀번호 확인</h3>
      <input className="input_content" type="password_chk" name="password_chk" placeholder="비밀번호를 한번 더 입력해주세요"/>
      <h3>이름</h3>
      <input className="input_content" type="name" name="name"/>
      <h3>이메일</h3>
      <input className="input_content" type="email" name="email" placeholder="이메일을 입력해주세요"/>
      <h3>주소</h3>
      <input className="input_content" type="address" name="address"/>
      <h3>생년월일</h3>
      <input className="input_content" type="birth" name="birth"/>
                </div>
                <div className="sign_btn">
                <input className="btn_style" type="submit" value="가입하기" />
                </div>
                </div>
            </div>
        </div>
        </div>
    );
  }

  
  export default SignUp;