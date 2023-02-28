<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지 사항</title>
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
	href="${pageContext.request.contextPath}/resources/css/admin/notice.css?ver=1.2"
	rel="stylesheet" type="text/css" />
</head>
<body>
	<div class="d-flex" id="wrapper">
		<jsp:include page="../Admin/sideBar.jsp" />
		<!-- Page content wrapper-->
		<div id="page-content">
			<jsp:include page="../Admin/top.jsp" />

			<div class="container-fluid" id="admin-content">
				<div
					class="d-sm-flex align-items-center justify-content-between mb-4">
					<h3 class="h3 mb-0 text-gray-800">공지사항</h3>
				</div>
				<!-- Datatables -->
				<div class="card shadow mb-4">
					<div class="card-header py-3" id="table-card-header">
						<h5 class="m-0 text-gray">공지사항</h5>
					</div>
					<div class="table-responsive-xl">
						<div class="table-wrapper">
							<div class="table-filter">
								<div class="row">
									<div class="col-sm-2 float-left">
										<!-- 정렬 -->
										<div class="col-sm-8"></div>
									</div>
									<div class="col-sm-5"></div>
									<div class="col-sm-5 float-right" id="search-group">
										<form action="noticeBoard" method="post">
											<!-- 검색 -->
											<div class="input-group">
												<div class="col-sm-3">
													<select class="form-select" name="searchCondition">
														<option value="TITLE">제목</option>
														<option value="CONTENT">내용</option>
													</select>
												</div>
												<input name="searchKeyword" type="text" class="form-control"
													placeholder="Search" />
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
										<th>제목</th>
										<th>작성일</th>
										<th>조회수</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="notice" items="${noticeBoard }">
										<tr align="center">
											<td>${notice.ntc_seq }</td>
											<td align="left"><a
												href="getNoticeBoard.do/${notice.ntc_seq }">${notice.ntc_title }</a>
											</td>
											<td>${notice.ntc_cdate }</td>
											<td>${notice.ntc_hit }</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<div class="row">
								<div class="col-2 float-left" id="write-button">
									<button onclick="location.href ='noticeForm'"
										class="btn border float-left">글쓰기</button>
								</div>
								<div class="clearfix">
									<ul class="pagination">
										<li class="page-item disabled"><a class="page-link"
											href="#" aria-label="Previous"> <span aria-hidden="true">&laquo;</span></a></li>
										<li class="page-item"><a href="#" class="page-link">1</a></li>
										<li class="page-item"><a href="#" class="page-link">2</a></li>
										<li class="page-item active"><a href="#"
											class="page-link">3</a></li>
										<li class="page-item"><a href="#" class="page-link">4</a></li>
										<li class="page-item"><a href="#" class="page-link">5</a></li>
										<li class="page-item"><a class="page-link" href="#"
											aria-label="Next"> <span aria-hidden="true">&raquo;</span></a></li>
									</ul>
								</div>
							</div>
						</div>
					</div>
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