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
	<p>${partners.part_nick}(${partners.part_id })님 안녕하세요</p>
	<table>
		<tr>
			<td><input type="submit"  onclick="location.href='partnerGet';" value="나의 정보"></td>
			<td><input type="button" onclick="location.href='../partners/viewWriteCare';" value="돌봄 일지 작성"></td>
			<td><input type="submit" onclick="location.href='../partnerlist.do';" value="별점 및 리뷰 보기"></td>
			<td><input type="submit" onclick="location.href='getReserve';" value="예약 일정 관리"></td>
		</tr>
	</table>
	<p><input type="button" onclick="location.href='/';" value="홈으로"></p>
</body>
</html>