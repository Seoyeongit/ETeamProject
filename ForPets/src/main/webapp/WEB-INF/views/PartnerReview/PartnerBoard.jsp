<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>    
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>펫트너 리뷰</title>
</head>
<body>
<h1>펫트너 리뷰</h1>
	<h5>펫트너를 평가해주세요!</h5>

		<h3>${prList } 펫트너</h3>
		
		<p>파트너 평균 평점 ${avg }점</p>

		
		<table>
			<tr>
				<th>글 번호</th>
				<th>평점</th>
				<th>리뷰 제목</th>
				<th>아이디</th>
				<th>작성 날짜</th>
			</tr>
			<c:forEach items="${reviewList }" var="rl">
			<tr>
				<td>${rl.pr_num }</td>
				<td>${rl.pr_avg }</td>
				<td><a href="../prboard.do/${rl.pr_num }">${rl.pr_title }</a></td>
				<td>${rl.user_id }</td>
				<td>${rl.pr_date }</td>
			</tr>
			</c:forEach>
		</table>

	<a href="../getpr.do/${part_id }"><input type="button" value="글 작성하기"></a>
	<a href="surveylist.do">설문지 보러가기</a>
</body>
</html>