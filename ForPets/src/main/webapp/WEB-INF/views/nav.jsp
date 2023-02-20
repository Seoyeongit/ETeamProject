<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %> 
<head>
	     <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
        <!-- Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
        <link href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700" rel="stylesheet" type="text/css" />
        <!-- Core theme CSS (includes Bootstrap)-->
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <link href="${pageContext.request.contextPath}/resources/css/nav.css" rel="stylesheet" />

</head>
        <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-dark fixed-top navbar-shrink" id="mainNav">
            <div class="container">
                <a class="navbar-brand" href="#main"><img src="${pageContext.request.contextPath}/resources/assets/img/logo_gr.png" alt="..." /></a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    Menu
                    <i class="fas fa-bars ms-1"></i>
                </button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav text-uppercase ms-auto py-4 py-lg-0">
                        <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/Service/service">서비스</a></li>
                        <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/communitylist.do">소모임</a></li>
                        <li class="nav-item"><a class="nav-link" href="#review">리뷰보기</a></li>
                        <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/partnerlist.do">펫트너</a></li>
                        <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/customer.do">고객센터</a></li>
                       
                        <c:choose>
                        <c:when test="${role eq 'partners' }">
                        	<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/partner/partner">파트너 페이지</a></li>
                        	<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/member/logout">로그아웃</a></li>
                        </c:when>
                        
                        <c:when test="${role eq 'admin' }">
                        	<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/Admin/login">관리자 페이지</a></li>
                        	<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/member/logout">로그아웃</a></li>
                        </c:when>
                        
                        <c:when test="${member.user_id eq '' || member.user_id eq null}">
                        <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/member/login">로그인</a></li>
                        <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/member/join">회원가입</a></li></c:when>
                        
                        <c:otherwise>
                        <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/myInfo/main">마이페이지</a></li>
                        <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/member/logout">로그아웃</a></li>
                        </c:otherwise>
                        </c:choose>
                   
                    </ul>
                </div>
            </div>
        </nav>
        
        
      <!-- Bootstrap core JS-->
 		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>        <!-- Core theme JS-->
        <script src="${pageContext.request.contextPath}/resources/js/nav.js"></script>
        <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
        <!-- * *                               SB Forms JS                               * *-->
        <!-- * * Activate your form at https://startbootstrap.com/solution/contact-forms * *-->
        <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
        <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
