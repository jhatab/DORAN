<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
request.setCharacterEncoding("UTF-8");
%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 목록</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="/css/search.css">
</head>
<body>
	<!-- 검색 form -->
	<form role="form" method="get">
		<table>
			<tr>
				<th>태그 번호</th>
				<th>태그 명칭</th>
			</tr>

			<c:forEach items="${tagList}" var="tagList">
				<tr>
					<td>${tagList.tagId}</td>
					<td>${tagList.tagName}</td>
				</tr>
			</c:forEach>
		</table>

		<div class="search">
			<input type="text" name="keyword" id="keywordInput" value="${scri.keyword}"/>
			<button id="searchBtn" type="button">검색</button>
			<script>
				$(function(){
					$('#searchBtn').click(function() {
					self.location = "tagList" + '${paging.makeQuery(1)}' + "&keyword=" + encodeURIComponent($('#keywordInput').val());
					});
				});   
			</script>
		</div>

		<div>
			<div>전체 태그 수: ${tagListCount}</div>

			<ul class="paging">
				<c:if test="${paging.prev}">
					<span><a href='<c:url value="/tag/tagList${paging.makeSearch(paging.startPage-1)}"/>'>이전</a></span>
				</c:if>
				<c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="num">
					<span><a href='<c:url value="/tag/tagList${paging.makeSearch(num)}"/>'>${num}</a></span>
				</c:forEach>
				<c:if test="${paging.next && paging.endPage>0}">
					<span><a href='<c:url value="/tag/tagList${paging.makeSearch(paging.endPage + 1)}"/>'>다음</a></span>
				</c:if>
			</ul>
		</div>
	</form>
	
	<div class="Search_area">
                    <div class="Search_list">
                        <div class="Search_result">
                            <div class="Search_img"><img src="/images/ex1.jpg" /></div>
                            <div class="Search_content">
                                <div class="Content_header">
                                    <img src="/images/chatbot.png" />
                                    <h1>Lorem Insum</h1>
                                    <span>2022-02-23</span>
                                    <div class="search_like_view">
                                        <img src="/images/like.png" />
                                        <span>13</span>
                                    </div>
                                </div>
                                <div class="Content_body"><span>{message}</span></div>
                            </div>
                        </div>
                       </div>
                       </div>

</body>
</html>