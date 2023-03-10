<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<title>Side bar</title>
<!-- Core theme CSS (includes Bootstrap)-->
<link
	href="${pageContext.request.contextPath}/resources/css/admin/sideBar.css?ver=1"
	rel="stylesheet" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

<link
	href="https://fonts.googleapis.com/css2?family=Gothic+A1:wght@200;400;500;600;700&display=swap"
	rel="stylesheet">
</head>
<!-- Top navigation-->
<div id="page-content-wrapper">
	<nav
		class="navbar navbar-expand-lg navbar-light bg-white border-bottom">
		<div class="container-fluid">
			<button class="btn btn-light" id="sidebarToggle"
				style="background-color: transparent;">
				<img
					src="${pageContext.request.contextPath}/resources/assets/img/admin/free-icon-font-list.png"
					width=28>
			</button>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav ms-auto mt-2 mt-lg-0">
					<li class="nav-item active"><a class="nav-link" href="#!"></a></li>
					<li class="nav-item"><a class="nav-link"
						href="${pageContext.request.contextPath}/"
						style="color: #8bda8b; font-weight: 700;"><img
							src="${pageContext.request.contextPath}/resources/assets/img/logo_gr.png"
							width="90" alt="..." />&nbsp;홈&nbsp;</a></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" id="navbarDropdown" href="#"
						role="button" data-bs-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false" style="font-weight: 600;">${admin.adm_id}&nbsp;님&nbsp;</a>
						<div class="dropdown-menu dropdown-menu-end"
							aria-labelledby="navbarDropdown">
							<a class="dropdown-item"
								href="${pageContext.request.contextPath}/Admin/adminInfo/${admin.adm_id}">관리자
								정보</a>
							<div class="dropdown-divider"></div>
							<a class="dropdown-item" href="#myLogoutModal" data-toggle="modal">로그아웃</a>
							<!--  
							<a class="dropdown-item"
								href="${pageContext.request.contextPath}/Admin/logout">로그아웃</a> -->
						</div></li>
				</ul>
			</div>
		</div>
	</nav>
</div>

<!-- Modal HTML -->
<div id="myLogoutModal" class="modal fade">
	<div class="modal-dialog modal-confirm modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-header flex-column">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
				<h4 class="modal-title w-100">로그아웃 하시겠습니까?</h4>

			</div>
			<div class="modal-body"></div>
			<div class="modal-footer justify-content-center">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
				<button type="button" class="btn btn-danger"
					onclick="location.href='${pageContext.request.contextPath}/Admin/logout'">로그아웃</button>
			</div>
		</div>
	</div>
</div>

<!-- Bootstrap core JS-->
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<!-- Core theme JS-->
<script
	src="${pageContext.request.contextPath}/resources/js/admin/sideBar.js"></script>
</html>