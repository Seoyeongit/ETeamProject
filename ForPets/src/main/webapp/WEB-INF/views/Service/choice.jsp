<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<ul>
		<li><a href="${pageContext.request.contextPath}/">홈</a></li>
		<li><a href="${pageContext.request.contextPath}/Service/choice">서비스 예약</a></li>
		<li><a href="${pageContext.request.contextPath}/FindHospital/findHospital">근처 병원 찾기</a></li>
		<li><a href="${pageContext.request.contextPath}/Tip/getTipList">Tip 게시판</a></li>
	</ul>
	<center>
		<button type="button" onclick="location.href='normal'">기본</button>
		<button type="button" onclick="location.href='work'">산책</button>
		<button type="button" onclick="location.href='pickup'">픽업</button>
	</center>
</body>
</html>