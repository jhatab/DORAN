<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<div class="container">
	<form method="post" action="/group/create.do" enctype="multipart/form-data">
		<div class="groupCreate_wrap">
			<div class="groupContent">
				<h3>그룹 만들기</h3>
				<!-- 이미지 선택 -->
				<div class="imageUpload_wrap">
					<label for="file" class="input_file">
						<img src="/images/photo.png" alt="이미지 선택">
					</label>
					<input type="file" name="file" id="file" accept="image/*">
					<div class="fileView_wrap" style="display: none;">
						<img class="fileView" src="#" alt="이미지 미리보기">
						<span onClick="removeFileFunc()">삭제</span>
					</div>
				</div>
				<!-- 카테고리 선택 -->
				<div class="category_wrap">
					<c:forEach items="${categoryList}" var="cList">
						<label class="category_btn">
							<input type="radio" name="categoryId" value="${cList.categoryId}">
							<span>${cList.categoryName}</span>
						</label>
					</c:forEach>
				</div>
				<!-- 인풋 영역 -->
				<input type="text" name="groupName" placeholder="그룹 이름을 입력하세요" maxlength="20">
				<input type="text" name="groupIntro" placeholder="그룹 소개글을 입력하세요" maxlength="50">
				<input type="hidden" name="uid" value="${member.uid}" placeholder="그룹 생성자(관리자)" maxlength="10">
				<!-- 버튼 영역 -->
				<div class="groupCreate_btn">
					<button class="cancel_btn" type="button" onclick="location.href='/group/list'">취소</button>
					<button class="finish_btn" type="submit">완료</button>
				</div>
			</div>
		</div>
	</form>
</div>

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
