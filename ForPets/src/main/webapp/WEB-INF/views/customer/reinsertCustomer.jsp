<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객센터 문의 글 댓글</title>
</head>
<body>
	<form action="">
		<table>
			<tr>
				<td>제목</td>
				<td><input type="text" id="title"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea name="content" cols="40" rows="10"></textarea></td>
			</tr>
			<tr>
				<td>날짜</td>
				<td>${ customer_re.re_date }</td>
			</tr>
		</table>
	</form>
</body>
</html>