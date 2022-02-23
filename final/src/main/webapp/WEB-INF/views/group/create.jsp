<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>그룹생성</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
label.input_file {
	display: inline-block;
	width: 100px;
	height: 100px;
	line-height: 100px;
	text-align: center;
	background-color: #eee;
	cursor: pointer;
	background-color: #eee;
	text-align: center;
}

input[type="file"] {
	position: absolute;
	width: 0;
	height: 0;
	padding: 0;
	overflow: hidden;
	border: 0;
}
</style>
</head>

<body>
	<h1>그룹 생성</h1>
	<hr>
	<form method="post" action="/group/create.do" enctype="multipart/form-data">
		<div>
			<label for="file" class="input_file">이미지 선택</label>
			<input type="file" name="file" id="file" accept="image/*">
			<span class="fileView_wrap" style="display: none;">
				<img class="fileView" src="#" alt="이미지 미리보기" style="width: 100px; height: 100px;">
				<button type="button" onClick="removeFileFunc()">삭제</button>
			</span>
		</div>
		<select name="categoryId">
			<option value="" selected>카테고리</option>
			<c:forEach items="${categoryList}" var="cList">
				<option value="${cList.categoryId}">${cList.categoryName}</option>
			</c:forEach>
		</select>
		<input type="text" name="groupName" placeholder="그룹명" maxlength="20">
		<input type="text" name="groupIntro" placeholder="그룹 소개글" maxlength="100">
		<input type="text" name="uid" placeholder="그룹 생성자(관리자)" maxlength="10">
		<div>
			<button type="button" onclick="location.href='/group/list'">취소</button>
			<button type="submit">완료</button>
		</div>
	</form>

	<!-- script -->
	<script>
		
		function readImage(input) {
			if(input.files && input.files[0]) {
				const reader = new FileReader()
				
				reader.onload = function(e) {
					document.querySelector(".fileView").src = e.target.result;
					document.querySelector(".fileView_wrap").style.display = '';
					document.querySelector(".input_file").style.display = 'none';
			}
		        reader.readAsDataURL(input.files[0])
		    }
		}
		
		const inputImage = document.getElementById("file")
		inputImage.addEventListener("change", e => {
			if(inputImage.value.length == 0) {
				document.querySelector(".fileView_wrap").style.display = 'none';
				document.querySelector(".input_file").style.display = '';
			} else {
				readImage(e.target)
			}
		});
		
		/* 첨부파일 삭제 */
		function removeFileFunc() {
			inputImage.value = "";
			document.querySelector(".fileView_wrap").style.display = 'none';
			document.querySelector(".input_file").style.display = '';
		}
		
	</script>
</body>
</html>