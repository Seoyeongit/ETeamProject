<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../favicon.jsp"></jsp:include>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/resources/css/Tip/style.css" rel="stylesheet" />
<style>
	#main_content {
		display : table;
		width : 100%;
	}
	#sidebar, #main {
		display : table-cell;
	}
	#tip_title {
		font-size : 30px;
	}
</style>
</head>
<body>
	<jsp:include page="../nav.jsp" />
	<div id="main_content">
		<!-- ======= Sidebar ======= -->
		<aside id="sidebar" class="sidebar">
			<ul class="sidebar-nav" id="sidebar-nav">
				<li class="nav-item">
					<a class="nav-link collapsed" href="${pageContext.request.contextPath}/Service/choice">
						<i class="bi bi-grid"></i>
						<span>서비스 예약</span>
					</a>
				</li><!-- End Dashboard Nav -->
				
				<li class="nav-item">
					<a class="nav-link collapsed" href="${pageContext.request.contextPath}/FindHospital/findHospital">
						<i class="bi bi-grid"></i>
	          			<span>근처 병원 찾기</span>
	        		</a>
	      		</li><!-- End Tip Board Nav -->
	
				<li class="nav-item">
					<a class="nav-link collapsed" href="${pageContext.request.contextPath}/Tip/getTipList">
						<i class="bi bi-grid"></i>
						<span>팁 게시판</span>
					</a>
				</li><!-- End Tip Board Nav -->
			</ul>
		</aside><!-- End Sidebar-->
		<main id="main" class="main">
			<section class="section">
				<div class="row align-items-top">
					<div class="col-lg-10">
					</div>
				</div>
			</section>
		</main><!-- End #main -->
	</div>
	<div id="footer_div" style="background-color : white;">
		<jsp:include page="../footer.jsp" />
	</div>
</body>
</html>