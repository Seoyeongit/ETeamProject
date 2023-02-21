<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 관리</title>
</head>
<body>
<button onclick="location.href='${pageContext.request.contextPath}/Admin/main'">관리자 페이지 홈</button>
<h1>게시판 관리</h1>

<h3>반려인 팁</h3>
<iframe name="tipPrev" id="tipPrev" width="100%" height="300" src="./tipPrev"></iframe>

<h3>소모임</h3>
<iframe name="communityPrev" id="communityPrev" width="700" src="./communityPrev"></iframe>
	
</body>
</html>