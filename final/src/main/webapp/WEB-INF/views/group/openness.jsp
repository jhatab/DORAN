<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<div class="post_info" id="post${pList.postId}">

	<div class="middleWrapper">
		<div class="groupFeedUpper">
			<div class="userId">
				<c:choose>
					<c:when test="${pList.profileImg == null or pList.profileImg == ''}">
						<img src="/images/chatbot.png">
					</c:when>
					<c:otherwise>
						<img src="${pList.profileImg}">
					</c:otherwise>
				</c:choose>
				<p>${pList.nickname}</p>
				<p class="uid" style="display: none;">${pList.uid}</p>
				<fmt:parseDate var="dateString" value="${pList.postedDate}" pattern="yyyy-MM-dd HH:mm:ss" />
				<span><fmt:formatDate value="${dateString}" pattern="yyyy/MM/dd HH:mm" /></span>
				<input type="hidden" name="toUid" class="toUid" value="${pList.uid}">
			</div>
			<div class="groupFeedMenu">
				<img alt="feed menu" src="/images/dots.png" />
				<div class="toggleMenu" style="display: none;">
					<button type="button" class="postUpdateBtn">수정</button>
					<button type="button" class="postDeleteBtn" post-idx="${pList.postId}">삭제</button>
				</div>
			</div>
		</div>

		<div class="middleContents">
			<textarea readonly>${pList.content}</textarea>
		</div>

		<div class="groupFeedLower">
			<div class="groupHash">
				<form action="/group/home">
					<c:forEach items="${tagList}" var="tList">
						<c:if test="${tList.postId == pList.postId}">
							<input type="hidden" name="groupId" value="${groupInfo.groupId}">
							<button type="submit" name="keyword" value="#${tList.tag}">#${tList.tag}</button>
						</c:if>
					</c:forEach>
				</form>
			</div>
			<div id="content">
				<span class="groupReply">
					<img alt="reply" src="/images/reply.png" />
					<span>${pList.replyCount}</span>
				</span>
				<span class="groupLike">
					<c:if test="${isApproval == '1'}">
						<img alt="like" src="/images/like.png" class="likeBtn" post-idx="${pList.postId}" />
					</c:if>
					<c:if test="${isApproval != '1'}">
						<img alt="like" src="/images/like.png">
					</c:if>						
					<span id="likeResult">${pList.likeCount}</span>
				</span>
			</div>
		</div>

		<div class="groupFeedImg">
			<c:forEach items="${postImageList}" var="pIList">
				<c:if test="${pIList.postId == pList.postId}">
					<a href="${pIList.filePath}" data-fancybox="postImg${pIList.postId}"><img src="${pIList.filePath}"></a>
				</c:if>
			</c:forEach>
		</div>
	</div>

	<div class="reply_wrap">
		<c:forEach items="${replyList}" var="rList">
			<c:if test="${rList.postId == pList.postId}">
				<div class="groupComment replyInfo">
					<input type="hidden" name="postId" class="postId" value="${rList.postId}">
					<input type="hidden" name="replyId" class="replyId" value="${rList.replyId}">
					<span class="uid" style="display: none;">${rList.uid}</span>
					<c:choose>
						<c:when test="${rList.profileImg == null or rList.profileImg == ''}">
							<img src="/images/chatbot.png">
						</c:when>
						<c:otherwise>
							<img src="${rList.profileImg}">
						</c:otherwise>
					</c:choose>
					<span>${rList.nickname}</span>
					<textarea name=replyContent class="replyContent" onkeyup="adjustTextarea();" readonly>${rList.replyContent}</textarea>
					<div class="groupReplyMenu">
						<img alt="reply menu" src="/images/dots.png" />
						<div class="toggleMenu" style="display: none;">
							<button type="button" class="replyUpdateBtn">수정</button>
							<button type="button" class="replyDeleteBtn">삭제</button>
							<div class="replyUpdateBtn_wrap" style="display: none">
								<button type="button" class="replyUpdateCancleBtn">취소</button>
								<button type="button" class="replyUpdateFinBtn">완료</button>
							</div>
						</div>
					</div>
				</div>
			</c:if>
		</c:forEach>
		<!-- 댓글 작성 -->
		<div class="replyWrite_wrap">
			<input type="hidden" name="postId" class="postId" value="${pList.postId}">
			<input type="hidden" name="uid" class="uid" value="${member.uid}">
			<input type="hidden" name="toUid" class="toUid" value="${pList.uid}">
			<input type="text" name="replyContent" class="replyContent" placeholder="댓글을 입력해주세요.">
			<button type="button" class="replyWriteBtn">등록</button>
		</div>
		<!-- // 댓글 작성 -->
	</div>
</div>
<!-- 게시물 수정 모달창 -->
<div class="postUpdate_modal">
	<div class="postUpdate_content">
		<form class="postUpdateForm" method="post">
			<input type="hidden" name="postId" class="postId" value="${pList.postId}" readonly>
			<label>
				<input type="radio" name="openness" class="openness" value="0" <c:if test="${pList.openness == 0}">checked</c:if> />
				<span>전체공개</span>
			</label>
			<label>
				<input type="radio" name="openness" class="openness" value="1" <c:if test="${pList.openness == 1}">checked</c:if> />
				<span>회원공개</span>
			</label>
			<label>
				<input type="radio" name="openness" class="openness" value="2" <c:if test="${pList.openness == 2}">checked</c:if> />
				<span>그룹공개</span>
			</label>
			<label>
				<input type="radio" name="openness" class="openness" value="3" <c:if test="${pList.openness == 3}">checked</c:if> />
				<span>나만보기</span>
			</label>
			<textarea name="content" class="content" placeholder="내용을 입력하세요.">${pList.content}</textarea>
			<input type="text" name="tag" class="tag" value="${pList.tag}" placeholder="해시태그를 입력하세요.(#태그 #태그 ...)" autocomplete="off">
			<!-- 이미지 파일 업로드 -->
			<div class="attach_wrap">
				<input type="file" name="files" id="files" multiple accept=".jpg, .png">
				<label for="files" class="inputFilesBtn">+</label>
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
