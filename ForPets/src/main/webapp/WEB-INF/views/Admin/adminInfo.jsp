<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 정보</title>
</head>
<body>
	<button
		onclick="location.href='${pageContext.request.contextPath}/Admin/main'">관리자
		페이지 홈</button>
	<h1>관리자 정보</h1>

	<form action="../updateAdmin.do" method="post">
		<table width="400" border="1">
			<tr height="50">
				<td align="center" width="150">아이디</td>
				<td width="250"><input type="text" name="adm_id" value="${admin.adm_id}" readonly="readonly" 
				onfocus="this.blur();" tabindex="-1" style="background-color: #ffffff;" /></td>
			</tr>
			
			<tr height="50">
				<td align="center" width="150">이름</td>
				<td width="250"><input type="text" size="30" name="adm_name"
					value="${admin.adm_name}"></td>
			</tr>


			<tr height="50">
				<td align="center" width="150">이메일</td>
				<td width="250"><input type="email" name="adm_email"
					value="${admin.adm_email}"></td>
			</tr>

			<tr height="50">
				<td align="center" width="150">전화번호</td>
				<td width="250"><input type="tel" name="adm_phone"
					value="${admin.adm_phone}"></td>
			</tr>

			<tr height="50">
				<td align="center" width="150">패스워드</td>
				<td width="250"><input type="password" name="adm_pw"></td>
			</tr>

			<tr height="50">
				<td align="center" colspan="2"><input type="hidden" name="id"
					value="${admin.adm_id}"> <input type="submit" value="수정하기">&nbsp;&nbsp;
				</td>
			</tr>
		</table>
	</form>
</body>
</html>