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

Admin id</p>
<button onclick="location.href=''">관리자 정보 수정</button></td>
<td><button onclick="location.href=''">회원 관리</button></td>
<td><button onclick="location.href=''">파트너 관리</button></td>
</tr>
<tr>
<td><button onclick="location.href='${pageContext.request.contextPath}/Notice/noticeBoard'">공지사항</button></td>
<td><button onclick="location.href=''">게시판 관리</button></td>
<td><button onclick="location.href=''">신고 관리</button></td>
</tr>
</table>

</body>
</html>