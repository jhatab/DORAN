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
	<c:if test="${member.uid == groupInfo.uid}">
		<div class="groupBtn_wrap">
			<button type="button" class="groupUpdateBtn">그룹 수정</button>
			<button type="button" class="groupDeleteBtn">그룹 삭제</button>
		</div>
		<form id="groupForm" method="get">
			<input type="hidden" name="groupId" value="${groupInfo.groupId}">
		</form>
	</c:if>
	
	<!-- 가입 회원 목록 -->
	<c:choose>
		<%-- 관리자 --%>
		<c:when test="${member.uid == groupInfo.uid}">
			<table border="1">
				<tr>
					<th>번호</th>
					<th>닉네임</th>
					<th>가입일</th>
					<th>가입상태</th>
					<th>*</th>
				</tr>
				<c:forEach items="${groupMemberList}" var="mList" varStatus="status">
					<tr class="member_Info">
						<td><c:out value="${status.index + 1}" /></td>
						<td class="nickname"><c:out value="${mList.nickname}" /></td>
						<td><c:out value="${mList.joinDate}" /></td>
						<td>
							<c:if test="${mList.isApproval == 2}">관리자</c:if>
							<c:if test="${mList.isApproval == 1}">회원</c:if>
							<c:if test="${mList.isApproval == 0}">가입대기</c:if>
						</td>
						<td>
							<c:if test="${mList.isApproval == 2}">-</c:if>
							<c:if test="${mList.isApproval == 1}">
								<button class="joinKickBtn" member-id="${mList.uid}">퇴출</button>
							</c:if>
							<c:if test="${mList.isApproval == 0}">
								<button class="joinApprovalBtn" member-id="${mList.uid}">승인</button>
								<button class="joinCancleBtn" member-id="${mList.uid}">취소</button>
							</c:if>
						</td>
					</tr>
				</c:forEach>
			</table>
		</c:when>
		<%-- 그룹원 --%>
		<c:otherwise>
			<table border="1">
				<tr>
					<th>번호</th>
					<th>닉네임</th>
					<th>가입일</th>
					<th>가입상태</th>
				</tr>
				<c:forEach items="${groupMemberList}" var="mList" varStatus="status">
					<c:if test="${mList.isApproval != 0}">
						<tr class="member_Info">
							<td><c:out value="${status.index + 1}" /></td>
							<td class="nickname"><c:out value="${mList.nickname}" /></td>
							<td><c:out value="${mList.joinDate}" /></td>
							<td>
								<c:if test="${mList.isApproval == 2}">관리자</c:if>
								<c:if test="${mList.isApproval == 1}">회원</c:if>
								<c:if test="${mList.isApproval == 0}">가입대기</c:if>
							</td>
						</tr>
					</c:if>
				</c:forEach>
			</table>
		</c:otherwise>
	</c:choose>
	
	<!-- 그룹 탈퇴 (관리자는 X) -->
	<c:if test="${member.uid != groupInfo.uid}">
		<button class="groupResignBtn" member-id="${member.uid}">탈퇴하기</button>
	</c:if>
	
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
		
		/* ========== 그룹 가입 ========== */
		
		const memberCount = document.querySelectorAll(".member_Info"); // 회원 수
		
		/* 가입 승인 */
		const memberJoinData = {
			groupId : '',
			uid : '',
		}
		
		for (let i = 0; i < memberCount.length; i++) {
			$(".joinApprovalBtn").eq(i).on("click", function() {
				memberJoinData.groupId = ${groupInfo.groupId};
				memberJoinData.uid = $(this).attr("member-id");
				
				$.ajax({
					url: '/group/memberApproval.do',
					type: 'post',
					data: memberJoinData,
					success: function(result){
						alert("가입 승인되었습니다.");
						window.location.reload();
					}
				});
			});
		}
		
		/* 가입 취소 */
		for (let i = 0; i < memberCount.length; i++) {
			$(".joinCancleBtn").eq(i).on("click", function() {
				memberJoinData.groupId = ${groupInfo.groupId};
				memberJoinData.uid = $(this).attr("member-id");
				
				$.ajax({
					url: '/group/memberCancle.do',
					type: 'post',
					data: memberJoinData,
					success: function(result){
						alert("가입 취소되었습니다.");
						window.location.reload();
					}
				});
			});
		}
		
		/* 가입 퇴출 */
		for (let i = 0; i < memberCount.length; i++) {
			$(".joinKickBtn").eq(i).on("click", function() {
				memberJoinData.groupId = ${groupInfo.groupId};
				memberJoinData.uid = $(this).attr("member-id");
				
				$.ajax({
					url: '/group/memberCancle.do',
					type: 'post',
					data: memberJoinData,
					success: function(result){
						alert("회원이 퇴출되었습니다.");
						window.location.reload();
					}
				});
			});
		}
		
		/* 그룹 탈퇴 */
		$(".groupResignBtn").on("click", function() {
			memberJoinData.groupId = ${groupInfo.groupId};
			memberJoinData.uid = $(this).attr("member-id");
			
			$.ajax({
				url: '/group/memberCancle.do',
				type: 'post',
				data: memberJoinData,
				success: function(result){
					alert("그룹을 탈퇴했습니다.");
					window.location.reload();
				}
			});
		});
		
	</script>
</body>
</html>