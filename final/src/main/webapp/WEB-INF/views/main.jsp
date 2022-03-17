<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script
	src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<link rel="stylesheet" href="/css/main.css" />
<link rel="stylesheet"
	href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
<link rel="stylesheet"
	href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css" />
<body>
	<div class="subnav">
		<div class="tab">
			<ul class="tabnav">
				<li><a href="#tab01">추천순</a></li>
				<li><a href="#tab02">최신순</a></li>
			</ul>
			
			<script>
				$(function($) {
					$('.tabcontent > div').hide();
					$('.tabnav a').click(
						function() {
							$('.tabcontent > div').hide().filter(this.hash).fadeIn();
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
						<div class="tab_top">
							<c:forEach items="${groupLikeList}" var="gLikeList">
								<a href="/group/home?groupId=${gLikeList.groupId}">
									<div class="group_img">
										<img src="${gLikeList.groupImagePath}">
										<div class="group_name">
											<span>${gLikeList.groupName}</span>
										</div>
									</div>
								</a>
							</c:forEach>
						</div>
					</div>
				</div>

				<div id="tab02">
					<div class="slider">
						<div class="tab_top">
							<c:forEach items="${groupList}" var="gList">
								<a href="/group/home?groupId=${gList.groupId}">
									<div class="group_img">
										<img src="${gList.groupImagePath}">
										<div class="group_name">
											<span>${gList.groupName}</span>
										</div>
									</div>
								</a>
							</c:forEach>
						</div>
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

			<div class="panelList">
				<c:forEach items="${postList}" var="pList">
					<div class="panel category${pList.categoryId}"
						onclick="location.href='/group/home?groupId=${pList.groupId}'">
						<div class="content_box">
							<div class="content_list">
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
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
</body>
</html>