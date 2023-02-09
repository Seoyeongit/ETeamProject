<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>    
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Answer list</title>
</head>
<body>
	<h1>설문지 답변 목록</h1>
	<form action="answerlist.do" method="post">
		<table>
			<tr>
				<th>설문지 번호</th>
				<th>답변 목록</th>
			</tr>
			<c:forEach items="${answerList }" var="ans">
			<tr>
				<td>${ans.sa_svcode}</td>
				<td><a href="answerboard.do/${ans.sa_svcode}&${ans.user_id}">${ ans.user_id}님의 답변입니다.</a></td>
				<!-- ?sa_svcode=${ ans.sa_svcode}&user_id=${ans.user_id} -->
			<%-- 	<td><a href="deletesurvey.do/${surv.s_svcode }"><input type="button" value="삭제"></a></td> --%>
			</tr>
					
			</c:forEach>
		</table>
	</form>
</body>
</html>