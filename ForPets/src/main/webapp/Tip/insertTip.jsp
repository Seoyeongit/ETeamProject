<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<ul>
		<li><a href="./Service/choice.jsp">서비스 예약</a></li>
		<li><a href="./FindHospital/findHospital.jsp">근처 병원 찾기</a></li>
		<li><a href="getTipList.do">Tip 게시판</a></li>
	</ul>
	<center>
		<form action="http://localhost:8000/biz/insertTip.do" method="post">
			<table border="1" cellpadding="0" cellspacing="0">
				<tr>
					<td bgcolor="orange" width="70">제목</td>
					<td align="left"><input type="text" name="tip_title" /></td>
				</tr>
				<tr>
					<td bgcolor="orange">유튜브 URL</td>
					<td align="left"><input type="text" name="tip_video" size="10"/></td>
				</tr>
				<tr>
					<td bgcolor="orange">내용</td>
					<td align="left"><textarea name="tip_content" cols="40" rows="10"></textarea></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
					<input type="submit" value="새글 등록" /></td>
				</tr>
			</table>
		</form>
		<hr>
		<a href="../getTipList.do">글목록</a>
	</center>
</body>
</html>