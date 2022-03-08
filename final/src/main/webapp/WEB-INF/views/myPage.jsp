<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>My Page</h1>
	<div>
		<input type="button" id="category" value="관심 주제" /> <input
			type="button" id="group" value="가입한 그룹" /> <input type="button"
			id="user" value="회원 정보" />
	</div>

	<div>
		<div id="userInfo">
			<%-- <div>
				<span>${member.image}</span>
			</div> --%>
			<div>
				<span>${member.nickname}</span>
			</div>
		</div>

		<div id="categoryList">
			<span>${member.nickname}님의 관심 주제</span> <span>관심이 있는 주제를
				선택해주세요 또는 최대 5개까지 선택이 가능합니다.</span>

			<div>
				<%-- <%@ include file="category/list.jsp"%> --%>
				<c:forEach items="${categoryList}" var="cList">
					<input type="button" value="${cList.categoryName}" />
				</c:forEach>
			</div>
		</div>

		<div id="groupList">
			<span>가입한 그룹</span>
			<c:forEach items="${groupList}" var="gList">
				<div>${gList.groupName}
					<a href="/group/home?groupId=${gList.groupId}"> 
						<input type="button" value="들어가기" />
					</a>
				</div>
			</c:forEach>

			<br>

		</div>

		<div id="userList">
			<%@ include file="user/list.jsp"%>
		</div>
	</div>

	<script type="text/javascript">
		$(document).ready(function() {

			$("#userInfo").show();
			$("#categoryList").hide();
			$("#groupList").hide();
			$("#userList").hide();

			$("#category").click(function() {
				$("#userInfo").hide();
				$("#categoryList").show();
				$("#groupList").hide();
				$("#userList").hide();
			});

			$("#group").click(function() {
				$("#userInfo").hide();
				$("#categoryList").hide();
				$("#groupList").show();
				$("#userList").hide();
			});

			$("#user").click(function() {
				$("#userInfo").hide();
				$("#categoryList").hide();
				$("#groupList").hide();
				$("#userList").show();
			});


		});
	</script>

</body>
</html>