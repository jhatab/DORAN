<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/header.css">
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
              <li ><img class="alarm_btn" src="/images/bell.png" /></li>
             <li class="login_btn"><c:if test = "${member == null }"><a href="/user/login">로그인</a></c:if></li>
            </ul>
          </div>
        </div>
        </div>
</body>
</html>