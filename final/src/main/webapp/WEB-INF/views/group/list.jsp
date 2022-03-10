<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>그룹 목록</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>

<body>
	<h1>그룹 목록 페이지</h1>
	<div>
		<a href="/group/create">그룹생성</a>
		<hr>
	</div>
	<div>
		<h3>카테고리 목록</h3>
		<ul>
			<c:forEach items="${categoryList}" var="cList">
				<li>
					<c:out value="${cList.categoryId}" />
					:
					<c:out value="${cList.categoryName}" />
				</li>
			</c:forEach>
		</ul>
	</div>
	<hr>
	<div class="groupList">
		<h3>그룹 목록</h3>
		<ul>
			<c:forEach items="${groupList}" var="gList">
				<li>
					<a href="/group/home?groupId=${gList.groupId}">
						<c:choose>
							<c:when test="${gList.groupImagePath == null or gList.groupImagePath == ''}">
								<img src="/images/group_image_file/basic.png" style="width: 100px; height: 100px">
							</c:when>
							<c:otherwise>
								<img src="${gList.groupImagePath}" style="width: 100px; height: 100px">
							</c:otherwise>
						</c:choose>
						<c:out value="${gList.categoryId}" /> : <c:out value="${gList.groupName}" />
					</a>
				</li>
			</c:forEach>
		</ul>
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