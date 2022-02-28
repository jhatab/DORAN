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
.postWrite_modal .postWriteBtn_wrap, .postUpdate_modal .postUpdateBtn_wrap {
	position: absolute;
	bottom: 30px;
	left: 50%;
	transform: translate(-50%, 0%);
}
/* 게시물 수정 모달창 */
.postUpdate_modal {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: rgba(0, 0, 0, 0.5);
	z-index: 99;
	display: none;
}
.postUpdate_modal .postUpdate_content {
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
/* 이미지 파일 업로드 */
label.inputFilesBtn {
	display: inline-block;
	width: 50px;
	height: 50px;
	line-height: 50px;
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
/* 모달창 */
.show_modal {
	display: block
}
/* 인기 게시물 */
.hotList_wrap {
	position: absolute;
	top: 10px;
	right: 10px;
	width: 250px;
	height: 250px;
	text-align: center;
	background: #ddd;
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
	
	<!-- 검색 -->
	<div class="search_wrap">
		<form class="searchForm" action="/group/home">
			<input type="hidden" name="groupId" value="${groupInfo.groupId}">
			<input type="text" name="keyword" placeholder="검색">
			<button>검색</button>
			<a href="/group/home?groupId=${groupInfo.groupId}" class="searchReset" style="display:none">취소</a>
		</form>
	</div>
	<!-- // 검색 -->
	<button type="button" class="postWriteBtn">게시물 작성</button>
	
	<hr>
	
	<!-- 게시물 작성 모달창 -->
	<div class="postWrite_modal">
		<div class="postWrite_content">
			<form id="postWriteForm" method="post" enctype="multipart/form-data">
				<h3>게시물 작성</h3>
				<input type="text" name="groupId" value="${groupInfo.groupId}" placeholder="그룹식별자" readonly><br>
				<input type="text" name="uid" placeholder="작성자"><br>
				<textarea name="content" placeholder="내용"></textarea><br>
				<input type="text" name="tagName" placeholder="해시태그"><br>
				<input type="text" name="tagName" placeholder="해시태그"><br>
				<label><input type="radio" name="openness" value="0" checked="checked">전체</label>
				<label><input type="radio" name="openness" value="1">회원</label>
				<label><input type="radio" name="openness" value="2">그룹</label>
				<label><input type="radio" name="openness" value="3">나만</label><br>
				<!-- 이미지 파일 업로드 -->
				<hr>
				<div class="attach_wrap">
					<label for="files" class="inputFilesBtn">+</label>
					<input type="file" name="files" id="files" multiple accept=".jpg, .png">
					<ul class="attachView_wrap">
					</ul>
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
		<c:forEach items="${postList}" var="pList">
			<div class="post_info">
				<span>게시물 식별자 : ${pList.postId}</span><br>
				<span>게시물 작성자 아이디 : ${pList.uid}</span><br>
				<span>게시물 작성자 닉네임 : ${pList.nickname}</span><br>
				<span>게시물 내용: ${pList.content}</span><br>
				<span>게시물 공개수준: ${pList.openness}</span><br>
				<span>
					게시물 좋아요 수: ${pList.likeCount}
					<button type="button" class="likeAddBtn">추천</button>
				</span><br>
				<span>게시물 작성날짜: ${pList.postedDate}</span><br>
				<span>댓글수 : ${pList.replyCount}</span><br>
				<span>
					해시태그 : 
					<c:forEach items="${tagList}" var="tList">
						<c:if test="${tList.postId == pList.postId}">
							<span>${tList.tagName}</span>
						</c:if>
					</c:forEach>
				</span><br>
				<div class="postAttach_info">
					<c:forEach items="${postImageList}" var="pIList">
						<c:if test="${pIList.postId == pList.postId}">
							<img src="${contextPath}/resources/${pIList.filePath}" style="width: 100px; height: 100px">
						</c:if>
					</c:forEach>
				</div>
			</div>
			<div class="postBtn_wrap">
				<button type="button" class="postUpdateBtn">게시물 수정</button>
				<button type="button" class="postDeleteBtn" post-idx="${pList.postId}">게시물 삭제</button>
			</div>
			<!-- 게시물 수정 모달창 -->
			<div class="postUpdate_modal">
				<div class="postUpdate_content">
					<form class="postUpdateForm" method="post">
						<h3>게시물 수정</h3>
						<input type="hidden" name="postId" class="postId" value="${pList.postId}">
						<textarea name="content" class="content" placeholder="내용">${pList.content}</textarea><br>
						해시태그<br>
						<label><input type="radio" name="openness" class="openness" value="0" <c:if test="${pList.openness == 0}">checked</c:if>/>전체</label>
						<label><input type="radio" name="openness" class="openness" value="1" <c:if test="${pList.openness == 1}">checked</c:if>/>회원</label>
						<label><input type="radio" name="openness" class="openness" value="2" <c:if test="${pList.openness == 2}">checked</c:if>/>그룹</label>
						<label><input type="radio" name="openness" class="openness" value="3" <c:if test="${pList.openness == 3}">checked</c:if>/>나만</label><br>
						이미지 파일 업로드
						<hr>
						<div class="attach_wrap">
							<label for="files" class="inputFilesBtn">+</label>
							<input type="file" name="files" id="files" multiple accept=".jpg, .png">
							<ul class="attachView_wrap">
							</ul>
						</div>
						<div class="postUpdateBtn_wrap">
							<button type="button" class="postUpdateCancleBtn">취소</button>
							<button type="button" class="postUpdateFinBtn">작성</button>
						</div>
					</form>
				</div>
			</div>
			<!-- // 게시물 수정 모달창 -->
			
			<!-- 댓글 목록 -->
			<div class="reply_wrap">
				<ul class="replyList">
					<c:forEach items="${replyList}" var="rList">
						<c:if test="${rList.postId == pList.postId}">
							<li class="replyInfo">
								<input type="hidden" name="postId" class="postId" value="${rList.postId}">
								<input type="hidden" name="replyId" class="replyId" value="${rList.replyId}">
								<span>${rList.nickname}</span><br>
								<textarea name=replyContent class="replyContent" readonly>${rList.replyContent}</textarea>
								<button type="button" class="replyUpdateBtn">댓글 수정</button>
								<button type="button" class="replyDeleteBtn">댓글 삭제</button>
								<div class="replyUpdateBtn_wrap" style="display:none">
									<button type="button" class="replyUpdateCancleBtn">취소</button>
									<button type="button" class="replyUpdateFinBtn">완료</button>
								</div>
							</li>
						</c:if>
					</c:forEach>
				</ul>
				<!-- 댓글 작성 -->
				<div class="replyWrite_wrap">
					<input type="hidden" name="postId" class="postId" value="${pList.postId}">
					<input type="text" name="uid" class="uid" placeholder="작성자">
					<input type="text" name="replyContent" class="replyContent" placeholder="댓글을 입력해주세요.">
					<button type="button" class="replyWriteBtn">등록</button>
				</div>
				<!-- // 댓글 작성 -->
			</div>
			<!-- // 댓글 목록 -->
			<hr>
		</c:forEach>
		<!-- 검색 결과 X -->
		<div class="postSearchNone" style="display: none;">
			<span>검색 결과가 없습니다.</span>
		</div>
		<!-- 게시물 X -->
		<div class="postNone" style="display: none;">
			<span>게시물이 없습니다.</span>
		</div>
	</div>
	<!-- // 게시물 목록 -->
	
	<!-- 인기 게시물 목록 -->
	<div class="hotList_wrap">
		<h3>인기 게시물</h3>
		<ul>
			<c:forEach items="${hotList}" var="hList" varStatus="status">
				<li class="hotPost_info">
					<a href="#">
						<span>${status.count}. </span>${hList.content} [${hList.replyCount}]
					</a>
				</li>
			</c:forEach>
		</ul>
		<div class="hotPostNone" style="display: none;">
			<span>게시물이 없습니다.</span>
		</div>
	</div>
	<!-- // 인기 게시물 목록 -->
	
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
	
	/* ========== 검색 ========== */
	
	/* 검색값 유지 */
	let param = new URLSearchParams(location.search);
	let getParam = param.get('keyword');
	$(".searchForm").find("input[name='keyword']").val(getParam);
	
	/* 취소 버튼 표시 */
	let keyword = $(".searchForm").find("input[name='keyword']").val();
	if (keyword == null || keyword == '') {
			document.querySelector(".searchReset").style.display = 'none';
	} else {
			document.querySelector(".searchReset").style.display = '';
	}
	
	/* 게시물이 없을 경우 */
	const isPostInfo = document.querySelectorAll('.post_info');
	const isHotPostInfo = document.querySelectorAll('.hotPost_info');
	
	if(isPostInfo.length <= 0) {
		if (keyword) { // 검색 결과가 없을 경우
			document.querySelector(".postSearchNone").style.display = '';
		} else {
			document.querySelector(".postNone").style.display = '';
		}
	}
	
	if(isHotPostInfo.length <= 0) {
		document.querySelector(".hotPostNone").style.display = '';
	}
	
	/*========== 그룹 ==========/ */
	
	/* 그룹 수정 */
	$(".groupUpdateBtn").on("click", function() {
		$("#groupForm").attr("action", "/group/update");
		$("#groupForm").submit();
	});
	
	/* 그룹 삭제 */
	$(".groupDeleteBtn").on("click", function() {
		if (confirm("정말 삭제하시겠습니까?") == true){
			$("#groupForm").attr("action", "/group/remove.do");
			$("#groupForm").attr("method", "post");
			$("#groupForm").submit();
		} else {
			return false;
		}
	});
	
	/*========== 게시물 작성 ========== */
	
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
	
	/* 이미지 파일 미리보기 */
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
// 				attach_html += "<button type='button'>삭제</button>";
				attach_html += "</li>";
				
				$(".attachView_wrap").append(attach_html);
			}
			reader.readAsDataURL(f);
		});
	}
	
	$("#files").on("change", handleImgsFilesSelect);
	
	/* 게시물 작성 */
	const postWriteForm = $("#postWriteForm");
		
	$(".postWriteFinBtn").on("click", function() {
		postWriteForm.attr("action", "/group/postWrite.do");
		postWriteForm.submit();
	});
	
	/*========== 게시물 수정 및 삭제 ========== */
	
	const postCount = document.querySelectorAll(".post_wrap .post_info"); // 게시물 수

	/* 게시물 수정 모달창 */
	const postUpdateModal = document.querySelectorAll(".postUpdate_modal");
	const postUpdateModal_open = document.querySelectorAll(".postUpdateBtn");
	const postUpdateModal_close = document.querySelectorAll(".postUpdateCancleBtn");
	
	function postUpdateModalToggle(i) {
		if(postUpdateModal[i].classList.contains("show_modal")) {
			if (confirm("게시물 수정을 취소하시겠습니까?") == true) {
				postUpdateModal[i].classList.remove("show_modal");
				window.location.reload()
			} else {
				return false;
			}
		} else {
			postUpdateModal[i].className += " show_modal";
		}
	}
	
	for (let i = 0; i < postUpdateModal_open.length; i++) {
		postUpdateModal_open[i].addEventListener("click", event => postUpdateModalToggle(i));
		postUpdateModal_close[i].addEventListener("click", event => postUpdateModalToggle(i));
	}
	
	/* 게시물 수정 */
	const postUpdateData = {
		postId : '',
		content : '',
		openness : '',
	}
	
	for (let i = 0; i < postCount.length; i++) {
		$(".postUpdateFinBtn").eq(i).on("click", function() {
			postUpdateData.postId = $(".postUpdate_content .postId").eq(i).val();
			postUpdateData.content = $(".postUpdate_content .content").eq(i).val();
			postUpdateData.openness = $(".postUpdate_content .openness:checked").eq(i).val();
			
			$.ajax({
				url: '/group/postUpdate.do',
				type: 'post',
				data: postUpdateData,
				success: function(result){
					alert("피드 수정이 완료되었습니다.");
					window.location.reload();
				}
			});
		});
	}
	
	/* 게시물 삭제 */
	const postDeleteData = {
		postId : '',
	}
	
	for (let i = 0; i < postCount.length; i++) {
		$(".postDeleteBtn").eq(i).on("click", function() {
			if (confirm("정말 삭제하시겠습니까?") == true) {
				postDeleteData.postId = $(this).attr("post-idx");
				
				$.ajax({
					url: '/group/postDelete.do',
					type: 'post',
					data: postDeleteData,
					success: function(result){
						alert("피드가 삭제되었습니다.");
						window.location.reload();
					}
				});
			}
		});
	}
	
	/* ========== 댓글 ========== */
	
	/* 댓글 작성 */
	const replyWriteData = {
		replyContent : '',
		uid : '',
		postId : '',
	}
	
	function replyWriteFunc(i) {
		replyWriteData.replyContent = $(".replyWrite_wrap .replyContent").eq(i).val();
		replyWriteData.uid = $(".replyWrite_wrap .uid").eq(i).val();
		replyWriteData.postId = $(".replyWrite_wrap .postId").eq(i).val();
		
		$.ajax({
			url: '/group/replyWrite.do',
			type: 'post',
			data: replyWriteData,
			success: function(result){
				window.location.reload();
			}
		});
	}
	
	for (let i = 0; i < postCount.length; i++) {
		$('.replyWriteBtn').eq(i).on('click', function() {    
			replyWriteFunc(i)
		});
		
		$(".replyWrite_wrap .replyContent").eq(i).keydown(function(key) {
			if(key.keyCode == 13) {
				replyWriteFunc(i)
			}
		});
	}
	
	/* 댓글 수정 시 css 변경 */
	const replyCount = document.querySelectorAll(".reply_wrap ul li");					// 댓글 수
	const replyUpdateBtn = document.querySelectorAll(".replyUpdateBtn");
	const replyUpdateInput = document.querySelectorAll(".replyInfo textarea");
	const replyUpdateBtnWrap = document.querySelectorAll(".replyUpdateBtn_wrap");
	const replyUpdateCancleBtn = document.querySelectorAll(".replyUpdateCancleBtn");	// 댓글 수정 취소 버튼
	const replyUpdateFinBtn = document.querySelectorAll(".replyUpdateFinBtn");			// 댓글 수정 완료 버튼

	function replyUpdateBtnFunc(i) {
		replyUpdateInput[i].readOnly = false;			// input readyOnly 해제
		replyUpdateBtnWrap[i].style.display = "";		// 수정 취소, 완료 버튼 표시
	}
	
	function replyUpdateCancleFunc(i) {
		replyUpdateInput[i].readOnly = "readOnly";		// inut readOnly 설정
		replyUpdateBtnWrap[i].style.display = "none";	// 수정 취소, 완료 버튼 제거
		window.location.reload();						// 새로고침
	}
	
	for (let i = 0; i < replyCount.length; i++) {
		replyUpdateBtn[i].addEventListener("click", event => replyUpdateBtnFunc(i));	// 댓글 수정 버튼
		replyUpdateCancleBtn[i].addEventListener("click", event => replyUpdateCancleFunc(i));	// 댓글 수정 취소 버튼
	}
	
	/* 댓글 수정 */
	const replyUpdateData = {
		replyId : '',
		replyContent : '',
	}
	
	for (let i = 0; i < replyCount.length; i++) {
		$(".replyUpdateFinBtn").eq(i).on("click", function() {
			
			replyUpdateData.replyId = $(".reply_wrap .replyList .replyId").eq(i).val();
			replyUpdateData.replyContent = $(replyUpdateInput).eq(i).val();
			
			$.ajax({
				url: '/group/replyUpdate.do',
				type: 'post',
				data: replyUpdateData,
				success: function(result){
					replyUpdateCancleFunc(i);
				}
			});
			
		});
	}
	
	/* 댓글 삭제 */
	const replyDeleteData = {
		replyId : '',
		postId : '',
	}
	
	for (let i = 0; i < replyCount.length; i++) {
		$(".replyDeleteBtn").eq(i).on("click", function() {
			
			if (confirm("정말 삭제하시겠습니까?") == true){
				replyDeleteData.replyId = $(".reply_wrap .replyList .replyId").eq(i).val();
				replyDeleteData.postId = $(".reply_wrap .replyList .postId").eq(i).val();
				
				$.ajax({
					url: '/group/replyDelete.do',
					type: 'post',
					data: replyDeleteData,
					success: function(result){
						alert("댓글이 삭제되었습니다.");
						window.location.reload();
					}
				});
			} else {
				return false;
			}
			
		});
	}

	</script>
</body>
</html>