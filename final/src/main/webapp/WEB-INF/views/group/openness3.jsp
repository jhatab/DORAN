<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>그룹 목록</title>
</head>
<body>
	<c:when test="${pList.openness == 3}">
		<c:if test="${pList.uid == member.uid || groupInfo.uid == member.uid}">
			<div class="post_info">
				<span>게시물 식별자 : ${pList.postId}</span><br> <span>게시물 작성자
					아이디 : ${pList.uid}</span><br> <span>게시물 작성자 닉네임 :
					${pList.nickname}</span><br> <span>게시물 내용: ${pList.content}</span><br>
				<span>게시물 공개수준: ${pList.openness}</span><br> <span> 게시물
					좋아요 수: ${pList.likeCount}
					<button type="button" class="likeBtn" post-idx="${pList.postId}">추천</button>
				</span><br> <span>게시물 작성날짜: ${pList.postedDate}</span><br> <span>댓글수
					: ${pList.replyCount}</span><br>
				<form action="/group/home">
					<span> 해시태그 : <c:forEach items="${tagList}" var="tList">
							<c:if test="${tList.postId == pList.postId}">
								<span>${tList.tagName}</span>
							</c:if>
						</c:forEach>
					</span>
				</form>
				<div class="postAttach_info">
					<c:forEach items="${postImageList}" var="pIList">
						<c:if test="${pIList.postId == pList.postId}">
							<img src="${contextPath}/resources/${pIList.filePath}"
								style="width: 100px; height: 100px">
						</c:if>
					</c:forEach>
				</div>
			</div>
			<div class="postBtn_wrap">
				<button type="button" class="postUpdateBtn">게시물 수정</button>
				<button type="button" class="postDeleteBtn"
					post-idx="${pList.postId}">게시물 삭제</button>
			</div>
			<!-- 게시물 수정 모달창 -->
			<div class="postUpdate_modal">
				<div class="postUpdate_content">
					<form class="postUpdateForm" method="post">
						<h3>게시물 수정</h3>
						<input type="hidden" name="postId" class="postId"
							value="${pList.postId}">
						<textarea name="content" class="content" placeholder="내용">${pList.content}</textarea>
						<br> 해시태그<br> <label><input type="radio"
							name="openness" class="openness" value="0"
							<c:if test="${pList.openness == 0}">checked</c:if> />전체</label> <label><input
							type="radio" name="openness" class="openness" value="1"
							<c:if test="${pList.openness == 1}">checked</c:if> />회원</label> <label><input
							type="radio" name="openness" class="openness" value="2"
							<c:if test="${pList.openness == 2}">checked</c:if> />그룹</label> <label><input
							type="radio" name="openness" class="openness" value="3"
							<c:if test="${pList.openness == 3}">checked</c:if> />나만</label><br>
						이미지 파일 업로드
						<hr>
						<div class="attach_wrap">
							<label for="files" class="inputFilesBtn">+</label> <input
								type="file" name="files" id="files" multiple accept=".jpg, .png">
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
							<li class="replyInfo"><input type="hidden" name="postId"
								class="postId" value="${rList.postId}"> <input
								type="hidden" name="replyId" class="replyId"
								value="${rList.replyId}"> <span>${rList.nickname}</span><br>
								<textarea name=replyContent class="replyContent" readonly>${rList.replyContent}</textarea>
								<button type="button" class="replyUpdateBtn">댓글 수정</button>
								<button type="button" class="replyDeleteBtn">댓글 삭제</button>
								<div class="replyUpdateBtn_wrap" style="display: none">
									<button type="button" class="replyUpdateCancleBtn">취소</button>
									<button type="button" class="replyUpdateFinBtn">완료</button>
								</div></li>
						</c:if>
					</c:forEach>
				</ul>
				<!-- 댓글 작성 -->
				<div class="replyWrite_wrap">
					<input type="hidden" name="postId" class="postId"
						value="${pList.postId}"> <input type="text" name="uid"
						class="uid" placeholder="작성자"> <input type="text"
						name="replyContent" class="replyContent" placeholder="댓글을 입력해주세요.">
					<button type="button" class="replyWriteBtn">등록</button>
				</div>
				<!-- // 댓글 작성 -->
			</div>
			<!-- // 댓글 목록 -->
			<hr>
		</c:if>
	</c:when>
</body>
</html>