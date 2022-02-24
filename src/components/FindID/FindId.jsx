import './FindId.css';
import React from 'react';
import Header from '../Header';
import { Link } from "react-router-dom"

const FindID = () =>{

    return (
        <div className="FindID_wrapper">
            <div className="FindID">
            <div className="FindID_logo">
            <img className="FindID_logo_img" src="images/logo.png" />
          </div>
            <div className="FindID_box">
                
                <div className="input_box"><h3>이름</h3>
                <input className="input_content" type="name" name="name" placeholder="이름을 입력해주세요"/>
                <h3>이메일 주소</h3>
      <input className="input_content" type="email" name="email" placeholder="이메일 주소를 입력해주세요"/>

      <input className="btn_style" type="submit" value="아이디 찾기" />
                
                </div>
                
            
                </div>
            </div>
        </div>
    );
  }

  
  export default FindID;