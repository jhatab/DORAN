<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
request.setCharacterEncoding("UTF-8");
%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%@ include file="../common/sessionCheck.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 목록</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
	<form method="post">
		작성일자 : <fmt:formatDate value=""/>
		환자이름 : <input type="text" name="patient_name" value="${patients.patient_name}">
		환자이름 : <input type="text" name="patient_name" value="${patients.patient_name}">
		환자이름 : <input type="text" name="patient_name" value="${patients.patient_name}">
		환자이름 : <input type="text" name="patient_name" value="${patients.patient_name}">
	
		<input type="submit" value="입력하기">
		<input type="reset" value="다시입력">
	</form>
</body>
</html>