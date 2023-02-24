<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${pageContext.request.contextPath}/resources/css/login.css" rel="stylesheet" />
<title>파트너 로그인</title>
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
<form action="${pageContext.request.contextPath}/partner/login" method="post">
<div class="partlog-tx">파트너 로그인</div>
<div class="loginform">
  	<div><input type="text" class="idbox" name="part_id" placeholder="아이디"/></div>
    <div><input type="password" class="pwbox" name="part_pw" placeholder="비밀번호"/></div>
    <div class="login-con"><input type="submit" class="loginbox" value="로그인" /></div>
</div>
</form>
</center>
<br>
<%@ include file="/WEB-INF/views/footer.jsp" %>
</body>
</html>