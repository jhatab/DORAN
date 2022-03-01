<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>로그인</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>

<body>

	<form id="loginForm" method="post">
		<input type="text" class="id_input" name="uid" placeholder="아이디">
		<input type="password" class="pw_input" name="upass" placeholder="비밀번호">
		<input type="button" class="login_button" value="로그인">
	</form>

	<script>
		/* 로그인 버튼 클릭 메서드 */
		$(".login_button").click(function(){
			$("#loginForm").attr("action", "/user/login.do");
			$("#loginForm").submit();
		});
	</script>
</body>
</html>