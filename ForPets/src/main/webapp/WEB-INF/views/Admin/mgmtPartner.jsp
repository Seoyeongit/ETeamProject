<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>    
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>펫트너 관리</title>
</head>
<body>
<button onclick="location.href='${pageContext.request.contextPath}/Admin/main'">관리자 페이지 홈</button>
<h1>펫트너 관리</h1>
	<form action="getPartnerList.do" method="post">
		<table cellpadding="0" width="800">
			<tr>
				<td><select name="orderCondition">
						<option value="">정렬</option>
						<option value="NO">번호
						<option value="NAME">이름
				</select></td>
				<td align="right"><input name="searchkeyword" type="text"
					value="Search"> <input type="submit" value="검색"></td>
			</tr>
		</table>
		<br>
	</form>
	<table width="800" border="1" bordercolors="gray">
		<tr height="40">
			<td align="center" width="100">no</td>
			<td align="center" width="200">파트너</td>
			<td align="center" width="150">등록일</td>
			<td align="center" width="200">연락처</td>
			<td align="center" width="100"></td>
		</tr>
		<c:forEach var="partner" items="${getPartner}">
			<tr height="40">
				<td width="100">${partner.part_no}</td>
				<td width="200">${partner.part_name}<br>${partner.part_id}</td>
				<td align="center" width="150">${partner.data_create}</td>
				<td align="center" width="200">${partner.part_phnumber}</td>
				<td align="center" width="100"><button type="button" onclick="">탈퇴</button></td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>