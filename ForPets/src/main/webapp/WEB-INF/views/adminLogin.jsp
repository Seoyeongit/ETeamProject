<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${pageContext.request.contextPath}/resources/css/login.css"
	rel="stylesheet" />
<title>관리자 로그인</title>
</head>
<body>
	<center>
		<button type="button" class="loginimg"
			onclick="location.href='${pageContext.request.contextPath}/rofstep';"></button>
		<form action="${pageContext.request.contextPath}/Admin/login"
			method="post">
			<div class="userlog-tx">관리자 로그인</div>
			<div class="loginform">
				<div>
					<input type="text" class="idbox" name="adm_id" placeholder="아이디" />
				</div>
				<div>
					<input type="password" class="pwbox" name="adm_pw"
						placeholder="비밀번호" />
				</div>
				<div class="login-con">
					<input type="submit" class="loginbox" value="로그인" />
				</div>
			</div>
		</form>
	</center>
</body>
</html>