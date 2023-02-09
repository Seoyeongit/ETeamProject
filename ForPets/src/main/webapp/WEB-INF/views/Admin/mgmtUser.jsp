<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 관리</title>
</head>
<body>
	<button
		onclick="location.href='${pageContext.request.contextPath}/adminMain.jsp'">관리자
		페이지 홈</button>
	<h1>회원 관리</h1>
	<form action="getUserList.do" method="post">
		<table cellpadding="0" width="800">
			<tr>
				<td><select name="orderCondition">
						<option value="">정렬</option>
						<option value="ID">아이디
						<option value="REGDATE">가입일
				</select></td>
				<td align="right"><input name="searchkeyword" type="text"
					value="Search"> <input type="submit" value="검색"></td>
			</tr>
		</table>
		<br>
	</form>
	<table width="800" border="1" bordercolors="gray">
		<tr height="40">
			<td align="center" width="300">회원</td>
			<td align="center" width="150">가입일</td>
			<td align="center" width="100">경고횟수</td>
			<td align="center" width="100"></td>
		</tr>
		<c:forEach var="v" items="${v}">
			<tr height="40">
				<td width="300">회원아이디${bean.user_id}<br>${bean.user_nick}닉네임</td>
				<td align="center" width="150">${bean.data_create}</td>
				<td align="center" width="100">${bean.war}</td>
				<td align="center" width="100"><button type="button" onclick="">탈퇴</button></td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>