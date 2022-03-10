<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<header>
		<h1><a href="/main">도란도란</a></h1>
		
		<c:if test="${member == null}">
			<div class="login_button">
				<a href="/user/login">로그인</a>
			</div>
		</c:if>
		<c:if test="${member != null}">
			<div class="login_button">
				<span>${member.nickname}</span>
				<a href="/myPage">마이페이지</a>
				<a href="/user/list.do">회원 정보</a>
				<a href="/user/update.do">정보수정</a>
				<a href="/user/logout.do">로그아웃</a>
			</div>
		</c:if>
	</header>
	
	<hr>
<div class="tab">
<ul class="tabnav">
<li><a href="#tab01">탭1</a></li>
<li><a href="#tab02">탭2</a></li>
</ul>
<div class="tabcontent">
<div id="tab01">tab1 content</div>
<div id="tab02">tab2 content</div>
</div>
</div><!--tab-->

<script>
$(function(){
$('.tabcontent > div').hide();
$('.tabnav a').click(function () {
$('.tabcontent > div').hide().filter(this.hash).fadeIn();
$('.tabnav a').removeClass('active');
$(this).addClass('active');
return false;
}).filter(':eq(0)').click();
  });</script>
	
	
</body>
</html>