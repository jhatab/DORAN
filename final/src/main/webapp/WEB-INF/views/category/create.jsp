<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>그룹생성</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
	<h1>카테고리 생성</h1>
	<hr>
	<form method="post" action="/category/create.do" enctype="multipart/form-data">
		카테고리 명칭 : <input type="text" name="categoryName" maxlength="20">
		<div>
			<button type="button" onclick="location.href='/category/list'">취소</button>
			<button type="submit">완료</button>
		</div>
	</form>
</body>
</html>