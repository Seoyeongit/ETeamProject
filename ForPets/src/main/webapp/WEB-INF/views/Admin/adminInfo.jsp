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
<link
	href="${pageContext.request.contextPath}/resources/css/admin/admin.css?ver=1.1"
	rel="stylesheet" type="text/css" />
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link
	href="${pageContext.request.contextPath}/resources/css/admin/adminInfo.css?after"
	rel="stylesheet" type="text/css" />
</head>
<body>
	<div class="d-flex" id="wrapper">
		<jsp:include page="sideBar.jsp" />
		<!-- Page content wrapper-->
		<div id="page-content">
			<jsp:include page="top.jsp" />

			<div class="container-fluid" id="admin-content">
				<div
					class="d-sm-flex align-items-center justify-content-between mb-4">
					<h1 class="h3 mb-0 text-gray-800" style="color: #696969">관리자
						정보</h1>
				</div>
				<div class="card shadow mb-5 py-5 px-5">
					<form action="../modInfo.do" method="post">
						<div class="table-responsive px-5">
							<table class="table table-borderless align-middle">
							<tbody>
								<tr height="50">
									<td class="align-middle">아이디</td>
									<td style="width: 80%"><input type="text" class="form-control" name="adm_id"
										value="${admin.adm_id}" readonly="readonly"
										onfocus="this.blur();" tabindex="-1"
										style="" /></td>
								</tr>

								<tr height="50">
									<td class="align-middle">이름</td>
									<td style="width: 80%"><input type="text" class="form-control" size="30"
										name="adm_name" value="${admin.adm_name}"></td>
								</tr>


								<tr height="50">
									<td class="align-middle">이메일</td>
									<td><input type="email" class="form-control"
										name="adm_email" value="${admin.adm_email}"></td>
								</tr>

								<tr height="50">
									<td class="align-middle">전화번호</td>
									<td><input type="tel" class="form-control"
										name="adm_phone" value="${admin.adm_phone}"></td>
								</tr>


								<tr height="50">
									<td class="align-middle">패스워드</td>
									<td><input type="hidden" id="adm_pw" name="adm_pw"
										value="${admin.adm_pw}"></td>
								</tr>

								<tr height="50">
									<td align="center" colspan="2"><input type="hidden"
										name="id" value="${admin.adm_id}"> <input
										type="submit" value="수정하기">&nbsp;&nbsp;</td>
								</tr>
								</tbody>
							</table>
						</div>
					</form>
				</div>
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