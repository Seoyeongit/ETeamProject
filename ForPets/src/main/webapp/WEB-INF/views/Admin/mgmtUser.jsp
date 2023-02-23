<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 관리</title>
<jsp:include page="../favicon.jsp"></jsp:include>
<!-- Core theme CSS (includes Bootstrap)-->
<link
	href="${pageContext.request.contextPath}/resources/css/admin/sideBar.css"
	rel="stylesheet" />
</head>
<body>

	<div class="d-flex" id="wrapper">
		<jsp:include page="sideBar.jsp" />
		<!-- Page content wrapper-->
		<div id="page-content-wrapper">
			<jsp:include page="top.jsp" />

			<div class="container">
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
					<c:forEach var="user" items="${getUser}">
						<tr height="40">
							<td width="300">${user.user_id}<br>${user.user_nick}</td>
							<td align="center" width="150">${user.data_create}</td>
							<td align="center" width="100">${user.war}</td>
							<td align="center" width="100"><button type="button"
									onclick="">탈퇴</button></td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
	</div>
</body>
<!-- Bootstrap core JS-->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script
	src="${pageContext.request.contextPath}/resources/js/admin/sideBar.js"></script>
</html>