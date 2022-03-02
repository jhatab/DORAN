<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
 
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

<%
  request.setCharacterEncoding("UTF-8");
%>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 수정창</title>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
  <script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
<style>
   .text_center{
     text-align:center;
   }
</style>
</head>
<body>
	<form action="/user/update.do" method="post" >
		<table>
			<tr>
		      <td><label for="text">회원 아이디</label></td>
		      <td><input type="text" id="uid" name="uid" readonly="readonly" value="${member.uid}"></td>
		   </tr>
		   <tr>
		      <td><label for="upass">회원 암호</label></td>
		      <td><input type="text" id="upass" name="upass" value="${member.upass}"></td>
		   </tr>
		   <tr>
		      <td><label for="name">회원 이름</label></td>
		      <td><input type="text" id="name" name="name" value="${member.name}"></td>
		   </tr>
		   <tr>
		      <td><label for="birthDate">회원 생년월일</label></td>
		      <td><input type="date" id="birthDate" name="birthDate" value="${member.birthDate}"></td>
		   </tr>
		   <tr>
		      <td><label for="gender">회원 성별</label></td>
		      <td>
		      	<label><input type="radio" name="gender" value="0" <c:if test="${member.gender == 0}">checked</c:if>/>선택 안 함</label>
				<label><input type="radio" name="gender" value="1" <c:if test="${member.gender == 1}">checked</c:if>/>여성</label>
				<label><input type="radio" name="gender" value="2" <c:if test="${member.gender == 2}">checked</c:if>/>남성</label>
		      </td>
		   </tr>
		   <tr>
		      <td><label for="nickname">회원 별명</label></td>
		      <td><input type="text" id="nickname" name="nickname" value="${member.nickname}"></td>
		   </tr>
		   <tr>
		      <td><label for="email">회원 이메일</label></td>
		      <td><input type="text" id="email" name="email" value="${member.email}"></td>
		   </tr>
		   <tr>
		      <td><label for="address">회원 주소</label></td>
		      <td><input type="text" id="address" name="address" value="${member.address}"></td>
		   </tr>
		  
		    <tr>
				<td><p>&nbsp;</p></td>
				<td>
					<input type="submit" value="수정하기">
		       		<input type="reset" value="다시입력">
		       	</td>
		    </tr>
		</table>
	</form>
</body>
</html>