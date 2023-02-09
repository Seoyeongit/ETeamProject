<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 정보</title>
</head>
<body>
	<button
		onclick="location.href='${pageContext.request.contextPath}/adminMain.jsp'">관리자
		페이지 홈</button>
	<h1>관리자 정보</h1>

<form action="MemberUpdateProc.jsp" method="post">
	<table width="400" border="1">
			<tr height="50">
				<td align="center" width="150">아이디</td>
				<td width="250">${bean.user_id}</td>
			</tr>

			<tr height="50">
				<td align="center" width="150">이메일</td>
				<td width="250"><input type="email" name="email"
					value="${bean.user_id}"></td>
			</tr>

			<tr height="50">
				<td align="center" width="150">전화</td>
				<td width="250"><input type="tel" name="tel"
					value="${bean.user_id}"></td>
			</tr>

			<tr height="50">
				<td align="center" width="150">패스워드</td>
				<td width="250"><input type="password" name="pass1"></td>
			</tr>

			<tr height="50">
				<td align="center" colspan="2">
				<input type="hidden" name="id" value="${bean.user_id}"> 
				<input type="submit" value="회원 수정하기">&nbsp;&nbsp;
		<button onclick="location.href='MemberList.jsp'">회원 전체 보기</button>
		</td>
		</tr>
	</table>
</form>
</body>
</html>