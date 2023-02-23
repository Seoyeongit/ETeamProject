<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>    
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="../favicon.jsp"></jsp:include>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<link href="${pageContext.request.contextPath}/resources/css/Tip/tip.css" rel="stylesheet" />
<style>
	#main_content {
		display : table;
		width : 100%;
	}
	#sideNav, #main {
		display : table-cell;
	}
	main {
		padding-left : 50px;
	}
	#footer_div {
		position : relative;
		z-index : 900;
	}
	.navbar_forpets{
		padding-top : 9rem;
		position : absolute;
	}
</style>
</head>
<body>
	<jsp:include page="../nav.jsp" />
	<div id="main_content">
		
		<nav class="navbar navbar-expand-lg navbar-dark part-nav" id="sideNav">
            <div class="collapse navbar-collapse navbar_forpets" id="navbarResponsive">
                <ul class="navbar-nav">
                    <li class="nav-item"><a class="nav-link js-scroll-trigger" href="${pageContext.request.contextPath}/Service/choice">서비스 예약</a></li>
                    	<ul class="navbar-nav">
                    		<li class="nav-item"><span style="font-size:15px;"><a class="nav-link js-scroll-trigger" href="${pageContext.request.contextPath}/Service/normal">- 기본</a></span></li>
	                    	<li class="nav-item"><span style="font-size:15px;"><a class="nav-link js-scroll-trigger" href="${pageContext.request.contextPath}/Service/work">- 산책</a></span></li>
    	                	<li class="nav-item"><span style="font-size:15px;"><a class="nav-link js-scroll-trigger" href="${pageContext.request.contextPath}/Service/pickup">- 픽업</a></span></li>
                    	</ul>
                    <li class="nav-item"><a class="nav-link js-scroll-trigger" href="${pageContext.request.contextPath}/FindHospital/findHospital">근처 병원 찾기</a></li>
                    <li class="nav-item"><a class="nav-link js-scroll-trigger" href="${pageContext.request.contextPath}/Tip/getTipList">팁 게시판</a></li>
                </ul>
            </div>
		</nav>
		
		<main id="main" class="main">
				<section class="section">
					<div class="row align-items-top">
						<div class="col-lg-10">
								<form action="getTipList" method="post">
								<table border="1" cellpadding="0" cellspacing="0" width="700">
									<tr>
										<td align="right">
											<select name="searchCondition">
													<option value="TITLE">제목</option>
													<option value="CONTENT">내용</option>
											</select>
											<input name="searchKeyword" type="text" />
											<input  type="submit" value="검색" />
										</td>
									</tr>
								</table>
								</form>
							<c:forEach items="${tipList }" var="tip">
								<!-- Card with an image on left -->
								<div class="card mb-3" onclick="location.href='getTip?tip_seq=${ tip.tip_seq }'">
									<div class="row g-0">
										<div class="col-md-4">
											<img src="${ tip.tip_img_url }"  class="img-fluid rounded-start" alt="...">
										</div>
										<div class="col-md-8">
											<div class="card-body">
												<h5 class="card-title">${ tip.tip_title }</h5>
												<p class="card-text">${tip.tip_content }</p>
											</div>
										</div>
									</div>
								</div><!-- End Card with an image on left -->
							</c:forEach>
							<br>
							<a href="insertTip">새 글 작성</a>
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