<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
</head>
<body>
	<table>
		<tr>
			<td>
				<h3>Admin id</h3>
				</p>
				<button
					onclick="location.href='${pageContext.request.contextPath}/Admin/adminInfo'">관리자
					정보 수정</button>
			</td>
		</tr>
		<tr>
			<td><button
					onclick="location.href='${pageContext.request.contextPath}/Admin/mgmtUser'">회원관리</button></td>
			<td><button
					onclick="location.href='${pageContext.request.contextPath}/Admin/mgmtPartner'">파트너관리</button></td>
			<td><button
					onclick="location.href='${pageContext.request.contextPath}/Admin/mgmtBoard'">게시판관리</button></td>
		</tr>
		<tr>
			<td><button
					onclick="location.href='${pageContext.request.contextPath}/Notice/noticeBoard'">공지사항</button></td>
			<td><button
					onclick="location.href='${pageContext.request.contextPath}/customer.do'">고객센터</button></td>
			<td><button
					onclick="location.href='${pageContext.request.contextPath}/Report/reportList'">신고관리</button></td>
		</tr>
	</table>
</body>
</html>