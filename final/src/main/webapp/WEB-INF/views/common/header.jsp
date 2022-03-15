<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/header.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
<div class="header_wrap">
        <div class="header_bar">
          <div class="logo">
            <a href="/main"><img class="logo_img" src="/images/logo.png" /></a>
          </div>
          <div class="search_bar">
          <img class="search_icon" src="/images/search.png"/>
              <input class="search_box" type="text" placeholder="Keyword Search" />
          </div>
          <div class="menu">
            <ul class="menu_btn">
              <li ><div class="alert_wrap">
  <ul class="tab">
    <li rel="content"><img class="alarm_btn" src="/images/bell.png"/></li>
  </ul>
  <div class="tab_con">
    <div id="content" class="tab_content">
      <ul>
       <li><h3>알림</h3></li>
        <li><span>Lorem Insum</span></li>
        <li><span>Lorem Insum</span></li>
        <li><span>Lorem Insum</span></li>
        <li><span>Lorem Insum</span></li>
        <li><span>Lorem Insum</span></li>
      </ul>
    </div>
  </div>
</div></li>
             <c:if test="${member == null}"><li class="login_btn"><a href="/user/login">로그인</a></li></c:if>
             <c:if test="${member != null}">
			<li class="login_btn">
				<a href="#">${member.nickname}</a>
				<ul class="login_menu">
				<li><a href="/myPage">마이페이지</a></li>
				<li><a href="/user/list.do">회원 정보</a></li>
				<li><a href="/user/update.do">정보수정</a></li>
				<li><a href="/user/logout.do">로그아웃</a></li>
				</ul>
			</li>
		</c:if>
            </ul>
          </div>
        </div>
        </div>
        
        <script>
        $(document).ready(function(){
    $(".tab_content").hide();
    $(".tab li").hover(function(){
      $("ul.tab li").removeClass("active");
      $(this).addClass("active");
      $(".tab_content").hide();
      var activeTab = $(this).attr("rel");
      $("#"+activeTab).fadeIn();

    },function(){
      var activeTab = $(this).attr("rel");
      $("#"+activeTab).hide();
      $("#"+activeTab).hover(function(){
        $("#"+activeTab).show();
      }, function(){
        $("#"+activeTab).hide();
      });

    });
  });
        </script>
</body>
</html>