<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<div class="container">
	<div class="groupWrapper">
		<!-- Left Bar -->
		<div class="leftWrapper">
			<div class="groupPhoto">
				<c:choose>
					<c:when test="${groupInfo.groupImagePath == null or groupInfo.groupImagePath == ''}">
						<img src="/images/group_image_file/basic.png">
					</c:when>
					<c:otherwise>
						<img src="${groupInfo.groupImagePath}">
					</c:otherwise>
				</c:choose>
			</div>
			<div class="contents">
				<h3>${groupInfo.groupName}</h3>
				<p>${groupInfo.groupIntro}</p>
				<a href="/group/home?groupId=${groupInfo.groupId}" id="groupBtn">돌아가기</a>
			</div>
		</div>
		<!-- //Left Bar -->
		
		<!-- Main Contents -->
		<div class="mainWrap">
			<div class="btnWrap">
				<button type="button" class="groupUpdateBtn">수정하기</button>
				<button type="button" class="groupDeleteBtn">삭제하기</button>
			</div>
			<form id="groupForm" method="get">
				<input type="hidden" name="groupId" value="${groupInfo.groupId}">
			</form>
			
			<div class="memberWrap">
				<div class="upperWrap">
					<c:choose>
						<c:when test="${member.uid == groupInfo.uid}">
							<span>${groupMemberCnt} Members</span>
						</c:when>
						<c:otherwise>
							<span>${groupMemberCntB} Members</span>
						</c:otherwise>
					</c:choose>
				</div>
				<table>
					<tr>
						<th>#</th>
						<th>멤버</th>
						<th>활동</th>
						<th>가입일</th>
					</tr>
					<c:forEach items="${groupMemberList}" var="mList" varStatus="status">
						<c:choose>
							<c:when test="${member.uid == groupInfo.uid}">
								<tr class="member_Info">
									<td class="num"><c:out value="${status.index + 1}" /></td>
									<td class="user">
										<c:choose>
											<c:when test="${mList.profileImg == null or mList.profileImg == ''}">
												<img src="/images/chatbot.png"/>
											</c:when>
											<c:otherwise>
												<img src="${mList.profileImg}">
											</c:otherwise>
										</c:choose>
										<span class="nickname"><c:out value="${mList.nickname}" /></span>
									</td>
									<td class="activity">
										<span>피드<em>${mList.postCnt}</em></span>
										<span>댓글<em>${mList.replyCnt}</em></span>
									</td>
									<fmt:parseDate var="dateString" value="${mList.joinDate}" pattern="yyyy-MM-dd HH:mm:ss" />
									<td class="date"><fmt:formatDate value="${dateString}" pattern="yyyy-MM-dd HH:mm"/></td>
									<td class="chat">
										<c:if test="${member.uid != mList.uid}">
											<button class="chatRoomBtn" member-id="${mList.uid}"><img src="/images/icon-chat.png">채팅</button>
										</c:if>
									</td>
									<td class="action">
										<c:if test="${member.uid == groupInfo.uid}">
											<c:if test="${mList.isApproval == 1}">
												<button class="joinKickBtn" member-id="${mList.uid}"><img src="/images/icon-cancle.png">퇴출</button>
											</c:if>
											<c:if test="${mList.isApproval == 0}">
												<button class="joinApprovalBtn" member-id="${mList.uid}"><img src="/images/icon-approved.png">승인</button>
												<button class="joinCancleBtn" member-id="${mList.uid}"><img src="/images/icon-cancle.png">취소</button>
											</c:if>
										</c:if>
									</td>
								</tr>
							</c:when>
							<c:otherwise>
								<c:if test="${mList.isApproval != 0}">
									<tr class="member_Info">
										<td class="num"><c:out value="${status.index + 1}" /></td>
										<td class="user">
											<c:choose>
												<c:when test="${mList.profileImg == null or mList.profileImg == ''}">
													<img src="/images/chatbot.png"/>
												</c:when>
												<c:otherwise>
													<img src="${mList.profileImg}">
												</c:otherwise>
											</c:choose>
											<span class="nickname"><c:out value="${mList.nickname}" /></span>
										</td>
										<td class="activity">
											<span>피드<em>${mList.postCnt}</em></span>
											<span>댓글<em>${mList.replyCnt}</em></span>
										</td>
										<fmt:parseDate var="dateString" value="${mList.joinDate}" pattern="yyyy-MM-dd HH:mm:ss" />
										<td class="date"><fmt:formatDate value="${dateString}" pattern="yyyy-MM-dd HH:mm"/></td>
										<td class="chat">
											<c:if test="${member.uid != mList.uid}">
												<button class="chatRoomBtn" member-id="${mList.uid}"><img src="/images/icon-chat.png">채팅</button>
											</c:if>
										</td>
										<td class="action">
											<c:if test="${member.uid == groupInfo.uid}">
												<c:if test="${mList.isApproval == 1}">
													<button class="joinKickBtn" member-id="${mList.uid}"><img src="/images/icon-cancle.png">퇴출</button>
												</c:if>
												<c:if test="${mList.isApproval == 0}">
													<button class="joinApprovalBtn" member-id="${mList.uid}"><img src="/images/icon-approved.png">승인</button>
													<button class="joinCancleBtn" member-id="${mList.uid}"><img src="/images/icon-cancle.png">취소</button>
												</c:if>
											</c:if>
										</td>
									</tr>
								</c:if>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</table>
				<c:if test="${member.uid != groupInfo.uid}">
					<button class="groupResignBtn" member-id="${member.uid}">탈퇴하기</button>
				</c:if>
			</div>
		</div>
		<!-- //Main Contents -->
	</div>
</div>
	
<!-- script -->
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
			if (confirm("회원을 퇴출하시겠습니까?") == true) {
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
			} else {
				return false;
			}
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
	
	/* ========== 채팅 ========== */
	
	/* 채팅방 생성 */
	const chatRoomData = {
		uid1 : '',
		uid2 : '',
	}
	
	for (let i = 0; i < memberCount.length; i++) {
		$(".chatRoomBtn").eq(i).on("click", function() {
			chatRoomData.uid1 = "${member.uid}";
			chatRoomData.uid2 = $(this).attr("member-id");
			
			$.ajax({
				url: '${contextPath}/chat/roomCreate.do',
				type: 'post',
				data: chatRoomData,
				success: function(result){
					$('#frame').attr('src', "${contextPath}/chat/room?uid=${member.uid}");
					$(".chatting").css("display", "block");
				}
			});
		});
	}
	
</script>
