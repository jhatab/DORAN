<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<head>
	<meta charset="UTF-8">
	<title>채팅</title>
	
	<!-- css -->
	<link rel="stylesheet" href="/css/chat/message.css">
	
	<!-- script -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>

<body>
	<input type="hidden" id="sessionId" value="">	
	<div class="chat_wrap">
		<div class="chat_header">
	        <img src="/images/left.png"/ class="backImg">
	        <c:choose>
	        	<c:when test="${member.uid == roomInfo.uid1}">
					<span>${roomInfo.nickname2}</span>
	        	</c:when>
	        	<c:otherwise>
					<span>${roomInfo.nickname1}</span>
	        	</c:otherwise>
	        </c:choose>
	        <button class="chatCloseBtn"><img src="/images/close.png"></button>
	    </div>
	    
	    <div id="chatting">
	    	<c:forEach items="${chatMsgList}" var="cmList">
				<c:choose>
					<c:when test="${cmList.uid == member.uid}">
						<div class="sender_right_wrap">
					        <div class="sender_right">
					            <span>${cmList.nickname}</span>
					            <c:choose>
									<c:when test="${cmList.profileImg == null or cmList.profileImg == ''}">
										<img src="/images/chatbot.png"/>
									</c:when>
									<c:otherwise>
										<img src="${cmList.profileImg}">
									</c:otherwise>
								</c:choose>
					        </div>
					        <div class="balloon_right">
					        	<span>${cmList.message}</span>
					        </div>
					    </div>
					</c:when>
					<c:otherwise>
					<div class="sender_wrap">
				        <div class="sender">
				        	<c:choose>
									<c:when test="${cmList.profileImg == null or cmList.profileImg == ''}">
										<img src="/images/chatbot.png"/>
									</c:when>
									<c:otherwise>
										<img src="${cmList.profileImg}">
									</c:otherwise>
								</c:choose>
				            <span>${cmList.nickname}</span>
				        </div>
				        <div class="balloon">
				        	<span>${cmList.message}</span>
				        </div>
				    </div>
					</c:otherwise>
				</c:choose>
			</c:forEach>
	    </div>
	    
	    <div class="chat_input">
	        <input type="text" id="chatInput" autocomplete="off">
	        <img alt="보내기" src="/images/icon-send.png" id="sendBtn" onclick="send()">
	    </div>
	</div>
	
	<!-- script -->
	<script>
		/* 메시지 저장 */
		const msgInserteData = {
			roomId : '',
			uid : '',
			message : '',
		}
		
		function msgInsert() {
			msgInserteData.roomId = "${roomInfo.roomId}";
			msgInserteData.uid = "${member.uid}";
			msgInserteData.message = $("#chatInput").val();
			
			if(msgInserteData.message == '') {
				alert("메시지를 입력해주세요.");
				return false;
			}
			
			$.ajax({
				url: '/chat/msgInsert.do',
				type: 'post',
				data: msgInserteData,
				success: function(result){
					$('#chatInput').val("");
				}
			});
		}
		
		$("#sendBtn").on("click", function() {
			msgInsert();
		});
		
		/* 웹소켓 채팅 */
		var ws;

		$(document).ready(function() {
			$("#chatting").scrollTop($("#chatting")[0].scrollHeight);
			wsOpen();
		});

		function wsOpen() {
			ws = new WebSocket("ws://" + location.host + "/chating/${roomInfo.roomId}");
			wsEvt();
		}

		function wsEvt() {
			ws.onopen = function(data) {
				//소켓이 열리면 초기화 세팅하기
			}

			ws.onmessage = function(data) {
				//메시지를 받으면 동작
				var msg = data.data;
				if (msg != null && msg.trim() != '') {
					var d = JSON.parse(msg);
					if (d.type == "getId") {
						var si = d.sessionId != null ? d.sessionId : "";
						if (si != '') {
							$("#sessionId").val(si);
						}
					} else if (d.type == "message") {
						if (d.sessionId == $("#sessionId").val()) {
							var msgMe = '<div class="sender_right_wrap">';
							msgMe += '<div class="sender_right">';
							msgMe += '<span>' + d.userName + '</span>';
							
							if('${member.profileImg}' == null || '${member.profileImg}' == '') {
								msgMe += '<img src="/images/chatbot.png"/>';
							} else {
								msgMe += '<img src="${member.profileImg}"/>';
							}
							
							msgMe += '</div>';
							msgMe += '<div class="balloon_right">';
							msgMe += '<span>' + d.msg + '</span>';
							msgMe += '</div>';
							msgMe += '</div>';
							$("#chatting").append(msgMe);
							$("#chatting").scrollTop($("#chatting")[0].scrollHeight);
							
						} else {
							var msgYou = '<div class="sender_wrap">';
							msgYou += '<div class="sender">';
							
							if(d.profileImg == null || d.profileImg == '') {
								msgYou += '<img src="/images/chatbot.png"/>';
							} else {
								msgYou += '<img src="' + d.profileImg + '"/>';
							}
							
							msgYou += '<span>' + d.userName + '</span>';
							msgYou += '</div>';
							msgYou += '<div class="balloon">';
							msgYou += '<span>' + d.msg + '</span>';
							msgYou += '</div>';
							msgYou += '</div>';
							$("#chatting").append(msgYou);
							$("#chatting").scrollTop($("#chatting")[0].scrollHeight);
						}

					} else {
						console.warn("unknown type!")
					}
				}
			}

			document.addEventListener("keypress", function(e) {
				if (e.keyCode == 13) { //enter press
					msgInsert();
					send();
				}
			});
		}
		
		function send() {
			var option = {
				type : "message",
				sessionId : $("#sessionId").val(),
				userName : "${member.nickname}",
				profileImg : "${member.profileImg}",
				msg : $("#chatInput").val()
			}
			
			if(option.msg == '') {
				return false;
			}
			
			ws.send(JSON.stringify(option))
		}
		
		$(".chatCloseBtn").on("click", function() {
			parent.chatCloseFunc();
		});

		function sleep (ms) {
			var start = new Date().getTime();
			while (new Date().getTime() < start + ms);
		}
		
		$(".chat_header .backImg").on("click", function() {
			location.reload();
			sleep(10);
			$(location).attr('href','${contextPath}/chat/room?uid=${member.uid}');
		});
	</script>

</body>
