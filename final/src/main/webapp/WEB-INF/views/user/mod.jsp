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
	<form action="/user/update">
		<table>
			<tr>
		      <td><label for="text">회원 아이디</label></td>
		      <td><input type="text" id="uid" name="uid" readonly="readonly" value="${user.uid}"></td>
		   </tr>
		   <tr>
		      <td><label for="upass"></label></td>
		      <td><input type="text" id="upass" name="upass" value="${user.upass}"></td>
		   </tr>
		   <tr>
		      <td><label for="name"></label></td>
		      <td><input type="text" id="name" name="name" value="${user.name}"></td>
		   </tr>
		   <tr>
		      <td><label for="birthDate"></label></td>
		      <td><input type="date" id="birthDate" name="birthDate" value="${user.birthDate}"></td>
		   </tr>
		   <tr>
		      <td><label for="gender"></label></td>
		      <td><input type="number" id="gender" name="gender" value="${user.gender}"></td>
		   </tr>
		   <tr>
		      <td><label for="nickname"></label></td>
		      <td><input type="text" id="nickname" name="nickname" value="${user.nickname}"></td>
		   </tr>
		   <tr>
		      <td><label for="email"></label></td>
		      <td><input type="text" id="email" name="email" value="${user.email}"></td>
		   </tr>
		   <tr>
		      <td><label for="address"></label></td>
		      <td><input type="text" id="address" name="address" value="${user.address}"></td>
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