<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<c:forEach items="${searchGroupList}" var="gList">
	<div>
		<span>${gList.groupName}</span>
		<c:choose>
			<c:when test="${gList.groupImagePath == null or gList.groupImagePath == ''}">
				<img src="/images/group_image_file/basic.png" style="width: 100px; height: 100px;">
			</c:when>
			<c:otherwise>
				<img src="${gList.groupImagePath}" style="width: 100px; height: 100px;">
			</c:otherwise>
		</c:choose>
	</div>
</c:forEach>

<hr>

<c:forEach items="${searchPostList}" var="pList">
	<div>
		<span>${pList.content}</span>
	</div>
</c:forEach>
