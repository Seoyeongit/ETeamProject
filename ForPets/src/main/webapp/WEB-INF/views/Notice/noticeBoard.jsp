<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>공지 사항</h1>
<!-- 검색 시작 -->
<form action="getBoardList.do" method="post">
<table cellpadding="0" width="700">
	<tr>
		<td align="right">
			<select name="searchCondition">
				<option value="TITLE">제목
				<option value="CONTENT">내용
			</select>
			<input name="searchkeyword" type="text">
			<input type="submit" value="검색">
		</td>
	</tr>
</table>
<br>
</form>

<!-- 검색 결과 조회 테이블 -->
<table border="1" cellpadding="0" width="700">
	<tr>
		<th width="100">번호</th>
		<th width="300">제목</th>
		<th width="100">작성일</th>
		<th width="100">조회수</th>
	</tr>
	
	<c:forEach items="${noticeBoardList }" var="board">
		<tr>
			<td>${board.seq }</td>
			<td align="left"> <a href="noticeBoard.do?seq=${board.seq }">${board.title }</a> </td>
			<td>${board.regDate }</td>
			<td>${board.cnt }</td>
		</tr>
	</c:forEach>
</table>
<br>
<button onclick="location.href ='noticeWriteForm.jsp'">글쓰기</button>
</body>
</html>