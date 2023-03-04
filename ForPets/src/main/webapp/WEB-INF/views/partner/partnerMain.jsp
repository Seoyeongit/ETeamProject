<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<jsp:include page="../favicon.jsp"></jsp:include>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>파트너 페이지</title>
        <style>
		.footer {
		text-align : center; !important;
		}
		</style>
        <link rel="icon" type="image/x-icon" href="assets/img/favicon.ico" />
        <!-- Font Awesome icons (free version)-->
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
        <!-- Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Saira+Extra+Condensed:500,700" rel="stylesheet" type="text/css" />
        <link href="https://fonts.googleapis.com/css?family=Muli:400,400i,800,800i" rel="stylesheet" type="text/css" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="${pageContext.request.contextPath}/resources/css/partner.css" rel="stylesheet" />
        <script src="${pageContext.request.contextPath}/resources/js/partner_page.js"></script>
</head>
<body id="page-top">
    	<%@ include file="/WEB-INF/views/nav.jsp" %>
        <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-dark part-nav" id="sideNav">
            <a class="navbar-brand js-scroll-trigger" href="#page-top">
                <span class="d-block d-lg-none">${partners.part_name }</span>
                <span class="d-none d-lg-block"><img class="img-fluid img-profile rounded-circle mx-auto mb-2" src="../partner/display?fileName=${partners.img }" style="width:300px; height:300px;" alt="..." /></span>
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
            <div class="collapse navbar-collapse" id="navbarResponsive">
                <ul class="navbar-nav">
                    <li class="nav-item"><a class="nav-link js-scroll-trigger" href="${pageContext.request.contextPath}/partner/modifyyy">정보 수정</a></li>
                    <li class="nav-item"><a class="nav-link js-scroll-trigger" href="${pageContext.request.contextPath}/partner/careDiaryList">돌봄 일지 목록</a></li>
                    <li class="nav-item"><a class="nav-link js-scroll-trigger" href="${pageContext.request.contextPath}/partnerreviewlist/${partners.part_id}">별점 및 리뷰보기</a></li>
                    <li class="nav-item"><a class="nav-link js-scroll-trigger" href="${pageContext.request.contextPath}/partner/getReserve">예약 일정 관리</a></li>
                </ul>
            </div>
        </nav>
        <!-- Page Content-->
        <div class="container-fluid p-0">
            <!-- About-->
            <section class="resume-section" id="about">
                <div class="resume-section-content">
                    <h1 class="mb-0">
                      	  파트너
                        <span class="text-part-page">페이지</span>
                    </h1>
                    <br>
                    <div>환영합니다.<span>${partners.part_name }</span>님</div>
                    <div><span>${partners.part_name }</span>님의 자기소개</div>
                    <div>${ partners.self_infor}</div>
                </div>
            </section>
            <hr class="m-0" />
            <!-- Experience-->
        </div>
        <div id="footer_div" style="background-color : white;">
		<jsp:include page="../footer.jsp" />
		</div>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>