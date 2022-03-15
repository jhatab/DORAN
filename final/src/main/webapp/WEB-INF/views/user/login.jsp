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
			<!-- 상단 로고 -->
			<div class="login_logo">
				<img class="login_logo_img" src="/images/logo.png" />
			</div>
			<!-- 로그인 폼 -->
			<div class="login_box">
				<form id="loginForm" method="post" action="/user/login.do">
					<div class="input_box">
						<h3>아이디</h3>
						<input type="text" class="id_input" name="uid" placeholder="아이디를 입력해주세요">
						<h3>비밀번호</h3>
						<input type="password" class="pw_input" name="upass" placeholder="비밀번호를 입력해주세요">
					</div>

					<div class="find_btn">
						<a href="#">아이디 찾기&nbsp;</a>
						<span>/&nbsp;</span>
						<a href="#">비밀번호 찾기</a>
					</div>

					<div class="sign_btn">
						<input type="submit" class="login_button" value="로그인">
					</div>
				</form>
				<!-- 회원가입 -->
				<div class="sign_up">
					<a href="${contextPath}/user/join">아직 계정이 없으신가요?&nbsp;</a>
					<a href="${contextPath}/user/join">&nbsp;회원가입</a>
				</div>
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