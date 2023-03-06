<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
    <head>
    	<jsp:include page="../favicon.jsp"></jsp:include>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>파트너 페이지</title>
        <link rel="icon" type="image/x-icon" href="assets/img/favicon.ico" />
        <!-- Font Awesome icons (free version)-->
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
        <!-- Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Saira+Extra+Condensed:500,700" rel="stylesheet" type="text/css" />
        <link href="https://fonts.googleapis.com/css?family=Muli:400,400i,800,800i" rel="stylesheet" type="text/css" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="${pageContext.request.contextPath}/resources/css/partner.css" rel="stylesheet" />
        <script src="${pageContext.request.contextPath}/resources/css/partner.css"></script>
    </head>
    <body id="page-top">
    	<%@ include file="/WEB-INF/views/nav2.jsp" %>
        <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-dark part-nav" id="sideNav">
            <a class="navbar-brand js-scroll-trigger" href="../partner/partnerMain">
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
        <h2 class="main-tx"><b>돌봄일지 <span class="main-tx2"> 목록</span></b></h2>
        <table class="care-tab">
		<tr class="tab-hd">
			<th>예약 번호</th>
			<th>예약자</th>
			<th class="reser-add-hd">예약 주소</th>
			<th>예약 날짜</th>
			<th class="reser-time-hd" colspan="2">예약 시간</th>
		</tr>
		<c:forEach items="${reserveListCare}" var="lCare">
		<tr class="tab-con">
			<td><div id="num">${ lCare.reserve_num }</div></td>
			<td><div id="user">${ lCare.user_id }</div></td>
			<td><div class="reser-add" id="add">${ lCare.reserve_add }</div></td>
			<td><div id="date">${ lCare.reserve_day }</div></td>
			<td><div class="reser-time" id="time">${ lCare.reserve_time }</div></td>
			<td><input type="button" class="write-bt" onclick="location.href='../partner/viewWriteCare?reserve_num=${lCare.reserve_num}&user_id=${lCare.user_id}';" value="작성하기"/></td>
		</tr>
		</c:forEach>
		</table>
			<button class="back-bt" type="button" onclick="location.href='partnerMain';">뒤로가기</button>

        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
    </body>
</html>