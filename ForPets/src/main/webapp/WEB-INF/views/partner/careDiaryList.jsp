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
    	<%@ include file="/WEB-INF/views/nav.jsp" %>
        <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-dark part-nav" id="sideNav">
            <a class="navbar-brand js-scroll-trigger" href="#page-top">
                <span class="d-block d-lg-none">${partners.part_name }</span>
                <span class="d-none d-lg-block"><img class="img-fluid img-profile rounded-circle mx-auto mb-2" src="assets/img/profile.jpg" alt="..." /></span>
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
            <div class="collapse navbar-collapse" id="navbarResponsive">
                <ul class="navbar-nav">
                    <li class="nav-item"><a class="nav-link js-scroll-trigger" href="${pageContext.request.contextPath}/partner/modifyyy">정보 수정</a></li>
                    <li class="nav-item"><a class="nav-link js-scroll-trigger" href="${pageContext.request.contextPath}/partner/careDiaryList">돌봄 일지 목록</a></li>
                    <li class="nav-item"><a class="nav-link js-scroll-trigger" href="${pageContext.request.contextPath}/partnerlist.do">별점 및 리뷰보기</a></li>
                    <li class="nav-item"><a class="nav-link js-scroll-trigger" href="${pageContext.request.contextPath}/partner/getReserve">예약 일정 관리</a></li>
                </ul>
            </div>
        </nav>
        <!-- Page Content-->
        <br>
        <br>
        <br>
        <br>
        <br>
        <table>
		<tr>
			<th>예약 번호</th>
			<th>예약자</th>
			<th>예약 주소</th>
			<th>예약 날짜</th>
			<th>예약 시간</th>
		</tr>
		<c:forEach items="${reserveListCare}" var="lCare">
		<c:if test="${member.user_id ne null}">
		<tr>
			<td><input type="text" name="num" value="${ lCare.reserve_num }" readonly /></td>
			<td><input type="text" name="user" value="${ lCare.user_id }" readonly /></td>
			<td><input type="text" name="add" value="${ lCare.reserve_add }" readonly /></td>
			<td><input type="text" name="date" value="${ lCare.reserve_day }" readonly /></td>
			<td><input type="text" name="time" value="${ lCare.reserve_time }" readonly /></td>
			<td><input type="button" onclick="location.href='../partner/viewWriteCare?reserve_num=${lCare.reserve_num}&user_id=${lCare.user_id}';" value="돌봄일지 작성하기"/></td>
		</tr>
		</c:if>
		</c:forEach>
		<tr>
			<td><input type="button" onclick="location.href='partnerMain';" value="뒤로가기"/></td>
		</tr>
		</table>
            <hr class="m-0" />
            <!-- Experience-->
            
        </div>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
    </body>
</html>