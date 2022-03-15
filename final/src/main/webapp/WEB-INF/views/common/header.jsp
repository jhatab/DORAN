<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="header_wrap">
	<div class="header_bar">
		<div class="logo">
			<a href="/main"><img class="logo_img" src="/images/logo.png" /></a>
		</div>
		<div class="search_bar">
			<img class="search_icon" src="/images/search.png" />
			<input class="search_box" type="text" placeholder="Keyword Search" />
		</div>
		<div class="menu">
			<c:if test="${member != null}">
				<button class="alarm_btn"><img src="/images/bell.png" /></button>
				<div class="alarm_list_wrap">
					<h3>새 소식</h3>
					<div class="alarm_list">
						<p><a href="#">Lorem Insum</a></p>
						<p><a href="#">Lorem Insum</a></p>
						<p><a href="#">Lorem Insum</a></p>
						<p><a href="#">Lorem Insum</a></p>
						<p><a href="#">Lorem Insum</a></p>
						<p><a href="#">Lorem Insum</a></p>
						<p><a href="#">Lorem Insum</a></p>
						<p><a href="#">Lorem Insum</a></p>
						<p><a href="#">Lorem Insum</a></p>
						<p><a href="#">Lorem Insum</a></p>
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
					<span>${member.nickname}</span>
					<span><a href="/mypage/${member.uid}">마이페이지</a></span>
					<span><a href="/user/logout.do">로그아웃</a></span>
				</div>
			</c:if>
		</div>
	</div>
</div>

<!-- script -->
<script>
	
	$(".alarm_btn").click(function(){
		$(".alarm_list_wrap").slideToggle("fast");
	});
	
</script>