<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 관리</title>
<jsp:include page="../favicon.jsp"></jsp:include>
<!-- Core theme CSS (includes Bootstrap)-->
<link
	href="${pageContext.request.contextPath}/resources/css/admin/sideBar.css"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath}/resources/css/admin/admin.css?after"
	rel="stylesheet" type="text/css" />
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link
	href="${pageContext.request.contextPath}/resources/css/admin/mgmtBoard.css?ver=1"
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
					<h1 class="h3 mb-0 text-gray-800">게시판 관리</h1>
				</div>
				<div class="card shadow mb-4">
					<div class="card-header py-3" id="table-card-header">
						<h5 class="m-0 text-gray"><a href="${pageContext.request.contextPath}/Tip/getTipList" id="mgmt_board_link">반려인 TIP</a></h5>
					</div>
					<iframe name="tipPrev" id="tipPrev"
						style="width: 100%; height: 350px; border: 0px" src="./tipPrev"></iframe>
				</div>
				<div class="card shadow mb-4">
					<div class="card-header py-3" id="table-card-header">
						<h5 class="m-0 text-gray"><a href="${pageContext.request.contextPath}/communitylist" id="mgmt_board_link">소모임</a></h5>
					</div>
					<iframe name="communityPrev" id="communityPrev"
						style="width: 100%; height: 300px; border: 0px"
						src="./communityPrev"></iframe>
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