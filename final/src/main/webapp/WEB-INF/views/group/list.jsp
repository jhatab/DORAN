<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>그룹 목록</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>

<body>
	<h1>그룹 목록 페이지</h1>
	<div>
		<a href="/group/create">그룹생성</a>
		<hr>
	</div>
	<div>
		<h3>카테고리</h3>
		<ul>
			<c:forEach items="${categoryList}" var="cList">
				<li>
					<c:out value="${cList.categoryId}" />
					:
					<c:out value="${cList.categoryName}" />
				</li>
			</c:forEach>
		</ul>
	</div>
	<hr>

</body>
</html>