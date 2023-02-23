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
<<<<<<< HEAD
<iframe name="tipPrev" id="tipPrev" src="./tipPrev"></iframe>

<h3>소모임</h3>
<iframe name="communityPrev" id="communityPrev" src="./communityPrev"></iframe>
=======
<iframe name="tipPrev" id="tipPrev" style="width:100%; height:300px; border: 0px" src="./tipPrev"></iframe>

<h3>소모임</h3>
<iframe name="communityPrev" id="communityPrev" style="width:100%; height:300px; border: 0px" src="./communityPrev"></iframe>
>>>>>>> parent of f4bfb39 (Merge pull request #78 from Seoyeongit/add/admin)
	
</body>
</html>