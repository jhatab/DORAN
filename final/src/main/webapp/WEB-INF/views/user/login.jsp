<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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

<!-- script -->
<script>

	$(document).ready(function() {
		
		/* ALERT */
		const result = '<c:out value="${result}"/>';
		
		if (result === "login fail") {
			alert("아이디 혹은 비밀번호가 잘못되었습니다.");
		}
		
	});
	
	const uid = document.querySelector(".id_input");
	const upass = document.querySelector(".pw_input");
	const loginButton = document.querySelector(".login_button");
	
	/* 로그인 유효성 검사 */
	function loginFunc(e) {
		e.preventDefault();

		if (uid.value == 'undefined' || uid.value == '') {
			alert('아이디를 입력해주세요.');
			uid.focus();
			return false;
		}

		if (upass.value == 'undefined' || upass.value == '') {
			alert('비밀번호를 입력해주세요.');
			upass.focus();
			return false;
		}
		
		$("#loginForm").attr("action", "/user/login.do");
        $("#loginForm").submit();
	}
	loginButton.addEventListener("click", loginFunc);
	
</script>
