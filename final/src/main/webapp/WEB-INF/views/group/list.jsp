<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>그룹 목록</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="/css/groupList.css">
</head>

<body>
	<div class="groupCreate_wrap">
	<div class="groupContent">
	
	<div>
	<div class="groupCreacte_btn">
		<button type="button" onclick="location.href='/group/create'">그룹생성</button>
	</div>
		<h3>카테고리 목록</h3>
		
		<div class="category_wrap">
			<c:forEach items="${categoryList}" var="cList">
			<label class="category_btn"><input type="radio" name="category" value="${cList.categoryId}"><span>${cList.categoryName}</span></label>
			</c:forEach>
		</div>
		
	</div>
<hr>
<h3>내 그룹</h3>
	<div class="groupList">
		<ul>
			<c:forEach items="${groupList}" var="gList">
				<li>
					<a href="/group/home?groupId=${gList.groupId}">
						<c:choose>
							<c:when test="${gList.groupImagePath == null or gList.groupImagePath == ''}">
								<img src="${contextPath}/resources/images/group_image_file/basic.png" style="width: 200px; height: 300px">
							</c:when>
							<c:otherwise>
								<img src="${contextPath}/resources/${gList.groupImagePath}" style="width: 200px; height: 300px">
							</c:otherwise>
						</c:choose><br>
						<c:out value="${gList.groupName}" />
					</a>
				</li>
			</c:forEach>
		</ul>
	</div>
	</div>
	</div>
	
	<!-- script -->
	<script>
	$(document).ready(function() {
		
		/* ALERT */
		const result = '<c:out value="${result}"/>';

		if (result === "group create success") {
			alert("그룹 생성이 완료되었습니다.");
		} else if (result === "group delete success") {
			alert("그룹이 삭제되었습니다.");
		}
		
	});
	</script>

</body>
</html>