<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<header>
		<c:if test="${member == null}">
			<div class="login_button">
				<a href="/user/login">로그인</a>
			</div>
		</c:if>
		<c:if test="${member != null}">
			<div class="login_button">
				<span>${member.nickname}</span> <a href="/user/update.do">정보수정</a> <a href="/user/logout.do">로그아웃</a>
			</div>
		</c:if>
	</header>

	<hr>

	<h1>메인 페이지</h1>

	<hr>
</body>
</html>