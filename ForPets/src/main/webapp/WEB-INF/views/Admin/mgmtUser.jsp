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
<link
	href="${pageContext.request.contextPath}/resources/css/admin/admin.css?ver=1"
	rel="stylesheet" type="text/css" />
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link
	href="${pageContext.request.contextPath}/resources/css/admin/userList.css?ver=1.3"
	rel="stylesheet" type="text/css" />

<style>
.h3 {
	color: #696969;
}

.card{
	color: #696969;
}

</style>


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
					<h1 class="h3 mb-0 text-gray-800">회원 관리</h1>
				</div>
				<!-- Datatables -->
				<div class="card shadow mb-4">
					<div class="card-header py-3" id="table-card-header">
						<h5 class="m-0 text-gray">회원 목록</h5>
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
												<option value="ID">아이디</option>
												<option value="DATE">가입순</option>
												<option value="REPORT">경고순</option>
											</select>
										</div>
									</div>
									<div class="col-sm-5"></div>
									<div class="col-sm-5 float-right" id="search-group">
										<form action="../Admin/mgmtUser" method="post">
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
										<th>&nbsp;&nbsp;회원ID(닉네임)</th>
										<th>이름</th>
										<th>주소</th>
										<th>가입일</th>
										<th>탈퇴</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="user" items="${getUser}" varStatus="i">
										<tr align="center">
											<td>${i.index + 1}</td>
											<td><a
												href="${pageContext.request.contextPath}/Admin/mgmtUser/${user.user_id}">&nbsp;&nbsp;${user.user_id}(${user.user_nick})</a></td>
											<td>${user.user_name}</td>
											<td>${user.user_add}</td>
											<td>${user.data_create}</td>
											<td><a href="#userDeleteModal" class="trigger-btn"
												title="탈퇴" data-toggle="modal"><img
													src="${pageContext.request.contextPath}/resources/assets/img/admin/delete.png"
													width="24px" alt="정보 보기" /></a> <!-- <a href="${pageContext.request.contextPath}/Admin/deleteUser/${user.user_id }" class="view" title="탈퇴"
												data-toggle="tooltip"></a> --></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<br>
							<div class="clearfix">
								<ul class="pagination">
									<li class="page-item"><a class="page-link"
										href="/biz/Admin/mgmtUser?pageNum=${pageMaker.startPage}&amount=10&searchCondition=${ pageMaker.cri.searchCondition }&searchKeyword=${ pageMaker.cri.searchKeyword }"
										aria-label="Previous"> <span aria-hidden="true">&laquo;</span></a></li>
									<c:if test="${pageMaker.prev}">
										<li class="page-item paginate_button"><a
											href="${pageMaker.startPage -1}" class="page-link">Previous</a>
										</li>
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
										href="/biz/Admin/mgmtUser?pageNum=${pageMaker.endPage}&amount=10&searchCondition=${ pageMaker.cri.searchCondition }&searchKeyword=${ pageMaker.cri.searchKeyword }"
										aria-label="Next"> <span aria-hidden="true">&raquo;</span></a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<form id='pageForm' action="../Admin/mgmtUser" method="get">
			<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
			<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>

			<input type='hidden' name='searchCondition'
				value='<c:out value="${ pageMaker.cri.searchCondition }"/>'>
			<input type='hidden' name='searchKeyword'
				value='<c:out value="${ pageMaker.cri.searchKeyword }"/>'>
		</form>
	</div>

	<!-- Modal HTML -->
	<div id="userDeleteModal" class="modal fade">
		<div class="modal-dialog modal-confirm modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header flex-column">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title w-100">회원을 탈퇴하시겠습니까?</h4>

				</div>
				<div class="modal-body">
					<p>유저의 데이터를 삭제하시겠습니까?</p>
				</div>
				<div class="modal-footer justify-content-center">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">취소</button>
					<button type="button" class="btn btn-danger"
						onclick="location.href='${pageContext.request.contextPath}/Admin/deleteUser/${user.user_id }'">탈퇴</button>
				</div>
			</div>
		</div>
	</div>


</body>
<!-- Bootstrap core JS-->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<!-- Core theme JS-->
<script
	src="${pageContext.request.contextPath}/resources/js/admin/sideBar.js"></script>
<script type="text/javascript">
	$(function() {
		$(".paginate_button a").on(
				"click",
				function(e) {
					e.preventDefault();
					$("#pageForm").find("input[name='pageNum']").val(
							$(this).attr("href"));
					$("#pageForm").submit();
				});
	});
</script>
</html>