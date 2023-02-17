<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table>
		<tr>
			<th>예약 번호</th>
			<th>예약자</th>
			<th>예약 주소</th>
			<th>예약 날짜</th>
			<th>예약 시간</th>
		</tr>
		<c:forEach items="${reserveListCare}" var="lCare">
		<tr>
			<td><input type="text" name="num" value="${ lCare.reserve_num }" readonly /></td>
			<td><input type="text" name="user" value="${ lCare.user_id }" readonly /></td>
			<td><input type="text" name="add" value="${ lCare.reserve_add }" readonly /></td>
			<td><input type="text" name="date" value="${ lCare.reserve_day }" readonly /></td>
			<td><input type="text" name="time" value="${ lCare.reserve_time }" readonly /></td>
			<td><input type="button" onclick="location.href='../partner/viewWriteCare?reserve_num=${lCare.reserve_num}&user_id=${lCare.user_id}';" value="돌봄일지 작성하기"/></td>
		</tr>
		</c:forEach>
		<tr>
			<td><input type="button" onclick="location.href='partner';" value="뒤로가기"/></td>
		</tr>
	</table>
</body>
</html>