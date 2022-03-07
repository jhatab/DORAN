<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<%
request.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 수정창</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
<style>
.text_center {
	text-align: center;
}
</style>
</head>
<body>
	<table>
		<tr>
			<td><label for="text">회원 아이디</label></td>
			<td><input type="text" id="uid" name="uid" readonly="readonly" value="${member.uid}"></td>
		</tr>
		<tr>
			<td><label for="upass">회원 암호</label></td>
			<td><input type="text" id="upass" name="upass" readonly="readonly" value="${member.upass}"></td>
		</tr>
		<tr>
			<td><label for="name">회원 이름</label></td>
			<td><input type="text" id="name" name="name" readonly="readonly" value="${member.name}"></td>
		</tr>
		<tr>
			<td><label for="birthDate">회원 생년월일</label></td>
			<td><input type="date" id="birthDate" name="birthDate" readonly="readonly" value="${member.birthDate}"></td>
		</tr>
		<tr>
			<td><label for="gender">회원 성별</label></td>
			<td><input type="text" id="gender" name="gender" readonly="readonly" value="${member.gender}"></td>
		</tr>
		<tr>
			<td><label for="nickname">회원 별명</label></td>
			<td><input type="text" id="nickname" name="nickname" readonly="readonly" value="${member.nickname}"></td>
		</tr>
		<tr>
			<td><label for="email">회원 이메일</label></td>
			<td><input type="text" id="email" name="email" readonly="readonly" value="${member.email}"></td>
		</tr>
		<tr>
			<td><label for="address">회원 주소</label></td>
			<td><input type="text" id="address" name="address" readonly="readonly" value="${member.address}"></td>
		</tr>

		<tr>
			<td><p>&nbsp;</p></td>
			<td><input type="submit" value="회원 정보 수정" onclick="location.href='/user/update.do'"></td>
		</tr>
	</table>

	<!-- script -->
	<script>
	$(document).ready(function() {
		
		if(${member.gender} == 1)
			document.getElementById("gender").value = "여성";
		else if(${member.gender} == 2)
			document.getElementById("gender").value = "남성";
		else 
			document.getElementById("gender").value = "선택 안 함";
		
	});
	</script>
</body>
</html>