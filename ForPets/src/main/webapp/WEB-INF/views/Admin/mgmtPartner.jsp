<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<title>펫트너 관리</title>
<jsp:include page="../favicon.jsp"></jsp:include>
<!-- Core theme CSS (includes Bootstrap)-->
<link
	href="${pageContext.request.contextPath}/resources/css/admin/sideBar.css"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath}/resources/css/admin/admin.css?after"
	rel="stylesheet" type="text/css" />
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link
	href="${pageContext.request.contextPath}/resources/css/admin/partnerList.css?ver=1.1"
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
					<h1 class="h3 mb-0 text-gray-800">파트너 관리</h1>
				</div>
				<!-- Datatables -->
				<div class="card shadow mb-4">
					<div class="card-header py-3" id="table-card-header">
						<h5 class="m-0 text-gray">펫트너 목록</h5>
					</div>
					<div class="table-responsive-xxl">
						<div class="table-wrapper">
							<div class="table-filter">
								<div class="row">
									<div class="col-sm-2 float-left">
										<!-- 정렬 -->
										<div class="col-sm-8">
											<select class="form-select" name="orderCondition"
												id="order-select">
												<option value="NO">등록일</option>
												<option value="NAME">이름순</option>
												<option value="RESERVE">예약순</option>
											</select>
										</div>
									</div>
									<div class="col-sm-5"></div>
									<div class="col-sm-5 float-right" id="search-group">
										<form action="mgmtPartner" method="post">
											<!-- 검색 -->
											<div class="input-group">
												<div class="col-sm-3">
													<select class="form-select" name="searchCondition">
														<option value="NAME">이름</option>
														<option value="ADD">주소</option>
														<option value="NICKNAME">닉네임</option>
													</select>
												</div>
												<input name="searchKeyword" type="text" class="form-control"
													placeholder="Search">
												<button type="submit" class="btn border">검색</button>
											</div>
										</form>
									</div>

								</div>
							</div>
							<table class="table table-hover">
								<thead>
									<tr align="center">
										<th>no</th>
										<th>파트너</th>
										<th>주소</th>
										<th>등록일</th>
										<th>연락처</th>
										<th>관리</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="partner" items="${getPartner}">
										<tr>
											<td align="center">${partner.part_no}</td>
											<td><a href="${pageContext.request.contextPath}/Admin/mgmtPartner/${partner.part_id}"><img
													src="${pageContext.request.contextPath}/partner/display?fileName=${partner.img}"
													class="avatar" alt="${partner.part_name}"
													style="width: 50px;">
													${partner.part_name}(${partner.part_id})</a></td>
											<td align="center">${partner.part_add}</td>
											<td align="center">${partner.data_create}</td>
											<td align="center">${partner.part_phnumber}</td>
											<td align="center"><a href="${pageContext.request.contextPath}/Admin/mgmtPartner/${partner.part_id}" class="view"
												title="정보 보기" data-toggle="tooltip"><i
													class="material-icons">&#xE5C8;</i></a></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<br>
							<div class="clearfix">
								<ul class="pagination">
									<li class="page-item"><a class="page-link"
										href="/biz/Notice/noticeBoard?pageNum=${pageMaker.startPage}&amount=10&searchCondition=${ pageMaker.cri.searchCondition }&searchKeyword=${ pageMaker.cri.searchKeyword }"
										aria-label="Previous"> <span aria-hidden="true">&laquo;</span></a></li>
									<c:if test="${pageMaker.prev}">
										<li class="page-item paginate_button"><a
											href="${pageMaker.startPage -1}" class="page-link">Previous</a></li>
									</c:if>

									<c:forEach begin="${pageMaker.startPage}"
										end="${pageMaker.endPage}" var="num">
										<li
											class="page-item paginate_button ${pageMaker.cri.pageNum == num ? "active":""}"><a
											href="${num}" class="page-link">${num}</a></li>
									</c:forEach>
									<c:if test="${pageMaker.next}">
										<li class="page-item paginate_button"><a
											href="${pageMaker.endPage +1 }" class="page-link">Next</a></li>
									</c:if>
									<li class="page-item"><a class="page-link"
										href="/biz/Notice/noticeBoard?pageNum=${pageMaker.endPage}&amount=10&searchCondition=${ pageMaker.cri.searchCondition }&searchKeyword=${ pageMaker.cri.searchKeyword }"
										aria-label="Next"> <span aria-hidden="true">&raquo;</span></a></li>
								</ul>
								<form id='pageForm' action="mgmtPartner" method="get">
									<input type='hidden' name='pageNum'
										value='${pageMaker.cri.pageNum}'> <input type='hidden'
										name='amount' value='${pageMaker.cri.amount}'> <input
										type='hidden' name='searchCondition'
										value='<c:out value="${ pageMaker.cri.searchCondition }"/>'>
									<input type='hidden' name='searchKeyword'
										value='<c:out value="${ pageMaker.cri.searchKeyword }"/>'>
								</form>
							</div>
						</div>
						<br>
					</div>
				</div>
				<br>
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
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>

</html>