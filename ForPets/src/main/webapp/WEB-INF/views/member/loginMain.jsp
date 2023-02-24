<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${pageContext.request.contextPath}/resources/css/login.css" rel="stylesheet" />
<title>로그인 선택화면</title>
<style>	
	.footer {
  text-align: center;
  }
  </style>
</head>
<body>
<%@ include file="/WEB-INF/views/nav.jsp" %>
<center>
<button type="button" class="loginimg" onclick="location.href='${pageContext.request.contextPath}/member/loginMain';"></button>
<form action="${pageContext.request.contextPath}/member/join" method="post">
<div class="loginform">
	<br>
  	<div class="login-con"><input type="button" class="userlogin" onclick="location.href='${pageContext.request.contextPath}/member/login'"value="회원 로그인"/></div>
    <div class="login-con"><input type="button" class="partlogin" onclick="location.href='${pageContext.request.contextPath}/partner/login';"value="파트너 로그인"/></div>
    <div class="login-con"><input type="submit" class="joinbox" value="회원가입" /></div>
</div>
</form>
</center>
<br>
<%@ include file="/WEB-INF/views/footer.jsp" %>
</body>
</html>