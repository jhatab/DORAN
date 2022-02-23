<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>그룹 페이지</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>

<body>
	<h1>그룹 페이지</h1>
	<hr>
	<div>
		<c:choose>
			<c:when test="${groupInfo.groupImagePath == null or groupInfo.groupImagePath == ''}">
				<img src="${contextPath}/resources/group_image_file/basic.png" style="width: 100px; height: 100px">
			</c:when>
			<c:otherwise>
				<img src="${contextPath}/resources/${groupInfo.groupImagePath}" style="width: 100px; height: 100px">
			</c:otherwise>
		</c:choose>
		<span>그룹 식별자 : ${groupInfo.groupId}</span><br>
		<span>그룹명 : ${groupInfo.groupName}</span><br>
		<span>그룹소개 : ${groupInfo.groupIntro}</span><br>
		<span>그룹 관리자 : ${groupInfo.uid}</span>
		<div class="groupBtn_wrap">
			<button type="button" class="groupUpdateBtn">그룹 수정</button>
			<button type="button" class="groupDeleteBtn">그룹 삭제</button>
		</div>
		<form id="groupForm" method="get">
			<input type="hidden" name="groupId" value="${groupInfo.groupId}">
		</form>
	</div>
	<hr>
	
	<!-- script -->
	<script>
	$(document).ready(function() {
		
		/* ALERT */
		const result = '<c:out value="${result}"/>';

		if (result === "group update success") {
			alert("그룹 수정이 완료되었습니다.");
		} else if (result === "feed create success") {
			alert("피드 작성이 완료되었습니다.");
		} else if (result === "feed delete success") {
			alert("피드가 삭제되었습니다.");
		}
		
	});
		
	/* 그룹 수정 버튼 */
	$(".groupUpdateBtn").on("click", function() {
		$("#groupForm").attr("action", "/group/update");
		$("#groupForm").submit();
	});
	
	/* 그룹 삭제 버튼 */
	$(".groupDeleteBtn").on("click", function() {
		if (confirm("정말 삭제하시겠습니까?") == true){
			$("#groupForm").attr("action", "/group/remove.do");
			$("#groupForm").attr("method", "post");
			$("#groupForm").submit();
		} else {
			return false;
		}
	});
	</script>
</body>
</html>