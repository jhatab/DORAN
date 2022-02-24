<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>그룹 페이지</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
/* 게시물 작성 모달 */
.postWrite_modal {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: rgba(0, 0, 0, 0.5);
	z-index: 99;
	display: none;
}
.postWrite_modal .postWrite_content {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	width: 600px;
	height: 500px;
	padding: 30px;
	text-align: center;
	background: #fff;
	vertical-align: middle;
}
.postWrite_modal .postWriteBtn_wrap {
	position: absolute;
	bottom: 30px;
	left: 50%;
	transform: translate(-50%, 0%);
}
/* 이미지 파일 업로드 */
.show_modal {
	display: block
}
</style>
</head>

<body>
	<h1>그룹 페이지</h1>
	
	<hr>
	
	<!-- 그룹 정보 -->
	<div class="groip_info">
		<c:choose>
			<c:when test="${groupInfo.groupImagePath == null or groupInfo.groupImagePath == ''}">
				<img src="${contextPath}/resources/group_image_file/basic.png" style="width: 100px; height: 100px">
			</c:when>
			<c:otherwise>
				<img src="${contextPath}/resources/${groupInfo.groupImagePath}" style="width: 100px; height: 100px">
			</c:otherwise>
		</c:choose>
		<span>그룹 식별자 : ${groupInfo.groupId}</span><br>
		<span>그룹명 : ${groupInfo.groupName}</span><br>
		<span>그룹소개 : ${groupInfo.groupIntro}</span><br>
		<span>그룹 관리자 : ${groupInfo.uid}</span>
		<div class="groupBtn_wrap">
			<button type="button" class="groupUpdateBtn">그룹 수정</button>
			<button type="button" class="groupDeleteBtn">그룹 삭제</button>
		</div>
		<form id="groupForm" method="get">
			<input type="hidden" name="groupId" value="${groupInfo.groupId}">
		</form>
	</div>
	<!-- // 그룹 정보 -->
	
	<hr>
	
	<button type="button" class="postWriteBtn">게시물 작성</button>
	
	<hr>
	
	<!-- 게시물 작성 모달 -->
	<div class="postWrite_modal">
		<div class="postWrite_content">
			<form id="postWriteForm" method="post" enctype="multipart/form-data">
				<h3>게시물 작성</h3>
				<input type="text" name="groupId" value="${groupInfo.groupId}" placeholder="그룹식별자" readonly><br>
				<input type="text" name="uid" placeholder="작성자"><br>
				<textarea name="content" placeholder="내용"></textarea><br>
				해시태그<br>
				<label><input type="radio" name="openness" value="0" checked="checked">전체</label>
				<label><input type="radio" name="openness" value="1">회원</label>
				<label><input type="radio" name="openness" value="2">그룹</label>
				<label><input type="radio" name="openness" value="3">나만</label><br>
				해시태그<br>
				<!-- 이미지 파일 업로드 -->
				<hr>
				<div class="attach_wrap">
					<ul class="attachView_wrap">
					</ul>
					<span>
						<label for="files">이미지 선택</label>
						<input type="file" name="files" id="input_files" multiple accept=".jpg, .png">
					</span>
				</div>
				<div class="postWriteBtn_wrap">
					<button type="button" class="postWriteCancleBtn">취소</button>
					<button type="button" class="postWriteFinBtn">작성</button>
				</div>
			</form>			
		</div>
	</div>
	<!-- // 게시물 작성 모달 -->
	
	<!-- 게시물 목록 -->
	<div class="post_wrap">
		<c:forEach items="${postList}" var="postList">
			<div class="post_info${postList.postId}">
				<span>게시물 식별자 : ${postList.postId}</span><br>
				<span>게시물 작성자 아이디 : ${postList.uid}</span><br>
				<span>게시물 작성자 닉네임 : ${postList.nickname}</span><br>
				<span>게시물 내용: ${postList.content}</span><br>
				<span>게시물 공개수준: ${postList.openness}</span><br>
				<span>게시물 좋아요 수: ${postList.likeCount}</span><button type="button" class="likeBtn">추천</button><br>
				<span>게시물 작성날짜: ${postList.postedDate}</span><br>
				<span>댓글수 : </span><br>
				<span>해시태그 : </span><br>
				<div class="postAttach_info">
					<c:forEach items="${postImageList}" var="pIList">
						<c:if test="${pIList.postId == postList.postId}">
							<img src="${contextPath}/resources/${pIList.filePath}" style="width: 100px; height: 100px">
						</c:if>
					</c:forEach>
				</div>
			</div>
			<hr>
		</c:forEach>
	</div>
	<!-- // 게시물 목록 -->
	
	<!-- script -->
	<script>
	$(document).ready(function() {
		
		/* ALERT */
		const result = '<c:out value="${result}"/>';

		if (result === "group update success") {
			alert("그룹 수정이 완료되었습니다.");
		} else if (result === "feed create success") {
			alert("피드 작성이 완료되었습니다.");
		} else if (result === "feed delete success") {
			alert("피드가 삭제되었습니다.");
		}
		
	});
	
	/*////////// 그룹 ////////// */
	
	/* 그룹 수정 버튼 */
	$(".groupUpdateBtn").on("click", function() {
		$("#groupForm").attr("action", "/group/update");
		$("#groupForm").submit();
	});
	
	/* 그룹 삭제 버튼 */
	$(".groupDeleteBtn").on("click", function() {
		if (confirm("정말 삭제하시겠습니까?") == true){
			$("#groupForm").attr("action", "/group/remove.do");
			$("#groupForm").attr("method", "post");
			$("#groupForm").submit();
		} else {
			return false;
		}
	});
	
	/*////////// 게시물 작성 ////////// */
	
	/* 게시물 작성 모달창 */
	const postWriteModal = document.querySelector(".postWrite_modal");
	const postWriteModal_open = document.querySelector(".postWriteBtn");
	const postWriteModal_close = document.querySelector(".postWriteCancleBtn");

	function postWriteModalToggle() {
		if(postWriteModal.classList.contains("show_modal")) {
			if (confirm("게시물 작성을 취소하시겠습니까?") == true) {
				postWriteModal.classList.remove("show_modal");
				window.location.reload()
			} else {
				return false;
			}
		} else {
			postWriteModal.className += " show_modal";
		}
	}

	postWriteModal_open.addEventListener("click", postWriteModalToggle);
	postWriteModal_close.addEventListener("click", postWriteModalToggle);
	
	/* 이미지 파일 업로드 */
	let select_files = [];
	
	function handleImgsFilesSelect(e) {
		select_files = [];
		$(".attachView_wrap").empty();
		
		var files = e.target.files;
		var filesArr = Array.prototype.slice.call(files);
		
		filesArr.forEach(function(f) {
			select_files.push(f);
			
			var reader = new FileReader();
			reader.onload = function(e) {
				var attach_html = '';
				attach_html += "<li>";
				attach_html += "<img src=\"" + e.target.result + "\" style='width: 50px; height: 50px'>";
				attach_html += "<button type='button' class='' onClick=''>삭제</button>";
				attach_html += "</li>";
				
				$(".attachView_wrap").append(attach_html);
			}
			reader.readAsDataURL(f);
		});
	}
	
	$("#input_files").on("change", handleImgsFilesSelect);
	
	/* 게시물 작성 버튼 */
	const postWriteForm = $("#postWriteForm");
		
	$(".postWriteFinBtn").on("click", function() {
		postWriteForm.attr("action", "/group/postWrite.do");
		postWriteForm.submit();
	});

	</script>
</body>
</html>