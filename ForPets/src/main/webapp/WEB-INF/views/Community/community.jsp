<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>    
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>community list</title>
</head>
<body>
	<h1>소모임 목록</h1>
	<h5>원하는 소모임을 찾아보세요</h5>
	<form action="communitylist.do" method="post">
		<table>
			<tr>
				<th>글 번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성날짜</th>
			</tr>
			<c:forEach items="${communityList }" var="community">
			<tr>
				<td>${community.c_code }</td>
				<td><a href="getcommunityboard.do/${ community.c_code}">${community.c_title }</a></td>
				<td>${community.user_id }</td>
				<td>${community.c_date }</td>
			</tr>
			</c:forEach>
		</table>
	</form>
	<a href="getcommunity.do"><input type="button" value="글 작성하기"></a>
	<a href="surveylist.do">설문지 보러가기</a>
</body>
</html>