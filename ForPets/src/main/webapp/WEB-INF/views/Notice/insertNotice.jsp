<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>글 등록</h1>
<form action="insertNotice.do" method="post" enctype="multipart/form-data">
<table border="1" cellpadding="0" cellspacing="0">
	<tr>
		<td width="70">제목</td>
		<td align="left"><input name="title" type="text" /></td>
	</tr>
	<tr>
		<td>내용</td>
		<td align="left"><textarea name="content" cols="40" rows="10"></textarea></td>
	</tr>
	<tr>
		<td>등록일</td>
		<td align="left"></td>
	</tr>
	<tr>
		<td>조회수</td>
		<td align="left"></td>
	</tr>
	<tr>
		<td colspan="2" align="center"><input type="submit" value="글쓰기" /></td>
	</tr>
</table>
</form>
<a href="getNoticeBoard.do">글 목록</a>
</body>
</html>