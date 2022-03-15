<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<head>
	<meta charset="UTF-8">
	<title>채팅방</title>
	
	<!-- css -->
	<link rel="stylesheet" href="/css/chat/room.css">
	
	<!-- script -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>

<body>
	
	<div class="chat_wrap">
		<div class="chat_header">
			<span>Messages</span>
			<button class="chatCloseBtn"><img src="/images/close.png"></button>
		</div>
		
		<div class="chat_list">
			<ul>
				<c:forEach items="${chatRoomList}" var="crList">
					<li>
						<a href="/chat/message?roomId=${crList.roomId}">
							<c:choose>
					        	<c:when test="${member.uid == crList.uid1}">
					        		<c:choose>
										<c:when test="${crList.profileImg2 == null or crList.profileImg2 == ''}">
											<img src="/images/chatbot.png"/>
										</c:when>
										<c:otherwise>
											<img src="${crList.profileImg2}">
										</c:otherwise>
									</c:choose>
									<div>
										<span class="nickname">${crList.nickname2}</span>
										<span class="_recentTime" style="display: none;">${crList.recentTime}</span>
										<span class="recentTime">${crList.recentTime}</span>
										<span class="recentMsg">${crList.recentMsg}</span>
									</div>
					        	</c:when>
					        	<c:otherwise>
					        		<c:choose>
										<c:when test="${crList.profileImg1 == null or crList.profileImg1 == ''}">
											<img src="/images/chatbot.png"/>
										</c:when>
										<c:otherwise>
											<img src="${crList.profileImg1}">
										</c:otherwise>
									</c:choose>
									<div>
										<span class="nickname">${crList.nickname1}</span>
										<span class="_recentTime" style="display: none;">${crList.recentTime}</span>
										<span class="recentTime">${crList.recentTime}</span>
										<span class="recentMsg">${crList.recentMsg}</span>
									</div>
					        	</c:otherwise>
					        </c:choose>
						</a>
					</li>
				</c:forEach>
			</ul>
		</div>
	</div>
	
	<!-- script -->
	<script>
		$(".chatCloseBtn").on("click", function() {
			parent.chatCloseFunc();
		});
		
		/* 채팅 시간 포맷 */
		const chatDate = document.querySelectorAll("._recentTime");
		const today = new Date();
		
		for(let i=0; i < chatDate.length; i++){
			let cDate = new Date(chatDate[i].textContent);
			let diffHour = (today.getTime() - cDate.getTime()) / (1000 * 60 * 60);
			
// 			alert(diffHour);
			
			$(function() {
	 			var time1 = chatDate[i].innerText.substr(5, 2);
	 			var time2 = chatDate[i].innerText.substr(8, 2);
	 			var time3 = chatDate[i].innerText.substr(11, 2);
	 			var time4 = chatDate[i].innerText.substr(14, 2);
	 			
	 			if(isNaN(diffHour) == true) {
	 				$(".recentTime").eq(i).text();
	 			} else if(diffHour < 24 && diffHour) {
	 				if(time3 * 1 >= 0 && time3 * 1 < 12) {
	 					var time3F = time3 * 1;
	 					if(time3F == 0) {
	 						time3F = 12;
	 					}
			 			$(".recentTime").eq(i).text("오전 " + time3F + ":" + time4);
	 				} else {
	 					var time3F = (time3 * 1) - 12;
			 			$(".recentTime").eq(i).text("오전 " + time3F + ":" + time4);
	 				}
	 			} else {
		 			$(".recentTime").eq(i).text(time1 + "월 " + time2 + "일");
	 			}
	 		});
		}
	</script>

</body>
