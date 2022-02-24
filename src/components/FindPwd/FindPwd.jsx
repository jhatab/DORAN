import './FindPwd.css';
import React from 'react';
import { Link } from "react-router-dom"

const FindPwd = () =>{

    return (
        <div className="FindPwd_wrapper">
            <div className="FindPwd">
            <div className="FindPwd_logo">
            <img className="FindPwd_logo_img" src="images/logo.png" />
          </div>
            <div className="FindPwd_box">
                
                <div className="input_box"><h3>이름</h3>
                <input className="input_content" type="name" name="name" placeholder="이름을 입력해주세요"/>
                <h3>이메일 주소</h3>
      <input className="input_content" type="email" name="email" placeholder="이메일 주소를 입력해주세요"/>
      <h3>아이디</h3>
      <input className="input_content" type="id" name="id" placeholder="아이디를 입력해주세요"/>

      <input className="btn_style" type="submit" value="비밀번호 찾기" />
                
                </div>
                
            
                </div>
            </div>
        </div>
    );
  }

  
  export default FindPwd;