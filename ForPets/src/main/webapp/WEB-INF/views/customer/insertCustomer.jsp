<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의 글 쓰기</title>
</head>
<body>
<center>
	<h2>문의 글 쓰기</h2>
	<hr>
	<br>
	<form action="insertCustomer.do" method="post">
	<table>
		<tr>
			<td>게시글 번호</td>
			<td>${ customer.cust_no}</td>
		</tr>
		<tr>
			<td>제목</td>
			<td><input type="text" id="title" name="title"></td>
		</tr>
		<tr>
			<td>내용</td>
			<td><input type="text" id="content" name="content"></td>
		</tr>
		<tr>
			<td>사용자</td>
			<td>${ customer.user_id }</td>
		</tr>
		<tr>
			<td>날짜</td>
			<td>${ customer.cust_date}</td>
		</tr>
		<button type="submit" id="cheke" name="cheke">확인</button>
	</table>
	</form>
	<hr>
	<br>
		<a href="getCustomerList.do">취소</a>
</center>
</body>
</html>