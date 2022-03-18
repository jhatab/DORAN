<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<div class="category_wrap">

	<div class="category_list">
		<h3>카테고리 목록</h3>
		<ul>

			<c:forEach items="${categoryList}" var="cList">
				<input class="category_btn" type="button" value="${cList.categoryName}" onclick="categoryDeleteBtn(${cList.categoryId})" />
			</c:forEach>
		</ul>
		<div class="create_btn">
			<button type="button" onclick="location.href='/category/create'">카테고리 생성</button>
		</div>
	</div>

</div>


<!-- script -->
<script>
		$(document).ready(function() {

			/* ALERT */
			const result = '<c:out value="${result}"/>';

			if (result === "category create success") {
				alert("카테고리 생성이 완료되었습니다.");
			} else if (result === "category delete success") {
				alert("카테고리 삭제되었습니다.");
			}

		});

		/* 카테고리 삭제 */
		function categoryDeleteBtn(categoryId) {
			var chk = confirm("정말 삭제하시겠습니까?");
			if (chk) {
				location.href='/category/remove.do?categoryId='+ categoryId;
			}
		};
	</script>