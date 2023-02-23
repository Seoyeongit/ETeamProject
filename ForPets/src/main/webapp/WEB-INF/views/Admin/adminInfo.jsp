<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 정보</title>
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
				<h1>관리자 정보</h1>
				<form action="../modInfo.do" method="post">
					<table width="400" border="1">
						<tr height="50">
							<td align="center" width="150">아이디</td>
							<td width="250"><input type="text" name="adm_id"
								value="${admin.adm_id}" readonly="readonly"
								onfocus="this.blur();" tabindex="-1"
								style="background-color: #ffffff;" /></td>
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
							<td width="250"><input type="hidden" id="adm_pw"
								name="adm_pw" value="${admin.adm_pw}"></td>
						</tr>

						<tr height="50">
							<td align="center" colspan="2"><input type="hidden"
								name="id" value="${admin.adm_id}"> <input type="submit"
								value="수정하기">&nbsp;&nbsp;</td>
						</tr>
					</table>
				</form>
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