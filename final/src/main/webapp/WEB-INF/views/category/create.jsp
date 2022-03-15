<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>그룹생성</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="/css/categoryCreate.css">
</head>
<body>
<div class="create_wrap">
	
		<div class="category_create">
		<h3>카테고리 생성</h3>
	<hr>
		<form method="post" action="/category/create.do" enctype="multipart/form-data">
		<input type="text" name="categoryName" maxlength="20" placeholder="카테고리 이름을 입력해주세요">
		<button class="finish_btn" type="submit">완료</button>
			<button class="cancel_btn" type="button" onclick="location.href='/category/list'">취소</button>
			
			</form>
		</div>
	
	</div>
</body>
</html>