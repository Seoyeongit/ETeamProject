<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>    
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <form action="updateBoard.do" method="post">
<input name="seq" type="hidden" value="${ notice.seq }"/>
<table border="1" cellpadding="0" cellspacing="0">
	<tr>
		<td bgcolor="orange" width="70">제목</td>
		<td align="left"><input name="title" type="text" value="${ notice.title }" /></td>
	</tr>
	<tr>
		<td bgcolor="orange">작성자</td>
		<td align="left">${ notice.writer }</td>
	</tr>
	<tr>
		<td bgcolor="orange">내용</td>
		<td align="left"><textarea name="content" cols="40" rows="10">${ notice.content }</textarea></td>
	</tr>
	<tr>
		<td bgcolor="orange">등록일</td>
		<td align="left">${ notice.regDate }</td>
	</tr>
	<tr>
		<td bgcolor="orange">조회수</td>
		<td align="left">${ notice.cnt }</td>
	</tr>
	<tr>
		<td colspan="2" align="center"><input type="submit" value="글 수정" /></td>
	</tr>
</table>
</form>
<hr>
<a href="insertBoard.jsp">글등록</a>&nbsp;&nbsp;&nbsp;
<a href="deleteBoard.do?seq=${ notice.seq }">글삭제</a>&nbsp;&nbsp;&nbsp;
<a href="noticeBoard">글목록</a>
</body>
</html>