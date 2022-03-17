<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<body>
	<div class="groupWrapper">
		<!-- Left Bar -->
		<div class="leftWrapper">
			<div class="groupPhoto">
				<c:choose>
					<c:when test="${groupInfo.groupImagePath == null or groupInfo.groupImagePath == ''}">
						<img src="/images/group_image_file/basic.png">
					</c:when>
					<c:otherwise>
						<img src="${groupInfo.groupImagePath}">
					</c:otherwise>
				</c:choose>
			</div>
			<div class="contents">
				<h3>${groupInfo.groupName}</h3>
				<p>${groupInfo.groupIntro}</p>
				<c:choose>
					<c:when test="${isApproval == '1'}">
						<c:choose>
							<%-- 그룹 관리자 --%>
							<c:when test="${groupInfo.uid == member.uid}">
								<a href="/group/setting?groupId=${groupInfo.groupId}" class="groupSetBtn">그룹 설정</a>
							</c:when>
							<%-- 그룹원 --%>
							<c:otherwise>
								<a href="/group/setting?groupId=${groupInfo.groupId}" class="groupSetBtn">그룹 정보</a>
							</c:otherwise>
						</c:choose>
					</c:when>
					<c:otherwise>
						<c:choose>
							<%-- 일반회원 --%>
							<c:when test="${member != null}">
								<button type="button" class="groupJoinBtn">가입하기</button>
							</c:when>
							<%-- 비회원 --%>
							<c:otherwise>
								<button type="button" class="groupNoneBtn">가입하기</button>
							</c:otherwise>
						</c:choose>
					</c:otherwise>
				</c:choose>
			</div>
			<form id="groupForm" method="get">
				<input type="hidden" name="groupId" value="${groupInfo.groupId}">
				<input type="hidden" name="uid" value="${member.uid}">
				<input type="hidden" name="toUid" value="${groupInfo.uid}">
				<input type="hidden" name="fromUid" value="${member.uid}">
				<input type="hidden" name="noticeType" value="join">
				<input type="hidden" name="noticeMsg" value="${member.uid}님이 ${groupInfo.groupName}에 가입승인을 요청했습니다.">
			</form>
		</div>
		<!-- // Left Bar -->
		
		<!-- Middle Main -->
		<div>
			<!-- Search -->
			<div class="search_wrap">
				<form class="searchForm searchWrite" action="/group/home">
					<div>
						<img alt="search in Group" src="/images/search.png" />
						<input type="text" name="keyword" placeholder="그룹 내 게시글을 검색해보세요." autocomplete="off">
						<input type="hidden" name="groupId" value="${groupInfo.groupId}">
						<a href="/group/home?groupId=${groupInfo.groupId}" class="searchReset" style="display:none">취소</a>
					</div>
					<c:if test="${isApproval == '1'}">
						<button type="button" class="postWriteBtn">피드 작성</button>
					</c:if>			
				</form>
			</div>
			<!-- //Search -->
			
			<!-- 피드 작성 모달창 -->
			<div class="postWrite_modal">
				<div class="postWrite_content">
					<form id="postWriteForm" method="post" enctype="multipart/form-data">
						<input type="hidden" name="groupId" value="${groupInfo.groupId}">
						<input type="hidden" name="uid" value="${member.uid}">
						
						<label class="openness_btn">
							<input type="radio" name="openness" value="0" checked="checked">
							<span>전체공개</span>
						</label>
						<label class="openness_btn">
							<input type="radio" name="openness" value="1">
							<span>회원공개</span>
						</label>
						<label class="openness_btn">
							<input type="radio" name="openness" value="2">
							<span>그룹공개</span>
						</label>
						<label class="openness_btn">
							<input type="radio" name="openness" value="3">
							<span>나만보기</span>
						</label>
						<textarea name="content" placeholder="내용을 입력하세요."></textarea>
						<input type="text" name="tag" placeholder="해시태그를 입력하세요.(#태그 #태그 ...)" autocomplete="off">
						<!-- 이미지 파일 업로드 -->
						<div class="attach_wrap">
							<input type="file" name="files" id="files" multiple accept=".jpg, .png">
							<label for="files" class="inputFilesBtn">+</label>
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
			<!-- //피드 작성 모달창 -->
			
			<!-- Post List -->
			<div class="post_wrap">
				<c:forEach items="${postList}" var="pList">
					<c:choose>
						<%-- 게시물 공개수준 : 비공개(나만) --%>
						<c:when test="${pList.openness == 3}">
							<c:if test="${pList.uid == member.uid || groupInfo.uid == member.uid}">
								<%@ include file="openness.jsp" %>
							</c:if>
						</c:when>
						<%-- 게시물 공개수준 : 그룹 공개 --%>
						<c:when test="${pList.openness == 2}">
							<c:if test="${isApproval == '1'}">
								<%@ include file="openness.jsp" %>
							</c:if>
						</c:when>
						<%-- 게시물 공개수준 : 회원 공개 --%>
						<c:when test="${pList.openness == 1}">
							<c:if test="${member != null}">
								<%@ include file="openness.jsp" %>
							</c:if>
						</c:when>
						<%-- 게시물 공개수준 : 전체 공개 --%>
						<c:otherwise>
							<%@ include file="openness.jsp" %>
						</c:otherwise>
					</c:choose>
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
			<!-- //Post List -->
			<a href="#" id="topBtn">Top</a>
		</div>
		<!-- //Middle Main -->
		
		<!-- Right Bar -->
		<div class="rightWrapper">
			<p>인기 게시물</p>
			<c:forEach items="${hotList}" var="hList" varStatus="status">
				<div class="hotPost_info">
					<p>${status.count}.
						<a href="#" post-idx="post${hList.postId}">
							<span>${hList.content}</span>
						</a>
