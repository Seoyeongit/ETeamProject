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
		<li><a href="">서비스 예약</a></li>
		<li><a href="findHospital.jsp">근처 병원 찾기</a></li>
		<li><a href="getTipList.do">Tip 게시판</a></li>
	</ul>
	<center>
		<iframe src="findHospitalMap.jsp" width="100%" height="520" padding="0" resize="none"></iframe>
	</center>
</body>
</html>