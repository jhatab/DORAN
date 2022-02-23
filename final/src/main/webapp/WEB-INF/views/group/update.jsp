<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>그룹 수정</title>
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
	<h1>그룹 수정</h1>
	<hr>
	<form method="post" action="/group/update.do" enctype="multipart/form-data">
		<div>
			<c:if test="${groupInfo.groupImagePath != null and groupInfo.groupImagePath != ''}">
				<span class="groupImage_wrap">
					<img src="${contextPath}/resources/${groupInfo.groupImagePath}" style="width: 100px; height: 100px">
					<input type="hidden" name="groupImagePath" class="groupImagePath" value="${groupInfo.groupImagePath}" placeholder="그룹 이미지 경로" readonly>
					<button type="button" onClick="imageRemove()">삭제</button>
				</span>
			</c:if>
			<label for="file" class="input_file" style="display: none;">이미지 선택</label>
			<input type="file" name="file" id="file" accept="image/*">
			<span class="fileView_wrap" style="display: none;">
				<img class="fileView" src="#" alt="이미지 미리보기" style="width: 100px; height: 100px;">
				<button type="button" onClick="RemoveFile()">삭제</button>
			</span>
		</div>
		<input type="hidden" name="groupId" value="${groupInfo.groupId}">
		<select name="categoryId">
			<option value="">카테고리</option>
			<c:forEach items="${categoryList}" var="cList">
				<option value="${cList.categoryId}" <c:if test="${cList.categoryId == groupInfo.categoryId}">selected</c:if>>${cList.categoryName}</option>
			</c:forEach>
		</select>
		<input type="text" name="groupName" value="${groupInfo.groupName}" placeholder="그룹명" maxlength="20">
		<input type="text" name="groupIntro" value="${groupInfo.groupIntro}" placeholder="그룹 소개글" maxlength="100">
		<input type="text" name="uid" value="${groupInfo.uid}" placeholder="그룹 생성자(관리자)" readonly maxlength="10">
		<div>
			<button type="button" onclick="window.history.back()">취소</button>
			<button type="submit">완료</button>
		</div>
	</form>

	<!-- script -->
	<script>
		$(document).ready(function() {
			if("${groupInfo.groupImagePath}" == "") {
				document.querySelector(".input_file").style.display = '';
			}
		});
	
		function readImage(input) {
		    // 인풋 태그에 파일이 있는 경우
		    if(input.files && input.files[0]) {
		        // 이미지 파일인지 검사 (생략)
		        // FileReader 인스턴스 생성
		        const reader = new FileReader()
		        // 이미지가 로드가 된 경우
		        reader.onload = function(e) {
		            document.querySelector(".fileView").src = e.target.result;
		            document.querySelector(".fileView_wrap").style.display = '';
		            document.querySelector(".input_file").style.display = 'none';
		        }
		        // reader가 이미지 읽도록 하기
		        reader.readAsDataURL(input.files[0])
		    }
		}
		// input file에 change 이벤트 부여
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
		function RemoveFile() {
			inputImage.value = "";
			document.querySelector(".fileView_wrap").style.display = 'none';
			document.querySelector(".input_file").style.display = '';
		}
		
		function imageRemove() {
			document.querySelector(".input_file").style.display = '';
			document.querySelector(".groupImage_wrap").style.display = 'none';
			document.querySelector(".groupImagePath").value = '';
		}
		
	</script>
</body>

</html>