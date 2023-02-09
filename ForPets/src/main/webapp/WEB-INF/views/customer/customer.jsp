<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>forpets 고객센터</title>
</head>
<body>
<center>
	<h2>ForPets 고객센터</h2>
	<hr>
	
	<h4>자주 묻는 질문</h4>
	
	
	<div>검색<input type="text"></div>
	
	<br>
	<hr>
	<form action="/customer.do" method="post">
	<table>
		<tr>
			<th>회원</th>
			<th>파트너</th>
		</tr>
		<br>
		<tr>
			<td><a href="getCustomerList">질문글</a></td>
			<td><a href="getCustomerList">질문글</a></td>
		</tr>
		<tr>
			<td><a href="getCustomerList">질문글</a></td>
			<td><a href="getCustomerList">질문글</a></td>
		</tr>
		<tr>
			<td><a href="getCustomerList">질문글</a></td>
			<td><a href="getCustomerList">질문글</a></td>
		</tr>
		<tr>
			<td><a href="getCustomerList">질문글</a></td>
			<td><a href="getCustomerList">질문글</a></td>
		</tr>
		
	</table>
	</form>
	<button type="submit" onclick="location.href='myCustBoard.do'" name="myCust">내 문의 내역</button>
	<button type="submit" onclick="location.href='customerBoard.do'" name="customerBoard" >문의 글 쓰기</button>
</center>
</body>
</html>