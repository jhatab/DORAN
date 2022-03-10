<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="header_wrap">
	<div class="header_bar">
		<!-- 로고 -->
		<div class="logo">
			<a href="/main"><img class="logo_img" src="/images/logo.png" /></a>
		</div>
		<!-- 검색 -->
		<div class="search_bar">
			<img class="search_icon" src="/images/search.png" />
			<input class="search_box" type="text" placeholder="Keyword Search" />
		</div>
		<!-- 유틸메뉴 -->
		<div class="menu">
			<ul class="menu_btn">
				<li>
					<img class="alarm_btn" src="/images/bell.png" />
				</li>
				<li class="login_btn">
					<c:if test="${member == null}">
						<a href="/user/login">로그인</a>
					</c:if>
				</li>
			</ul>
		</div>
	</div>
</div>