<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="ko">

<head>
	<meta charset="UTF-8">
	<title>	<tiles:insertAttribute name="title" ignore="true" /></title>
	<!--<meta name="viewport" content="width=device-width, initial-scale=1.0">-->
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	
	<!-- css -->
	<link rel="stylesheet" type="text/css" href="${contextPath}/css/common/layout.css">
	<link rel="stylesheet" type="text/css" href="${contextPath}/css/common/header.css" />
	<link rel="stylesheet" type="text/css" href="${contextPath}/css/common/chat.css" />
	<link rel="stylesheet" type="text/css" href="${contextPath}/css/common/footer.css" />
	<link rel="stylesheet" type="text/css" href="${contextPath}<tiles:getAsString name="css2" ignore="true"/>" />
	<link rel="stylesheet" type="text/css" href="${contextPath}<tiles:getAsString name="css3" ignore="true"/>" />
	<link rel="stylesheet" type="text/css" href="${contextPath}<tiles:getAsString name="css" ignore="true"/>" />
	
	<!-- favicon -->
<%-- 	<link rel="shortcut icon" href="${contextPath}/resources/image/favicon.ico"> --%>
	
	<!-- font -->
<!-- 	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet"> -->
	
	<!-- script -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	
</head>

<body>
	<tiles:insertAttribute name="header" />
	<tiles:insertAttribute name="body" />
	<c:if test="${member != null}">
		<tiles:insertAttribute name="chat" />
	</c:if>
	<tiles:insertAttribute name="footer" />
</body>

</html>
