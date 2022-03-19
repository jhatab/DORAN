<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<script src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css" />

<div class="container">
	<div class="subnav">
		<div class="tab">
			<ul class="tabnav">
				<li>
					<a href="#tab01">추천순</a>
				</li>
				<li>
					<a href="#tab02">최신순</a>
				</li>
			</ul>
			<div class="group_more">
				<button class="group_btn" type="button" onclick="location.href='/group/list'">더보기</button>
			</div>
	
			<script>
				$(function($) {
					$('.tabcontent > div').hide();
					$('.tabnav a').click(
							function() {
								$('.tabcontent > div').hide().filter(this.hash)
										.fadeIn();
								$('.tabnav a').removeClass('active');
								$(this).addClass('active');
								return false;
							}).filter(':eq(0)').click();
				});
	
				$(document).ready(function() {
					$('.slider').slick({
						infinite : false,
						slidesToShow : 4,
						slidesToScroll : 1,
					});
				});
			</script>
	
			<div class="tabcontent">
				<div id="tab01">
					<div class="slider">
	
						<c:forEach items="${groupLikeList}" var="gLikeList">
	
							<div class="group_img">
								<c:choose>
									<c:when test="${gLikeList.groupImagePath == null or gLikeList.groupImagePath == ''}">
										<img src="/images/group_image_file/basic.png">
									</c:when>
									<c:otherwise>
										<img src="${gLikeList.groupImagePath}">
									</c:otherwise>
								</c:choose>
								<div class="group_name">
									<a href="/group/home?groupId=${gLikeList.groupId}">
										<span>${gLikeList.groupName}</span>
									</a>
								</div>
							</div>
	
						</c:forEach>
	
					</div>
				</div>
	
				<div id="tab02">
					<div class="slider">
	
						<c:forEach items="${groupList}" var="gList">
	
							<div class="group_img">
								<img src="${gList.groupImagePath}">
								<div class="group_name">
									<a href="/group/home?groupId=${gList.groupId}"> <span>${gList.groupName}</span>
									</a>
								</div>
							</div>
	
						</c:forEach>
					</div>
	
				</div>
			</div>
		</div>
	</div>
	<div class="content_wrap">
		<div class="contents">
			<ul class="tabs">
				<c:forEach items="${categoryList}" var="cList">
					<li category="category${cList.categoryId}">${cList.categoryName}</li>
				</c:forEach>
			</ul>
	
			<script type="text/javascript">
				$(document).ready(function() {
					$(".panel").show();
					
					$(".contents ul li").click(function(e) {
						e.preventDefault();
	
						// active
						var idx = $(this).index();
						$(".contents ul li").removeClass("active");
						$(".contents ul li").eq(idx).addClass("active");
	
						// 제품 분류
						var filters = $(this).attr("category");
						$(".panelList .panel").hide();
						$(".panelList div[class*=" + filters + "]").show();
					});
				});
			</script>
			<div class="content_box">
			<div class="panelList">
				<c:forEach items="${postList}" var="pList" begin="1" step="2">
					<div class="panel category${pList.categoryId}"
						onclick="location.href='/group/home?groupId=${pList.groupId}#post${pList.postId}'" style="width:416px;">
						
							<div class="content_list">
							<div class="uid">
							<p>${pList.nickname}</p></div>
								<div class="text_box">
									<p>${pList.content}</p>
								</div>
								<div class="like_view">
									<img src="${gList.filePath}"> <img alt="like"
										src="/images/like.png"> <span>${pList.likeCount}</span>
								</div>
								<div class="content_img">
									<c:forEach items="${mainPostImageList}" var="mPIList">
										<c:if test="${mPIList.postId == pList.postId}">
											<img src="${mPIList.filePath}">
										</c:if>
									</c:forEach>
								</div>
								<div class="comment_view">
									<span>${pList.postedDate}&nbsp;</span> <span>&nbsp;Comment
										${pList.replyCount}</span>
								</div>
							</div>
						</div>
					
				</c:forEach>
			</div>
			
			<div class="panelList">
				<c:forEach items="${postList}" var="pList" begin="0" step="2">
					<div class="panel category${pList.categoryId}"
						onclick="location.href='/group/home?groupId=${pList.groupId}#post${pList.postId}'" style="width:416px;">
							<div class="content_list">
							<div class="uid">
							<p>${pList.nickname}</p></div>
								<div class="text_box">
									<p>${pList.content}</p>
									
								</div>
								<div class="like_view">
									<img src="${gList.filePath}"> <img alt="like"
										src="/images/like.png"> <span>${pList.likeCount}</span>
								</div>
								<div class="content_img">
									<c:forEach items="${mainPostImageList}" var="mPIList">
										<c:if test="${mPIList.postId == pList.postId}">
											<img src="${mPIList.filePath}">
										</c:if>
									</c:forEach>
								</div>
								<div class="comment_view">
									<span>${pList.postedDate}&nbsp;</span> <span>&nbsp;Comment
										${pList.replyCount}</span>
								</div>
							</div>
						</div>
				</c:forEach>
			</div>
			</div>
		</div>
	</div>
</div>
