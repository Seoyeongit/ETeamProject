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
		<form action="updateTip.do" method="post">
		<input name="tip_seq" type="hidden" value="${ tip.tip_seq }"/>
			<table border="1" cellpadding="0" cellspacing="0">
				<tr>
					<td bgcolor="orange" width="70">제목</td>
					<td align="left"><input name="title" type="text" value="${ tip.tip_title }" /></td>
				</tr>
				<tr>
					<td bgcolor="orange">작성자</td>
					<td align="left">관리자</td>
				</tr>
				<tr>
					<td bgcolor="orange">내용</td>
					<td align="left"><textarea name="content" cols="40" rows="10">${ tip.tip_content }</textarea>
					<br>
					<iframe width="300" height="150" src="${tip.tip_video }" frameborder="0" allow="accelerometer; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
					</td>
				</tr>
				<tr>
					<td bgcolor="orange">등록일</td>
					<td align="left">${ tip.tip_create_date }</td>
				</tr>
				<tr>
					<td bgcolor="orange">조회수</td>
					<td align="left">${ tip.tip_hit +1 }</td>
				</tr>
				<tr>
					<td colspan="2" align="center"><input type="submit" value="글 수정" /></td>
				</tr>
			</table>
		</form>
		<hr>
		<a href="insertTip.jsp">글등록</a>&nbsp;&nbsp;&nbsp;
		<a href="deleteTip.do?tip_seq=${ tip.tip_seq }">글삭제</a>&nbsp;&nbsp;&nbsp;
		<a href="getTipList.do">글목록</a>
	</center>
</body>
</html>