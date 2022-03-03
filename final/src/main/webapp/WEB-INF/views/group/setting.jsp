<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>그룹설정</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>

<body>
	<h1>그룹 설정</h1>
	<hr>
	<div class="groupBtn_wrap">
		<button type="button" class="groupUpdateBtn">그룹 수정</button>
		<button type="button" class="groupDeleteBtn">그룹 삭제</button>
	</div>
	<form id="groupForm" method="get">
		<input type="hidden" name="groupId" value="${groupInfo.groupId}">
	</form>
	
	<script>
		$(document).ready(function() {
		
			/* ALERT */
			const result = '<c:out value="${result}"/>';
	
			if (result === "group update success") {
				alert("그룹 수정이 완료되었습니다.");
			}
			
		});
		
		/*========== 그룹 ==========/ */
		
		/* 그룹 수정 */
		$(".groupUpdateBtn").on("click", function() {
			$("#groupForm").attr("action", "/group/update");
			$("#groupForm").submit();
		});
		
		/* 그룹 삭제 */
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