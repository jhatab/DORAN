<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>로그인</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="/css/login.css?after">
</head>

<body>

<div class="container">
        <div class="login_wrapper">
            <div class="login">
            <div class="login_logo">
            <img class="login_logo_img" src="/images/logo.png" />
          </div>
            <div class="login_box">
                <form id="loginForm" method="post">
                <div class="input_box"><h3>아이디</h3>
                <input id="id_input" class="id_input" type="text" name="uid" placeholder="아이디를 입력해주세요"/>
                <h3>비밀번호</h3>
      <input class="pw_input" type="password" name="password" placeholder="비밀번호를 입력해주세요"/>
                </div>

                <div class="find_btn"><span>아이디 찾기&nbsp;</span>
                <span>/&nbsp;</span>
                <span>비밀번호 찾기</span>
                </div>
                <div class="sign_btn">
                <input class="login_button" type="submit" value="로그인" onClick={handleSubmit} />
                </div>
                	</form>
                <div class="sign_up"><span>아직 계정이 없으신가요?&nbsp;</span>
                <span>&nbsp;회원 가입</span></div>
                </div>
            </div>
        </div>
        </div>


	<script>
		/* 로그인 버튼 클릭 메서드 */
		$(".login_button").click(function(){
			$("#loginForm").attr("action", "/user/login.do");
			$("#loginForm").submit();
		});
	</script>
</body>
</html>