<%-- 						(<img src="/images/like.png">${hList.likeCount}) --%>
					</p>
				</div>
			</c:forEach>
			<div class="hotPostNone" style="display: none;">
				<span>게시물이 없습니다.</span>
			</div>
		</div>
		<!-- //Right Bar -->
	</div>
	
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
		} else if (result === "group join done") {
			alert("이미 가입 신청이 되었습니다. 승인이 있을 때까지 기다려주세요.");
		} else if (result === "group join success") {
			alert("그룹 가입 신청이 완료되었습니다. 승인이 있을 때까지 기다려주세요.");
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
	
	/* 그룹 가입 */
	$(".groupJoinBtn").on("click", function() {
		$("#groupForm").attr("action", "/group/join.do");
		$("#groupForm").attr("method", "post");
		$("#groupForm").submit();
	});
	
	$(".groupNoneBtn").on("click", function() {
		alert("로그인 후 이용해 주세요.");
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
	
	if($(".postWriteBtn").length > 0) { // isApproval이 1이 아닐 때는 버튼이 없음 => 오류 방지
		postWriteModal_open.addEventListener("click", postWriteModalToggle);
		postWriteModal_close.addEventListener("click", postWriteModalToggle);
	}
	
	/* 이미지 파일 미리보기 */
	let select_files = [];
	
	function handleImgsFilesSelect(e) {
		select_files = [];
		$(".attachView_wrap").empty();
		
		var files = e.target.files;
		var filesArr = Array.prototype.slice.call(files);
		
		if ($("#files")[0].files.length > 4) {
	        alert("이미지는 최대 4장까지 선택가능합니다.");
	        $("#files").val("");
	        return false;
	    }
		
		filesArr.forEach(function(f) {
			select_files.push(f);
			
			var reader = new FileReader();
			reader.onload = function(e) {
				var attach_html = '';
				attach_html += "<li>";
				attach_html += "<img src=\"" + e.target.result + "\">";
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
		if (!$('.postWrite_content textarea').val()) {
			alert('내용을 입력해주세요.');
			$('.postWrite_content textarea').focus();
			return false;
		}
		
		var tagVal = $('.postWrite_content input[name="tag"]').val();
		var substring = "#";
		var tagArr = tagVal.split(substring);
		
		if(tagVal != '') {
			if(tagVal.indexOf(substring) == -1) {
				alert('태그를 다시 입력해주세요.');
				$('.postWrite_content input[name="tag"]').focus();
				return false;
			}
			
			for(let j = 1; j < tagArr.length; j++) {
				if(tagArr[j].length == 0) {
					alert("태그를 다시 입력해주세요.");
					$('.postWrite_content input[name="tag"]').focus();
					return false;
				}
			}
		}
		
		postWriteForm.attr("action", "/group/postWrite.do");
		postWriteForm.submit();
	});
	
	$('.postWrite_content input[name="tag"]').keydown(function(e) {
	     if (e.keyCode == 13) {
			e.preventDefault();
	         $('.postWriteFinBtn').click();
	     }
	});
	
	/*========== 게시물 수정 및 삭제 ========== */
	
	const postCount = document.querySelectorAll(".post_wrap .post_info"); // 게시물 수
	
	/* 게시물 토글 버튼 표시 */
	for (let i = 0; i < postCount.length; i++) {
		if("${member.uid}" != $(".userId p.uid").eq(i).text()) {
			$(".groupFeedMenu").eq(i).css("display", "none");
		}
	}

	/* 게시물 버튼 토글 */
	const postDropBtn = document.querySelectorAll(".groupFeedMenu img");
	const postToggleMenu = document.querySelectorAll(".groupFeedMenu .toggleMenu");
	
	function postBtnShowFunc(i) {
		if (postToggleMenu[i].style.display == "none") {
			postToggleMenu[i].style.display = "";
		} else {
			postToggleMenu[i].style.display = "none";
		}
		return false;
	}
	
	for (let i = 0; i < postCount.length; i++) {
		postDropBtn[i].addEventListener("click", event => postBtnShowFunc(i));
	}
	
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
		tag : '',
		openness : '',
	}
	
	for (let i = 0; i < postCount.length; i++) {
		$(".postUpdateFinBtn").eq(i).on("click", function() {
			postUpdateData.postId = $(".postUpdate_content .postId").eq(i).val();
			postUpdateData.content = $(".postUpdate_content .content").eq(i).val();
			postUpdateData.tag = $(".postUpdate_content .tag").eq(i).val();
			postUpdateData.openness = $(".postUpdate_content .openness:checked").eq(i).val();
			
			if (!$(".postUpdate_content .content").eq(i).val()) {
				alert('내용을 입력해주세요.');
				return false;
			}
			
			var substring = "#";
			var tagArr = postUpdateData.tag.split(substring);
			
			if(postUpdateData.tag != '') {
				if(postUpdateData.tag.indexOf(substring) == -1) {
					alert('태그를 다시 입력해주세요.');
					$(".postUpdate_content .tag").focus();
					return false;
				}
				
				for(let j = 1; j < tagArr.length; j++) {
					if(tagArr[j].length == 0) {
						alert("태그를 다시 입력해주세요.");
						$(".postUpdate_content .tag").focus();
						return false;
					}
				}
			}
			
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
		
		$('.postUpdate_content .tag').eq(i).keydown(function(e) {
			if (e.keyCode == 13) {
				e.preventDefault();
				$('.postUpdateFinBtn').eq(i).click();
			}
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
	
	/* ========== 게시물 추천 ========== */
	
	for (let i = 0; i < postCount.length; i++) {
		$('.likeBtn').hover(function() {
			$(this).attr("src", "/images/like-color.png");
		}, function(){
			$(this).attr("src", "/images/like.png");
		});
	}
	
	/* 좋아요 추가/취소 */
	const likeAddData = {
		uid : '${member.uid}',
		postId : '',
		
		toUid : '',
		fromUid : '',
		noticeType : '',
		groupId : '',
		noticeMsg : '',
	}
	
	for (let i = 0; i < postCount.length; i++) {
		$(".likeBtn").eq(i).on("click", function() {
			likeAddData.postId = $(this).attr("post-idx");
			
			likeAddData.toUid = $(".groupFeedUpper .toUid").eq(i).val();
			likeAddData.fromUid = "${member.uid}";
			likeAddData.noticeType = "like";
			likeAddData.groupId = ${groupInfo.groupId};
			likeAddData.noticeMsg = "${member.nickname}님이 회원님의 피드를 좋아합니다.";
			
			$.ajax({
				url: '/group/postLike.do',
				type: 'post',
				data: likeAddData,
				success: function(result){
					location.reload();
				}
			});
		});
	}
	
	/* ========== 댓글 ========== */
	
	$(document).ready(function() {
		if(${isApproval} != '1') {
			$(".replyWrite_wrap .replyContent").each(function() {
				$(this).attr("disabled", "disabled");
			});
		}
	});
	
	/* 댓글 작성 */
	const replyWriteData = {
		replyContent : '',
		uid : '',
		postId : '',
		
		toUid : '',
		fromUid : '',
		noticeType : '',
		groupId : '',
		noticeMsg : '',
	}
	
	function replyWriteFunc(i) {
		replyWriteData.replyContent = $(".replyWrite_wrap .replyContent").eq(i).val();
		replyWriteData.uid = $(".replyWrite_wrap .uid").eq(i).val();
		replyWriteData.postId = $(".replyWrite_wrap .postId").eq(i).val();
		
		replyWriteData.toUid = $(".replyWrite_wrap .toUid").eq(i).val();
		replyWriteData.fromUid = "${member.uid}";
		replyWriteData.noticeType = "reply";
		replyWriteData.groupId = ${groupInfo.groupId};
		replyWriteData.noticeMsg = "${member.nickname}님이 댓글을 남겼습니다.";
		
		if(replyWriteData.replyContent != '') {
			$.ajax({
				url: '/group/replyWrite.do',
				type: 'post',
				data: replyWriteData,
				success: function(result){
					window.location.reload();
				}
			});
		}
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
	
	/* 댓글 토글 버튼 표시 */
	const replyCount = document.querySelectorAll(".reply_wrap .replyInfo");					// 댓글 수
	
	for (let i = 0; i < replyCount.length; i++) {
		if("${member.uid}" != $(".replyInfo span.uid").eq(i).text()) {
			$(".groupReplyMenu").eq(i).css("display", "none");
		}
	}

	/* 댓글 버튼 토글 */
	const replyDropBtn = document.querySelectorAll(".groupReplyMenu img");
	const replyToggleMenu = document.querySelectorAll(".groupReplyMenu .toggleMenu");
	
	function replyBtnShowFunc(i) {
		if (replyToggleMenu[i].style.display == "none") {
			replyToggleMenu[i].style.display = "";
		} else {
			replyToggleMenu[i].style.display = "none";
		}
		return false;
	}
	
	for (let i = 0; i < replyCount.length; i++) {
		replyDropBtn[i].addEventListener("click", event => replyBtnShowFunc(i));
	}
	
	/* 댓글 수정 시 css 변경 */
	const replyUpdateBtn = document.querySelectorAll(".replyUpdateBtn");
	const replyUpdateInput = document.querySelectorAll(".replyInfo textarea");
	const replyUpdateBtnWrap = document.querySelectorAll(".replyUpdateBtn_wrap");
	const replyUpdateCancleBtn = document.querySelectorAll(".replyUpdateCancleBtn");	// 댓글 수정 취소 버튼
	const replyUpdateFinBtn = document.querySelectorAll(".replyUpdateFinBtn");			// 댓글 수정 완료 버튼

	function replyUpdateBtnFunc(i) {
		replyUpdateInput[i].readOnly = false;			// input readyOnly 해제
		replyUpdateInput[i].classList.add("readonlyF"); // 스타일 클래스 추가
		replyUpdateBtnWrap[i].style.display = "";		// 수정 취소, 완료 버튼 표시
	}
	
	function replyUpdateCancleFunc(i) {
		replyUpdateInput[i].readOnly = "readOnly";		// inut readOnly 설정
		replyUpdateInput[i].classList.remove("readonlyF");	// 스타일 클래스 제거
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
			
			replyUpdateData.replyId = $(".reply_wrap .replyId").eq(i).val();
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
				replyDeleteData.replyId = $(".reply_wrap .replyId").eq(i).val();
				replyDeleteData.postId = $(".reply_wrap .postId").eq(i).val();
				
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
	
	/* 댓글 textarea 높이 자동 조정 */
	const replyTextarea = document.querySelectorAll(".replyInfo textarea");

	function adjustTextarea() {
		for (let i = 0; i < replyTextarea.length; i++) {
			replyTextarea[i].style.height = "auto";
			replyTextarea[i].style.height = (replyTextarea[i].scrollHeight) + 'px';

			if (replyTextarea[i].value.length <= 35 && replyTextarea[i].value.split('\n').length <= 1) {
				replyTextarea[i].style.height = 21 + "px";
			}
		}
	}
	adjustTextarea();
	
	/* 인기 게시물 */
	const hotPost = document.querySelectorAll('.hotPost_info a');
	
	for(let i = 0; i < hotPost.length; i++) {
		hotPost[i].addEventListener('click', function(e) {
			var hotPostIdx = $(this).attr("post-idx");
			var offset = $("#" + hotPostIdx).offset();
			
			e.preventDefault();
			$('html, body').animate({scrollTop: offset.top - 200}, 500);
			$("#" + hotPostIdx).addClass("hotPost");
			setTimeout(function() {
				$("#" + hotPostIdx).removeClass("hotPost");
			}, 2000)
		});
	}
	
	/* top 버튼 */
	$(document).ready(function() {
		$(backToTop).hide();
	});
		
	var backToTop = document.querySelector("#topBtn");
	
	window.addEventListener("scroll", function() {
		if(this.scrollY > 200) {
			$(backToTop).fadeIn("slow");
		} else {
			$(backToTop).fadeOut("slow");
		}
	});
	
	backToTop.addEventListener("click", function(e) {
		e.preventDefault();
		window.scrollTo({top:0, behavior: 'smooth'});
	})
	
	</script>