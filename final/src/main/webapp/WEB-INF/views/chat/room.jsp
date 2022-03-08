<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Room</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>

	<h1>${member.uid} 채팅방</h1>

	<ul>
		<c:forEach items="${chatRoomList}" var="crList">
			<li>
				<a href="/chat/message?roomId=${crList.roomId}">
					<span> 방번호 : ${crList.roomId} : ${crList.uid1} - ${crList.uid2}</span><br>
				</a>
			</li>
		</c:forEach>
	</ul>
	
</body>
</html>