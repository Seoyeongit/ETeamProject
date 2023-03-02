<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<title>관리자 대시보드</title>
<jsp:include page="../favicon.jsp"></jsp:include>
<!-- Core theme CSS (includes Bootstrap)-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<link
	href="${pageContext.request.contextPath}/resources/css/admin/sideBar.css"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath}/resources/css/admin/admin.css?ver=1"
	rel="stylesheet" type="text/css" />
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link
	href="${pageContext.request.contextPath}/resources/css/admin/mgmt.css?ver=1.1"
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
					<h1 class="h3 mb-0 text-gray-800" style="color: #696969">대시보드</h1>
				</div>
				<div class="row mb-3">
					<!-- Earnings (Monthly) Card Example -->
					<div class="col-xl-3 col-md-6 mb-4">
						<div class="card shadow border-light h-100">
							<div class="card-body">
								<div class="row align-items-center">
									<div class="col mr-2">
										<div class="text-xs font-weight-bold text-uppercase mb-1">Earnings
											(Monthly)</div>
										<div class="h5 mb-0 font-weight-bold text-gray-800">$40,000</div>
										<div class="mt-2 mb-0 text-muted text-xs">
											<span class="text-success mr-2"><i
												class="fa fa-arrow-up"></i> 3.48%</span> <span>Since last
												month</span>
										</div>
									</div>
									<div class="col-auto">
										<i class="fas fa-calendar fa-2x text-primary"></i>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- Earnings (Annual) Card Example -->
					<div class="col-xl-3 col-md-6 mb-4">
						<div class="card shadow border-light h-100">
							<div class="card-body">
								<div class="row align-items-center">
									<div class="col mr-2">
										<div class="text-xs font-weight-bold text-uppercase mb-1">Sales</div>
										<div class="h5 mb-0 font-weight-bold text-gray-800">650</div>
										<div class="mt-2 mb-0 text-muted text-xs">
											<span class="text-success mr-2"><i
												class="fas fa-arrow-up"></i> 12%</span> <span>Since last
												years</span>
										</div>
									</div>
									<div class="col-auto">
										<i class="fas fa-shopping-cart fa-2x text-success"></i>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- New User Card Example -->
					<div class="col-xl-3 col-md-6 mb-4">
						<div class="card shadow border-light h-100">
							<div class="card-body">
								<div class="row align-items-center">
									<div class="col mr-2">
										<div class="text-xs font-weight-bold text-uppercase mb-1">New
											User</div>
										<div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">366</div>
										<div class="mt-2 mb-0 text-muted text-xs">
											<span class="text-success mr-2"><i
												class="fas fa-arrow-up"></i> 20.4%</span> <span>Since last
												month</span>
										</div>
									</div>
									<div class="col-auto">
										<i class="fas fa-users fa-2x text-info"></i>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- Pending Requests Card Example -->
					<div class="col-xl-3 col-md-6 mb-4">
						<div class="card shadow border-light h-100">
							<div class="card-body">
								<div class="row align-items-center">
									<div class="col mr-2">
										<div class="text-xs font-weight-bold text-uppercase mb-1">Pending
											Requests</div>
										<div class="h5 mb-0 font-weight-bold text-gray-800">18</div>
										<div class="mt-2 mb-0 text-muted text-xs">
											<span class="text-danger mr-2"><i
												class="fas fa-arrow-down"></i> 1.10%</span> <span>Since
												yesterday</span>
										</div>
									</div>
									<div class="col-auto">
										<i class="fas fa-comments fa-2x text-warning"></i>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="card shadow mb-5 py-5 px-5"></div>
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