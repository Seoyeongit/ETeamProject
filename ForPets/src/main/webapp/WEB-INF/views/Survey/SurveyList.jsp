<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>    
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>survey list</title>
</head>
<body>
	<h1>설문지 목록</h1>
	<h5>원하는 소모임을 찾아보세요</h5>
	<form action="surveylist.do" method="post">
		<table>
			<tr>
				<th>글 번호</th>
				<th>설문지 제목</th>
				<th>작성자</th>
				<th>작성날짜</th>
			</tr>
			<c:forEach items="${surveyList }" var="surv">
			<tr>
				<td>${surv.c_code}</td>
				<td><a href="surveyboard.do/${ surv.c_code}">클릭</a></td>
				<td>${ surv.c_code}</td>
				<td>..</td>
			</tr>
			</c:forEach>
		</table>
	</form>
	<a href="getcommunity.do"><input type="button" value="글 작성하기"></a>
</body>
</html>