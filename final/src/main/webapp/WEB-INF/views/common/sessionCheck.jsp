<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<c:if test="${seeionScope.uid == null}">
	<script>
		alert("로그인 하신 후에 사용해주세요.");
		location.href=${contextPath}/user/login;
	</script>
</c:if>
