<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<div class="container">
	<div class="group_wrap">
		<div class="groupContent">
			<!-- 그룹 생성 버튼 -->
			<div class="groupCreacte_btn">
				<h3>그룹 목록</h3>
				<button type="button" onclick="location.href='/group/create'">그룹 만들기</button>
			</div>
			
			<!-- 카테고리 선택  -->
			<div class="category_wrap">
				<ul>
					<c:forEach items="${categoryList}" var="cList">
						<li category="category${cList.categoryId}">${cList.categoryName}</li>
					</c:forEach>
				</ul>
			</div>
			
			<!-- 그룹 목록 -->
			<div class="groupList">
				<ul>
					<c:forEach items="${groupList}" var="gList">
						<li class="group category${gList.categoryId}">
							<a href="/group/home?groupId=${gList.groupId}">
								<c:choose>
									<c:when test="${gList.groupImagePath == null or gList.groupImagePath == ''}">
										<img src="/images/group_image_file/basic.png">
									</c:when>
									<c:otherwise>
										<img src="${gList.groupImagePath}">
									</c:otherwise>
								</c:choose>
								<div><c:out value="${gList.groupName}" /></div>
							</a>
						</li>
					</c:forEach>
				</ul>
			</div>
			
		</div>
	</div>
</div>

<!-- script -->
<script>
	$(document).ready(function() {

		/* ALERT */
		const result = '<c:out value="${result}"/>';

		if (result === "group create success") {
			alert("그룹 생성이 완료되었습니다.");
		} else if (result === "group delete success") {
			alert("그룹이 삭제되었습니다.");
		}

	});
	
	// 카테고리 필터
	$(document).ready(function () {
	  $(".category_wrap ul li").click(function(e) {
	    e.preventDefault();

	    // active
	    var idx = $(this).index();
	    $(".category_wrap ul li").removeClass("active");
	    $(".category_wrap ul li").eq(idx).addClass("active");

	    // 제품 분류
	    var filters = $(this).attr("category");
	    $(".groupList .group").hide();
	    $(".groupList ul li[class*=" + filters + "]").show();
	  });
	});
	
	$(".groupCreacte_btn h3").click(function(e) {
		location.reload();
	});
	
	
</script>