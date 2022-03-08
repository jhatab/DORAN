<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>채팅하기</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style>
	.me {
		color: green;
	}
</style>
</head>
<body>

	<h1>채팅하기</h1>
	<input type="hidden" id="sessionId" value="">

	<div>
		<span>방번호 : ${roomInfo.roomId}</span>
	</div>

	<ul id="chating">
		<c:forEach items="${chatMsgList}" var="cmList">
			<c:choose>
				<c:when test="${cmList.uid == member.uid}">
					<li class="me">나 : ${cmList.message}</li>
				</c:when>
				<c:otherwise>
					<li class="others">${cmList.nickname} : ${cmList.message}</li>
				</c:otherwise>
			</c:choose>
		</c:forEach>
	</ul>

	<hr>

	<div id="yourMsg">
		<span>메시지</span>
		<span><input id="chatting" placeholder="보내실 메시지를 입력하세요."></span>
		<span><button onclick="send()" id="sendBtn">보내기</button></span>
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
			msgInserteData.message = $("#chatting").val();
			
			$.ajax({
				url: '/chat/msgInsert.do',
				type: 'post',
				data: msgInserteData,
				success: function(result){
					$('#chatting').val("");
				}
			});
		}
		
		$("#sendBtn").on("click", function() {
			msgInsert();
		});
		
		/* 웹소켓 채팅 */
		var ws;

		$(document).ready(function() {
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
							$("#chating").append(
									"<li class='me'>나 :" + d.msg + "</li>");
						} else {
							$("#chating").append(
									"<li class='others'>" + d.userName + " :"
											+ d.msg + "</li>");
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
				msg : $("#chatting").val()
			}
			ws.send(JSON.stringify(option))
		}
		
	</script>

</body>
</html>