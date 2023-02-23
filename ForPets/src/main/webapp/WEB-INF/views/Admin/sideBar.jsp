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
	href="${pageContext.request.contextPath}/resources/css/admin/sideBar.css"
	rel="stylesheet" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Gothic+A1:wght@200;400;500;600;700&display=swap"
	rel="stylesheet">
</head>
<!-- Sidebar-->
<div class="border-end" id="sidebar-wrapper">
	<div class="sidebar-heading border-bottom bg-light">
		<img
			src="${pageContext.request.contextPath}/resources/assets/img/logo_gr.png"
			width="120" style="margin-bottom: 1px" alt="..." /> 관리자
	</div>
	<div class="list-group list-group-flush">
		<a
			class="list-group-item list-group-item-action list-group-item-light p-3"
			href="${pageContext.request.contextPath}/Admin/main">대시보드</a> <a
			class="list-group-item list-group-item-action list-group-item-light p-3"
			href="${pageContext.request.contextPath}/Admin/mgmtUser">회원관리</a> <a
			class="list-group-item list-group-item-action list-group-item-light p-3"
			href="${pageContext.request.contextPath}/Admin/mgmtPartner">파트너관리</a>
		<a
			class="list-group-item list-group-item-action list-group-item-light p-3"
			href="${pageContext.request.contextPath}/Notice/noticeBoard">공지사항</a>
		<a
			class="list-group-item list-group-item-action list-group-item-light p-3"
			href="${pageContext.request.contextPath}/Admin/mgmtBoard">게시판관리</a> <a
			class="list-group-item list-group-item-action list-group-item-light p-3"
			href="${pageContext.request.contextPath}/customer.do">고객센터</a>
	</div>
</div>
<!-- Bootstrap core JS-->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script
	src="${pageContext.request.contextPath}/resources/js/admin/sideBar.js"></script>
</html>