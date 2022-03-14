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
			<ul class="menu_btn">
				<li>
					<img class="alarm_btn" src="/images/bell.png" />
				</li>
				<c:if test="${member == null}">
					<li class="login_btn">
						<a href="/user/login">로그인</a>
					</li>
				</c:if>
				<c:if test="${member != null}">
					<li class="login_btn">
						<span>${member.nickname}</span>
						<a href="/mypage/${member.uid}">마이페이지</a>
						<a href="/user/logout.do">로그아웃</a>
					</li>
				</c:if>
			</ul>
		</div>
	</div>
</div>