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
		<li><a href="./choice.jsp">서비스 예약</a></li>
		<li><a href="../FindHospital/findHospital.jsp">근처 병원 찾기</a></li>
		<li><a href="../getTipList.do">Tip 게시판</a></li>
	</ul>
	<center>
		<button type="button" onclick="location.href='normal.jsp'">기본</button>
		<button type="button" onclick="location.href='walk.jsp'">산책</button>
		<button type="button" onclick="location.href='pickup.jsp'">픽업</button>
	</center>
</body>
</html>