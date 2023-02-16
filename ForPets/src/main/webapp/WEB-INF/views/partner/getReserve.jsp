<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 일정 관리</title>
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
		<tr>
			<td><input type="text" name="num" value="${ reserve.reserve_num }" readonly /></td>
			<td><input type="text" name="user" value="${ reserve.user_id }" readonly /></td>
			<td><input type="text" name="add" value="${ reserve.reserve_add }" readonly /></td>
			<td><input type="text" name="date" value="${ reserve.reserve_day }" readonly /></td>
			<td><input type="text" name="time" value="${ reserve.reserve_time }" readonly /></td>
		</tr>
		<tr>
			<td><input type="button" onclick="location.href='partner';" value="뒤로가기"/></td>
		</tr>
	</table>
</body>
</html>