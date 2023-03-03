<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../favicon.jsp"></jsp:include>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	.footer {
		text-align : center; !important;
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
                    <li class="nav-item"><a class="nav-link js-scroll-trigger active" href="${pageContext.request.contextPath}/Tip/getTipList">팁 게시판</a></li>
                </ul>
            </div>
		</nav>
		
		<main id="main" class="main">
				<section class="section">
					<div class="row align-items-top col-sm-10">
						<div class="col-lg-12">
							<form action="updateTip" method="post">
								<input name="tip_seq" type="hidden" value="${ tip.tip_seq }"/>
								<div class="col-sm-12">
									<iframe width="100%" height="500" src="${tip.tip_video }" frameborder="0" allow="accelerometer; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
								</div>
								<c:choose>
									<c:when test="${role eq 'admin' }">
										<!-- 관리자의 경우 -->
										<div class="mb-3 row">
								            <h5><b>제목</b></h5>
								            <div class="col-sm-12 pb-1">
								            	<div class="col-sm-12">
								                	<input type="text" name="tip_title" value="${tip.tip_title }" class="form-control">
								            	</div>
								            </div>
								            <div class="col-sm-12 pb-1">
								            	<h5><b>동영상 URL</b></h5>
								            	<div class="col-sm-12">
								                	<input type="text" name="tip_video" value="${tip.tip_video }" class="form-control">
								            	</div>
								            </div>
								            <div class="col-sm-12 pb-1">
								            	<h5><b>내용</b></h5>
								            	<div class="col-sm-12">
								                	<textarea name="tip_content" class="form-control col-sm-12" rows="10" style="resize:none;">${tip.tip_content }</textarea>
								            	</div>
								            </div>
								            <div class="col-12">
								            	<div class="col-sm-3 flex-fill" style="float:right;">
													<input type="button" class="form-control btn" 
													style="background-color:#8bda8b; color:white;" onclick="location.href='deleteTip?tip_seq=${ tip.tip_seq }'" value="글 삭제">
												</div>
												<div class="col-sm-3 flex-fill" style="float:right;">
													<input type="submit" class="form-control btn" 
													style="background-color:#8bda8b; color:white;" value="글 수정">
												</div>
											</div>
								        </div>
									</c:when>
									
									<c:otherwise>
										<!-- 회원 및 비회원의 경우 -->
										<div class="col-sm-12">
											<h5><b><span id="tip_title" style="font-size:1.5rem;">${ tip.tip_title }</span></b></h5>
											<span class="align-top" style="font-size:0.7rem;">조회수 : ${ tip.tip_hit +1 }회</span>
											<c:choose>
						                        <c:when test="${tip.tip_create_date eq tip.tip_update_date || tip.tip_update_date eq null}">
														<span class="align-top" style="font-size:0.7rem;">등록일 : ${ tip.tip_create_date }</span><br>
						                        </c:when>
						                        <c:otherwise>
														<span class="align-top" style="font-size:0.7rem;">수정일 : ${ tip.tip_update_date }</span><br>
						                        </c:otherwise>
								            </c:choose>
											<span id="tip_content">${ tip.tip_content }</span>
										</div>
										<div class="col-12">
											<div class="col-sm-3 flex-fill" style="float:right;">
												<input type="button" class="form-control btn" 
												style="background-color:#8bda8b; color:white;" onclick="location.href='getTipList'" value="글 목록">
											</div>
										</div>	
									</c:otherwise>
								</c:choose>
							</form>
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