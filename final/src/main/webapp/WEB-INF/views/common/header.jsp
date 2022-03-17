<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="header_wrap">
	<div class="header_bar">
		<div class="logo">
			<a href="/main"><img class="logo_img" src="/images/logo.png" /></a>
		</div>
		
		<form class="searchForm" action="/search/result">
			<div class="search_bar">
				<img class="search_icon" src="/images/search.png" />
				<input class="search_box" type="text" name="keyword" placeholder="Keyword Search" autocomplete="off"/>
				<button>검색</button>
			</div>
		</form>
		
		<div class="menu">
			<c:if test="${member != null}">
				<c:if test="${unNoticeCnt > 0}">
					<span class="unNoticeCnt">${unNoticeCnt}</span>
				</c:if>
				<button class="alarm_btn"><img src="/images/bell.png" /></button>
				<div class="alarm_list_wrap">
					<h3>새 소식</h3>
					<div class="alarm_list">
						<c:forEach items="${noticeList}" var="nList">
							<p class="notice_info">
								<input type="hidden" class="groupId" value="${nList.groupId}">
								<input type="hidden" class="postId" value="${nList.postId}">
								<a 
									<c:if test="${nList.noticeType == 'reply' or nList.noticeType == 'like'}">
										href="${contextPath}/group/home?groupId=${nList.groupId}#post${nList.postId}"
									</c:if>
									<c:if test="${nList.noticeType == 'join'}">
										href="${contextPath}/group/setting?groupId=${nList.groupId}"
									</c:if>
									<c:if test="${nList.noticeType == 'approval'}">
										href="${contextPath}/group/home?groupId=${nList.groupId}"
									</c:if>
									<c:if test="${nList.noticeType == 'cancle'}">
										href="javascript:location.reload()"
									</c:if>
										notice-idx="${nList.noticeId}">
									<span class="msg"  title="${nList.noticeMsg}">${nList.noticeMsg}</span>
									<span class="date">${nList.noticeDate}</span>
									<span class="_date" style="display: none;">${nList.noticeDate}</span>
									<%-- <button type="button" class="noticeDeleteBtn" notice-idx="${nList.noticeId}">
										<img src="/images/close.png">
									</button> --%>
								</a>
							</p>
						</c:forEach>
						<p class="alarmNone">새 소식이 없습니다.</p>
					</div>
				</div>
			</c:if>
			
			<c:if test="${member == null}">
				<div class="loginBtn_wrap">
					<span class="login_btn"><a href="/user/login">로그인</a></span>
				</div>
			</c:if>
			
			<c:if test="${member != null}">
				<div class="mypageBtn_wrap">
					<span class="nickname">${member.nickname}</span>
					<span class="mypageBtn"><a href="/mypage/${member.uid}">마이페이지</a></span>
					<c:if test="${member.authority == 1}">
						<span><a href="/category/list">카테고리</a></span>
					</c:if>
					<span class="logoutBtn"><a href="/user/logout.do">로그아웃</a></span>
				</div>
			</c:if>
		</div>
	</div>
</div>

<!-- script -->
<script>
	
	$(".alarm_btn").click(function(e){
		 e.stopPropagation();
		$(".alarm_list_wrap").slideToggle("fast");
	});
	
	$(document).click(function(){
	    $('.alarm_list_wrap').slideUp("fast");
	});
	
	const noticeCount = document.querySelectorAll(".notice_info"); // 알림 수
	
	/* 알림 확인 */
	const noticeReadData = {
		noticeId : '',
	}
	
	for (let i = 0; i < noticeCount.length; i++) {
		var groupId = $(".notice_info .groupId").eq(i).val();	
		var postId = $(".notice_info .postId").eq(i).val();
		
		/* $(".noticeDeleteBtn").eq(i).on("click", function(e) {
			e.preventDefault();
			noticeReadData.noticeId = $(this).attr("notice-idx");
			
			alert("afsdf");
			
			$.ajax({
				url: '/noticeRead.do',
				type: 'post',
				data: noticeReadData,
				success: function(result){
				}
			});
		}); */
		
		$(".notice_info a").eq(i).on("click", function(e) {
			e.preventDefault();
			noticeReadData.noticeId = $(this).attr("notice-idx");
			
			$.ajax({
				url: '/noticeRead.do',
				type: 'post',
				data: noticeReadData,
				success: function(result){
					var tmp = $(".notice_info a").eq(i).attr("href");
					window.location = tmp;
				}
			});
		});
	}
	
	/* 알림이 없을 경우 */
	const isNoticeInfo = document.querySelectorAll('.notice_info');
	
	if(isNoticeInfo.length <= 0) {
		document.querySelector(".alarmNone").style.display = 'block';
	}
	
	/* 알림 시간 포맷 */
	const noticeDate = document.querySelectorAll(".notice_info ._date");
	const today = new Date();
	
	for(let i=0; i < noticeDate.length; i++){
		let nDate = new Date(noticeDate[i].textContent);
		let diffHour = (today.getTime() - nDate.getTime()) / (1000 * 60 * 60);
		
		$(function() {
 			var time1 = noticeDate[i].innerText.substr(5, 2);
 			var time2 = noticeDate[i].innerText.substr(8, 2);
 			var time3 = noticeDate[i].innerText.substr(11, 2);
 			var time4 = noticeDate[i].innerText.substr(14, 2);
 			
 			if(isNaN(diffHour) == true) {
 				$(".notice_info .date").eq(i).text();
 			} else if(diffHour < 24 && diffHour) {
 				if(time3 * 1 >= 0 && time3 * 1 < 12) {
 					var time3F = time3 * 1;
 					if(time3F == 0) {
 						time3F = 12;
 					}
		 			$(".notice_info .date").eq(i).text("오전 " + time3F + ":" + time4);
 				} else {
 					var time3F = (time3 * 1) - 12;
		 			$(".notice_info .date").eq(i).text("오후 " + time3F + ":" + time4);
 				}
 			} else {
	 			$(".notice_info .date").eq(i).text(time1 + "월 " + time2 + "일");
 			}
 		});
	}
</script>