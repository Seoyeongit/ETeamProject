<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
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

<script
	src="https://cdn.jsdelivr.net/npm/chart.js@3.5.1/dist/chart.min.js"></script>
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
										<div class="text-xs font-weight-bold text-uppercase-gray mb-1">총
											수익</div>

									</div>
								</div>
								<div class="row align-items-center">
									<div class="col align-items-center">
										<div class="mb-0 text-gray-800 align-items-center">
											<p class="h2 mb-0 font-weight-bold align-items-center">${stats.earnings}<span
													class="h6 mb-0 font-weight-bold align-items-center">(원)</span>
											</p>
										</div>
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
										<div class="text-xs font-weight-bold text-uppercase-gray mb-1">회원수</div>
									</div>
								</div>
								<div class="row align-items-center">
									<div class="col">
										<div class="mb-0 text-gray-800">
											<p class="h2 mb-0 font-weight-bold">${stats.userCount}
												<span class="h6 mb-0 font-weight-bold">(명)</span>
											</p>
										</div>
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
										<div class="text-xs font-weight-bold text-uppercase-gray mb-1">평균
											만족도</div>
									</div>
								</div>
								<div class="row align-items-center">
									<div class="col">
										<div class="mb-0 text-gray-800">
											<p class="h2 mb-0 font-weight-bold">${reserve_chart[0].montly_reserve}
												<span class="h6 mb-0 font-weight-bold">(점)</span>
											</p>
										</div>
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
										<div class="text-xs font-weight-bold text-uppercase-gray mb-1">총
											예약 건수</div>
									</div>
								</div>
								<div class="row align-items-center">
									<div class="col">
										<div class="mb-0 text-gray-800">
											<p class="h2 mb-0 font-weight-bold">${stats.earnings}<span
													class="h6 mb-0 font-weight-bold">(건)</span>
											</p>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="card shadow border-light mb-5 py-4 px-5 md-6">
					<div class="row">
						<div class="h3 m-0 text-xs font-weight-bold text-gray mb-1">월별
							예약 수</div>
					</div>
					<div class="card-body">
						<div class="chart-area">
							<canvas id="myLineChart" height="80"></canvas>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<!-- Bootstrap core JS-->
<script>
	var reserve = new Array();

	<c:forEach items="${reserve_chart}" var="reserve">
	reserve.push("${reserve.montly_reserve}");
	</c:forEach>

	var months = new Array();

	<c:forEach items="${reserve_chart}" var="reserve">
	months.push("${reserve.year_month}");
	</c:forEach>

	Chart.defaults.font.family = 'Noto Sans KR';

	const ctx = document.getElementById('myLineChart').getContext('2d');
	const chart = new Chart(ctx, {
		// CORE PART !!

		// 라인차트임을 명시
		type : 'line',
		data : {
			// 데이타들의 라벨. X축이 된다.
			labels : months,
			// 실제 데이타를 넣는다.                
			datasets : [ {
				// 각 데이타의 라벨 
				label : "예약 수",
				// 데이타 값. config.data.labels와 수를 같게 해주면 된다.
				backgroundColor : 'rgb(255, 99, 132)',
				borderColor : 'rgb(255, 99, 132)',
				data : reserve,
				fill : false,
			} ]
		},
		options : {
			responsive : true,
			title : {
				display : true,
				text : 'Chart.js Line Chart'
			},
			tooltips : {
				mode : 'index',
				intersect : false,
			},
			hover : {
				mode : 'nearest',
				intersect : true
			},
			scales : {
				xAxes : [ {
					display : true,
					scaleLabel : {
						display : true,
						labelString : 'Month'
					}
				} ],
				yAxes : [ {
					display : true,
					scaleLabel : {
						display : true,
						labelString : 'Value'
					}
				} ]
			}
		}
	});
</script>

<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script
	src="${pageContext.request.contextPath}/resources/js/admin/sideBar.js"></script>

</html>