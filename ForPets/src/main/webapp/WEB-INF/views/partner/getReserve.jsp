<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 일정 관리</title>
</head>
<body>
	<h2>캐어 전</h2>
	<table>
		<tr>
			<th>예약 번호</th>
			<th>예약자</th>
			<th>예약 주소</th>
			<th>예약 날짜</th>
			<th>예약 시간</th>
		</tr>
		<c:forEach items="${reserveList}" var="rList">
		<c:if test="${member.user_id ne null}">
		<c:if test="${rList.status eq 1 }">
		<tr>
			<td><input type="text" name="num" value="${ rList.reserve_num }" readonly /></td>
			<td><input type="text" name="user" value="${ rList.user_id }" readonly /></td>
			<td><input type="text" name="add" value="${ rList.reserve_add }" readonly /></td>
			<td><input type="text" name="date" value="${ rList.reserve_day }" readonly /></td>
			<td><input type="text" name="time" value="${ rList.reserve_time }" readonly /></td>
			<td><input type="button" onclick="location.href='../partner/detail?reserve_num=${rList.reserve_num}&user_id=${rList.user_id}';" value="확인하기"/></td>
		</tr>
		</c:if>
		</c:if>
		</c:forEach>
	</table>
	<h2>캐어 중</h2>
	<table>
		<tr>
			<th>예약 번호</th>
			<th>예약자</th>
			<th>예약 주소</th>
			<th>예약 날짜</th>
			<th>예약 시간</th>
		</tr>
		<c:forEach items="${reserveList}" var="rList">
		<c:if test="${member.user_id ne null}">
		<c:if test="${rList.status eq 2 }">
		<tr>
			<td><input type="text" name="num" value="${ rList.reserve_num }" readonly /></td>
			<td><input type="text" name="user" value="${ rList.user_id }" readonly /></td>
			<td><input type="text" name="add" value="${ rList.reserve_add }" readonly /></td>
			<td><input type="text" name="date" value="${ rList.reserve_day }" readonly /></td>
			<td><input type="text" name="time" value="${ rList.reserve_time }" readonly /></td>
			<td><input type="button" onclick="location.href='../partner/detail?reserve_num=${rList.reserve_num}&user_id=${rList.user_id}';" value="확인하기"/></td>
		</tr>
		</c:if>
		</c:if>
		</c:forEach>
	</table>
	<h2>캐어 완료</h2>
	<table>
		<tr>
			<th>예약 번호</th>
			<th>예약자</th>
			<th>예약 주소</th>
			<th>예약 날짜</th>
			<th>예약 시간</th>
		</tr>
		<c:forEach items="${reserveList}" var="rList">
		<c:if test="${member.user_id ne null}">
		<c:if test="${rList.status eq 3 }">
		<tr>
			<td><input type="text" name="num" value="${ rList.reserve_num }" readonly /></td>
			<td><input type="text" name="user" value="${ rList.user_id }" readonly /></td>
			<td><input type="text" name="add" value="${ rList.reserve_add }" readonly /></td>
			<td><input type="text" name="date" value="${ rList.reserve_day }" readonly /></td>
			<td><input type="text" name="time" value="${ rList.reserve_time }" readonly /></td>
			<td><input type="button" onclick="location.href='../partner/detail?reserve_num=${rList.reserve_num}&user_id=${rList.user_id}';" value="확인하기"/></td>
		</tr>
		</c:if>
		</c:if>
		</c:forEach>
	</table>
	<input type="button" onclick="location.href='partnerMain';" value="뒤로가기"/>
</body>
</html>