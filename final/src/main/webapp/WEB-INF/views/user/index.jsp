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
<meta charset="UTF-8" />
<title>헤더</title>
<script>
// 검색
	$(document).on('click', '#btnSearch', function(e){
		e.preventDefault();
		var url = "${pageContext.request.contextPath}/user/getSearchList";
		url = url + "&keyword=" + $('#keyword').val();
		location.href = url;
		console.log(url);
	});	
</script>

</head>
<body>
	<div>
		<h2>board list</h2>

		<!-- search{s} -->
		<div class="form-group row justify-content-center">
			<div class="w300" style="padding-right: 10px">
				<input type="text" class="form-control form-control-sm"	name="keyword" id="keyword">
				<button class="btn btn-sm btn-primary" name="btnSearch"	id="btnSearch">검색</button>
			</div>
		</div>
		<!-- search{e} -->
	</div>




	<table>
		<thead>
			<tr>
				<th>태그 명칭</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="tag" items="${tagList}">
				<tr>
					<td>${tag.tagName}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	</div>
</body>
</html>
