<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 로그인</title>
</head>
<body>
<h1>관리자 로그인</h1>
<hr>
<form action="${pageContext.request.contextPath}/Admin/login" method="post">
<table border="1" cellpadding="0" cellspacing="0">

	<tr>
		<td bgcolor="orange">아이디</td>
		<td><input type="text" name="adm_id" /></td>
	</tr>
	<tr>
		<td bgcolor="orange">비밀번호</td>
		<td><input type="password" name="adm_pw" /></td>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<input type="submit" value="로그인" />
		</td>
	</tr>
</table>
</form>
</body>
</html>