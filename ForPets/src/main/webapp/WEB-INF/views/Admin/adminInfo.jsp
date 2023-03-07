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
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
	$('#form-admin').submit(function() {
		$('#adminUpdateModal').modal('show');
		return false;
	})
</script>
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
					<form action="../modInfo.do" method="post" id="form-admin">
						<div class="table-responsive px-5">
							<table class="table table-borderless align-middle">
								<tbody>
									<tr height="50">
										<td class="align-middle">아이디</td>
										<td style="width: 90%"><input type="text"
											class="form-control" name="adm_id" value="${admin.adm_id}"
											readonly="readonly" onfocus="this.blur();" tabindex="-1"
											style="background-color: #f2f5f3;" /></td>
									</tr>

									<tr height="50">
										<td class="align-middle">이름</td>
										<td style="width: 90%"><input type="text"
											class="form-control" size="30" name="adm_name"
											value="${admin.adm_name}"></td>
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
											value="${admin.adm_pw}"> <input type="password"
											class="form-control" id="adm_pwck" name="adm_pwck"></td>
									</tr>

									<tr height="50">
										<td align="center" colspan="2"><input type="hidden"
											name="id" value="${admin.adm_id}"> <input
											type="submit" class="btn border" value="수정하기"></td>
									</tr>
								</tbody>
							</table>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<!-- Modal HTML -->
	<div id="adminUpdateModal" class="modal fade">
		<div class="modal-dialog modal-confirm modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header flex-column">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title w-100">수정 완료</h4>

				</div>
				<div class="modal-body">
					<p>관리자 정보가 성공적으로 수정되었습니다.</p>
				</div>
				<div class="modal-footer justify-content-center">
					<button class="btn btn-success" data-dismiss="modal">
						<span>확인</span> <i class="material-icons">&#xE5C8;</i>
					</button>
				</div>
			</div>
		</div>
	</div>
</body>
<!-- Bootstrap c'ore JS-->
<script>
	$('input[type=submit]').on('click', function() {
		var pw = $("#adm_pw").val();
		var pwch = $("#adm_pwck").val();

		if (pw !== pwch) {
			alert("암호가 일치하지 않습니다 한번더 확인해주세요.");
			return false;
		}

	})
</script>
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
</html>