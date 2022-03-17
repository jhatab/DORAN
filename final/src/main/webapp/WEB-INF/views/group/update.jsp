<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<div class="container">
	<form method="post" action="/group/update.do" enctype="multipart/form-data">
		<div class="groupUpdate_wrap">
			<div class="groupContent">
				<h3>그룹 수정하기</h3>
				<!-- 이미지 선택 -->
				<div class="imageUpload_wrap">
					<c:if test="${groupInfo.groupImagePath != null and groupInfo.groupImagePath != ''}">
						<div class="groupImage_wrap">
							<img src="${groupInfo.groupImagePath}">
							<input type="hidden" name="groupImagePath" class="groupImagePath" value="${groupInfo.groupImagePath}" placeholder="그룹 이미지 경로" readonly>
							<span onClick="imageRemove()">삭제</span>
						</div>
					</c:if>
					<label for="file" class="input_file" style="display: none;">
						<img src="/images/photo.png" alt="이미지 선택">
					</label>
					<input type="file" name="file" id="file" accept="image/*">
					<div class="fileView_wrap" style="display: none;">
						<img class="fileView" src="#" alt="이미지 미리보기">
						<span onClick="RemoveFile()">삭제</span>
					</div>
				</div>
				<!-- 카테고리 선택 -->
				<div class="category_wrap">
					<c:forEach items="${categoryList}" var="cList">
						<label class="category_btn">
							<input type="radio" name="categoryId" value="${cList.categoryId}" <c:if test="${cList.categoryId == groupInfo.categoryId}">checked</c:if>>
							<span>${cList.categoryName}</span>
						</label>
					</c:forEach>
				</div>
				<!-- 인풋 영역 -->
				<input type="text" name="groupName" class="groupName" value="${groupInfo.groupName}" placeholder="그룹명" maxlength="20">
				<input type="text" name="groupIntro" class="groupIntro" value="${groupInfo.groupIntro}" placeholder="그룹 소개글" maxlength="100">
				<input type="hidden" name="uid" value="${groupInfo.uid}" placeholder="그룹 생성자(관리자)" readonly maxlength="10">
				<input type="hidden" name="groupId" value="${groupInfo.groupId}">
				<!-- 버튼 영역 -->
				<div class="groupUpdate_btn">
					<button class="cancel_btn" type="button" onclick="window.history.back()">취소</button>
					<button class="finish_btn" type="submit">완료</button>
				</div>
			</div>
		</div>
	</form>
</div>

<!-- script -->
<script>

	/* 유효성 검사 */
	$(".finish_btn").on("click", function() {
		if (!$('input[name="categoryId"]').is(':checked')) {
			alert('카테고리를 선택해주세요.');
			return false;
		}
		
		if ($('.groupName').val() == '') {
			alert('그룹 이름을 입력해주세요.');
			$('.groupName').focus();
			return false;
		}
		
		if ($('.groupIntro').val() == '') {
			alert('그룹 소개글을 입력해주세요.');
			$('.groupIntro').focus();
			return false;
		}
	});

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
