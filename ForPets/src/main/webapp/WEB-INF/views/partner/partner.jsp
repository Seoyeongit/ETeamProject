<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파트너 페이지</title>
</head>
<body>
	<h2>파트너 페이지</h2>
	<form action="${pageContext.request.contextPath}/partner/partner" method="post">
	<table>
		<tr>
			<td><input type="button"  onclick="location.href='partnerGet';" value="파트너 정보 수정"></td>
		</tr>
		<tr>
			<td><input type="button" value="돌봄 일지 작성"></td>
		</tr>
		<tr>
			<td><input type="button" value="별점 및 리뷰 보기"></td>
		</tr>
		<tr>
			<td><input type="button" value="예약 일정 관리"></td>
		</tr>
	</table>
	</form>
</body>
</html>