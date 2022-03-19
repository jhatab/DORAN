<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<div class="container">

	<h1>검색 결과</h1>

	<div class="search_filter_wrap">
		<ul>
			<li class="active">그룹</li>
			<li>피드</li>
			<li>태그</li>
		</ul>
	</div>

	<div class="result_wrap">
		<!-- 그룹 -->
		<div class="group_wrap active">
			<ul>
				<c:forEach items="${searchGroupList}" var="gList">
					<li class="group_info">
						<a href="/group/home?groupId=${gList.groupId}">
							<c:choose>
								<c:when test="${gList.groupImagePath == null or gList.groupImagePath == ''}">
									<img src="/images/group_image_file/basic.png">
								</c:when>
								<c:otherwise>
									<img src="${gList.groupImagePath}">
								</c:otherwise>
							</c:choose>
							<span>${gList.groupName}</span>
						</a>
					</li>
				</c:forEach>
			</ul>
			<div class="searchNone">
				검색 결과가 없습니다.
			</div>
		</div>

		<!-- 피드 내용 -->
		<div class="feed_wrap">
			<div>
				<c:forEach items="${searchPostList}" var="pList" begin="0" step="2">
					<a href="/group/home?groupId=${pList.groupId}#post${pList.postId}">
						<div class="feed_info">
							<div class="top_wrap">
								<c:choose>
									<c:when test="${pList.profileImg == null or pList.profileImg == ''}">
										<img src="/images/chatbot.png" class="uImage">
									</c:when>
									<c:otherwise>
										<img src="${pList.profileImg}" class="uImage">
									</c:otherwise>
								</c:choose>
								<span class="nickname">${pList.nickname}</span>
								<fmt:parseDate var="dateString" value="${pList.postedDate}" pattern="yyyy-MM-dd HH:mm:ss" />
								<span class="date"><fmt:formatDate value="${dateString}" pattern="yyyy/MM/dd HH:mm" /></span>
								<span class="cnt_wrap">
									<span>
										<img alt="reply" src="/images/reply.png" class="replyImg"/>
										<span class="cnt">${pList.replyCount}</span>
									</span>
									<span>
										<img alt="reply" src="/images/like.png" class="likeImg"/>
										<span class="cnt">${pList.likeCount}</span>
									</span>
								</span>
							</div>
							<div class="middle_wrap">
								<span>${pList.content}</span>
							</div>
							<div class="bottom_wrap">
								<c:forEach items="${searchPostImageList}" var="iList">
									<c:if test="${pList.postId == iList.postId}">
										<img src="${iList.filePath}" style="width: 100px; height: 100px;">
									</c:if>
								</c:forEach>
							</div>
						</div>
					</a>
				</c:forEach>
			</div>
			<div>
				<c:forEach items="${searchPostList}" var="pList" begin="1" step="2">
					<a href="/group/home?groupId=${pList.groupId}">
						<div class="feed_info">
							<div class="top_wrap">
								<c:choose>
									<c:when test="${pList.profileImg == null or pList.profileImg == ''}">
										<img src="/images/chatbot.png" class="uImage">
									</c:when>
									<c:otherwise>
										<img src="${pList.profileImg}" class="uImage">
									</c:otherwise>
								</c:choose>
								<span class="nickname">${pList.nickname}</span>
								<fmt:parseDate var="dateString" value="${pList.postedDate}" pattern="yyyy-MM-dd HH:mm:ss" />
								<span class="date"><fmt:formatDate value="${dateString}" pattern="yyyy/MM/dd HH:mm" /></span>
								<span class="cnt_wrap">
									<span>
										<img alt="reply" src="/images/reply.png" />
										<span class="cnt">${pList.replyCount}</span>
									</span>
									<span>
										<img alt="reply" src="/images/like.png" />
										<span class="cnt">${pList.likeCount}</span>
									</span>
								</span>
							</div>
							<div class="middle_wrap">
								<span>${pList.content}</span>
							</div>
							<div class="bottom_wrap">
								<c:forEach items="${searchPostImageList}" var="iList">
									<c:if test="${pList.postId == iList.postId}">
										<img src="${iList.filePath}">
									</c:if>
								</c:forEach>
							</div>
						</div>
					</a>
				</c:forEach>
			</div>
			<div class="searchNone">
				검색 결과가 없습니다.
			</div>
		</div>

		<!-- 피드 태그 -->
		<div class="tag_wrap">
			<div>
				<c:forEach items="${searchTagList}" var="tList" begin="0" step="2">
					<a href="/group/home?groupId=${tList.groupId}#post${tList.postId}">
						<div class="tag_info">
							<div class="top_wrap">
								<c:choose>
									<c:when test="${tList.profileImg == null or tList.profileImg == ''}">
										<img src="/images/chatbot.png" class="uImage">
									</c:when>
									<c:otherwise>
										<img src="${tList.profileImg}" class="uImage">
									</c:otherwise>
								</c:choose>
								<span class="nickname">${tList.nickname}</span>
								<fmt:parseDate var="dateString" value="${tList.postedDate}" pattern="yyyy-MM-dd HH:mm:ss" />
								<span class="date"><fmt:formatDate value="${dateString}" pattern="yyyy/MM/dd HH:mm" /></span>
								<span class="cnt_wrap">
									<span>
										<img alt="reply" src="/images/reply.png" class="replyImg"/>
										<span class="cnt">${tList.replyCount}</span>
									</span>
									<span>
										<img alt="reply" src="/images/like.png" class="likeImg"/>
										<span class="cnt">${tList.likeCount}</span>
									</span>
								</span>
							</div>
							<div class="middle_wrap">
								<span>${tList.content}</span>
							</div>
							<div class="middle2_wrap">
								<c:forEach items="${tagList}" var="tagList">
									<c:if test="${tList.postId == tagList.postId}">
										<span>#${tagList.tag}</span>
									</c:if>
								</c:forEach>
							</div>
							<div class="bottom_wrap">
								<c:forEach items="${searchPostImageList}" var="iList">
									<c:if test="${tList.postId == iList.postId}">
										<img src="${iList.filePath}" style="width: 100px; height: 100px;">
									</c:if>
								</c:forEach>
							</div>
						</div>
					</a>
				</c:forEach>
			</div>
			<div>
				<c:forEach items="${searchTagList}" var="tList" begin="1" step="2">
					<a href="/group/home?groupId=${tList.groupId}">
						<div class="tag_info">
							<div class="top_wrap">
								<c:choose>
									<c:when test="${tList.profileImg == null or tList.profileImg == ''}">
										<img src="/images/chatbot.png" class="uImage">
									</c:when>
									<c:otherwise>
										<img src="${tList.profileImg}" class="uImage">
									</c:otherwise>
								</c:choose>
								<span class="nickname">${tList.nickname}</span>
								<fmt:parseDate var="dateString" value="${tList.postedDate}" pattern="yyyy-MM-dd HH:mm:ss" />
								<span class="date"><fmt:formatDate value="${dateString}" pattern="yyyy/MM/dd HH:mm" /></span>
								<span class="cnt_wrap">
									<span>
										<img alt="reply" src="/images/reply.png" />
										<span class="cnt">${tList.replyCount}</span>
									</span>
									<span>
										<img alt="reply" src="/images/like.png" />
										<span class="cnt">${tList.likeCount}</span>
									</span>
								</span>
							</div>
							<div class="middle_wrap">
								<span>${tList.content}</span>
							</div>
							<div class="middle2_wrap">
								<c:forEach items="${tagList}" var="tagList">
									<c:if test="${tList.postId == tagList.postId}">
										<span>#${tagList.tag}</span>
									</c:if>
								</c:forEach>
							</div>
							<div class="bottom_wrap">
								<c:forEach items="${searchPostImageList}" var="iList">
									<c:if test="${tList.postId == iList.postId}">
										<img src="${iList.filePath}">
									</c:if>
								</c:forEach>
							</div>
						</div>
					</a>
				</c:forEach>
			</div>
			<div class="searchNone">
				검색 결과가 없습니다.
			</div>
		</div>
		
	</div>

</div>

<script>
	$(".search_filter_wrap ul li").click(function() {
		var idx = $(this).index();
		$(".search_filter_wrap ul li").removeClass("active");
		$(".search_filter_wrap ul li").eq(idx).addClass("active");
		$(".result_wrap > div").removeClass("active");
		$(".result_wrap > div").eq(idx).addClass("active");
	});
	
	/* 검색 결과X */
	const isGroupInfo = document.querySelectorAll(".group_info");
	const isfeedInfo = document.querySelectorAll(".feed_info");
	const isTagInfo = document.querySelectorAll(".tag_info");

	if(isGroupInfo.length <= 0) {
		document.querySelector(".group_wrap .searchNone").style.display = 'block';
	}
	
	if(isfeedInfo.length <= 0) {
		document.querySelector(".feed_wrap .searchNone").style.display = 'block';
	}
	
	if(isTagInfo.length <= 0) {
		document.querySelector(".tag_wrap .searchNone").style.display = 'block';
	}
</script>
