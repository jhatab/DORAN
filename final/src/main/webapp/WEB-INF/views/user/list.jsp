<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
request.setCharacterEncoding("UTF-8");
%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 목록</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
	<!-- 검색 form -->
	<form role="form" method="get">
		<table style="text-align: center;">
			<tr>
				<th>회원 아이디</a></th>
				<th>회원 암호</th>
				<th>회원 성명</th>
				<th>회원 생년월일</th>
				<th>회원 성별</th>
				<th>회원 별명</th>
				<th>회원 이메일</th>
				<th>회원 주소</th>
			</tr>

			<c:forEach items="${userList}" var="userList">
				<tr>
					<td><a href="${contextPath}/user/view?uid=${userList.uid}">${userList.uid}</a></td>
					<td>${userList.upass}</td>
					<td>${userList.name}</td>
					<td>${userList.birthDate}</td>
					<td>${userList.gender}</td>
					<td>${userList.nickname}</td>
					<td>${userList.email}</td>
					<td>${userList.address}</td>
				</tr>
			</c:forEach>
		</table>
	</form>

</body>
</html>