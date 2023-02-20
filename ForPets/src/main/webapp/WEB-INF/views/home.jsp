<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Forpets</title>
        <!-- Favicon-->
        <link rel="icon" type="image" href="${pageContext.request.contextPath}/resources/assets/img/dogicon2.png" />
        <!-- Font Awesome icons (free version)-->
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
        <!-- Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
        <link href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700" rel="stylesheet" type="text/css" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="${pageContext.request.contextPath}/resources/css/home.css" rel="stylesheet" />
    </head>
    <body id="page-top">
        <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav">
            <div class="container">
                <a class="navbar-brand" href="#main"><img src="${pageContext.request.contextPath}/resources/assets/img/forpetsicon.png" alt="..." /></a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    Menu
                    <i class="fas fa-bars ms-1"></i>
                </button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav text-uppercase ms-auto py-4 py-lg-0">
                        <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/Service/service">서비스</a></li>
                        <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/communitylist">소모임</a></li>
                        <li class="nav-item"><a class="nav-link" href="#review">리뷰보기</a></li>
                        <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/partnerlist">펫트너</a></li>
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
        <!-- Masthead-->
        <header class="masthead">
            <div class="container">
                <div class="masthead-subheading">당신과 아이의 시간이</div>
                <div class="masthead-subheading"> 함께 행복하기를 응원합니다.</div>
            </div>
        </header>
        <!-- Services-->
        <section class="page-section" id="service">
            <div class="container">
                <div class="text-center">
                    <h2 class="section-heading text-uppercase">Services</h2>
                    <h3 class="section-subheading text-muted">ForPets에서는 이런 서비스를 제공합니다.</h3>
                </div>
                <div class="row text-center">
                    <div class="col-md-4">
                        <span class="fa-stack fa-4x">
                            <img src="${pageContext.request.contextPath}/resources/assets/free-icon-dog-6381349.png" alt="산책 아이콘" style="width:80%" height="80%">
                        </span>
                        <h4 class="my-3">산책</h4>
                        <div class="text-muted">바쁜 당신과 혼자 남겨지는 당신의 아이.</div>
                        <div class="text-muted">ForPets가 해결 해드리겠습니다. 평소 자주 다니던</div>
                        <div class="text-muted">친숙한 산책 경로로 기분좋은 산책을 맡겨보세요</div>
                    </div>
                    <div class="col-md-4">
                        <span class="fa-stack fa-4x">
                            <img src="${pageContext.request.contextPath}/resources/assets/free-icon-hospital-5217248.png" alt="병원 아이콘" style="width: 80%" height="80%">
                        </span>
                        <h4 class="my-3">병원 방문</h4>
                        <p class="text-muted">언제 아플지 모르는 우리 아이. 평일엔 시간을 내지 못하는 당신을 위해 ForPets에서 대신 병원 방문 , 진료, 치료 과정 하나하나 실시간으로 남겨드립니다.</p>
                    </div>
                    <div class="col-md-4">
                        <span class="fa-stack fa-4x">
                            <img src="${pageContext.request.contextPath}/resources/assets/free-icon-speech-bubble-1078011.png" alt="대화 아이콘" style="width: 80%" height="80%">
                        </span>
                        <h4 class="my-3">소모임</h4>
                        <p class="text-muted">당신과 비슷한 걱정, 고민을 가진 사람들과 대화하며 위로받고 타인의 아이도 구경하고 당신의 아이를 자랑하는 소모임 커뮤니티를 이용해보세요.</p>
                    </div>
                </div>
            </div>
        </section>
        <!-- 소모임 게시판 -->
        <section class="page-section bg-light" id="community">
            <div class="container">
                <div class="text-center">
                    <h2 class="section-heading text-uppercase">community</h2>
                    <h3 class="section-subheading text-muted">다른 아이들의 하루와 당신의 아이의 하루를 공유해보세요.</h3>
                </div>
                <div class="row">
                    <div class="col-lg-4 col-sm-6 mb-4">
                        <!-- 소모임 1-->
                        <div class="community-board">
                            <a class="community-link" data-bs-toggle="modal" href="#communityModal1">
                                <div class="community-hover">
                                    <div class="community-hover-content"></div>
                                </div>
                                <img class="img-fluid" src="${pageContext.request.contextPath}/resources/assets/img/commu/dogcoum.jpg" alt="..." style="width: 640px" height="420px" />
                            </a>
                            <div class="community-caption">
                                <div class="community-caption-heading">강아지</div>
                                <div class="community-caption-subheading text-muted">소형견 모임</div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-sm-6 mb-4">
                        <!-- 소모임 2-->
                        <div class="community-board">
                            <a class="community-link" data-bs-toggle="modal" href="#portfolioModal2">
                                <div class="community-hover">
                                    <div class="community-hover-content"></div>
                                </div>
                                <img class="img-fluid" src="${pageContext.request.contextPath}/resources/assets/img/commu/catcomm1.jfif" alt="..." style="width: 640px" height="420px" />
                            </a>
                            <div class="community-caption">
                                <div class="community-caption-heading">고양이</div>
                                <div class="community-caption-subheading text-muted">냥집사 모임</div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-sm-6 mb-4">
                        <!-- Portfolio item 3-->
                        <div class="community-board">
                            <a class="community-link" data-bs-toggle="modal" href="#portfolioModal3">
                                <div class="community-hover">
                                    <div class="community-hover-content"></div>
                                </div>
                                <img class="img-fluid" src="${pageContext.request.contextPath}/resources/assets/img/commu/rabbitcomm.webp" alt="..." style="width: 640px" height="420px"/>
                            </a>
                            <div class="community-caption">
                                <div class="community-caption-heading">토끼</div>
                                <div class="community-caption-subheading text-muted">토끼집사 모임</div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-sm-6 mb-4 mb-lg-0">
                        <!-- Portfolio item 4-->
                        <div class="community-board">
                            <a class="community-link" data-bs-toggle="modal" href="#portfolioModal4">
                                <div class="community-hover">
                                    <div class="community-hover-content"></div>
                                </div>
                                <img class="img-fluid" src="${pageContext.request.contextPath}/resources/assets/img/commu/dogcomm2.png" alt="..." />
                            </a>
                            <div class="community-caption">
                                <div class="community-caption-heading">강아지</div>
                                <div class="community-caption-subheading text-muted">강아지 사교모임</div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-sm-6 mb-4 mb-sm-0">
                        <!-- Portfolio item 5-->
                        <div class="community-board">
                            <a class="community-link" data-bs-toggle="modal" href="#portfolioModal5">
                                <div class="community-hover">
                                    <div class="community-hover-content"></div>
                                </div>
                                <img class="img-fluid" src="${pageContext.request.contextPath}/resources/assets/img/commu/catcomm2.jpg" alt="..." />
                            </a>
                            <div class="community-caption">
                                <div class="community-caption-heading">고양이</div>
                                <div class="community-caption-subheading text-muted">우리애가 제일 별나요</div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-sm-6">
                        <!-- Portfolio item 6-->
                        <div class="community-board">
                            <a class="community-link" data-bs-toggle="modal" href="#portfolioModal6">
                                <div class="community-hover">
                                    <div class="community-hover-content"></div>
                                </div>
                                <img class="img-fluid" src="${pageContext.request.contextPath}/resources/assets/img/commu/dogcomm3.webp" alt="..." />
                            </a>
                            <div class="community-caption">
                                <div class="community-caption-heading">대형견</div>
                                <div class="community-caption-subheading text-muted">대형견 모임</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- review-->
        <section class="page-section" id="review">
            <div class="container">
                <div class="text-center">
                    <h2 class="section-heading text-uppercase">review</h2>
                    <h3 class="section-subheading text-muted">여러가지 후기들을 볼 수 있습니다.</h3>
                </div>
                <ul class="timeline">
                    <li>
                        <div class="timeline-image"><img class="rounded-circle img-fluid" src="${pageContext.request.contextPath}/resources/assets/img/review/dog1.jfif" alt="..." /></div>
                        <div class="timeline-panel">
                            <div class="timeline-heading">
                                <h4>2023년 1월 24일</h4>
                                <h4 class="subheading">산책 서비스 후기</h4>
                            </div>
                            <div class="timeline-body"><p class="text-muted">산책로 자동 지정 시스템과 매우 친절한 파트너 분 덕분에 하루 마음 편히 저의 시간을 가지는 날이었어요~ 처음엔 우리 아이를 다른사람 손에 맡긴다는게 조금 찝찝한 마음도 있었는데 한번 맡겨보고 나니 안심하게 되었어요 앞으로도 자주 이용 할것 같습니다.</p></div>
                        </div>
                    </li>
                    <li class="timeline-inverted">
                        <div class="timeline-image"><img class="rounded-circle img-fluid" src="${pageContext.request.contextPath}/resources/assets/img/review/dog2.jfif" alt="..." /></div>
                        <div class="timeline-panel">
                            <div class="timeline-heading">
                                <h4>2023년 1월 26일</h4>
                                <h4 class="subheading">병원 방문 서비스 후기</h4>
                            </div>
                            <div class="timeline-body"><p class="text-muted">병원 방문 서비스 후기 내용(대충 만족 한다는 글)</p></div>
                        </div>
                    </li>
                    <li>
                        <div class="timeline-image"><img class="rounded-circle img-fluid" src="${pageContext.request.contextPath}/resources/assets/img/review/cat1.jfif" alt="..." /></div>
                        <div class="timeline-panel">
                            <div class="timeline-heading">
                                <h4>2023년 1월 30일</h4>
                                <h4 class="subheading">서비스 후기</h4>
                            </div>
                            <div class="timeline-body"><p class="text-muted">서비스 후기 내용(대충 좋았다는 글)</p></div>
                        </div>
                    </li>
                    <li class="timeline-inverted">
                        <div class="timeline-image"><img class="rounded-circle img-fluid" src="${pageContext.request.contextPath}/resources/assets/img/review/cat2.jfif" alt="..." /></div>
                        <div class="timeline-panel">
                            <div class="timeline-heading">
                                <h4>2023년 2월 10일</h4>
                                <h4 class="subheading">병원 방문 서비스 후기</h4>
                            </div>
                            <div class="timeline-body"><p class="text-muted">병원 방문 서비스 후기 내용(너무 인상적이었다는 글)</p></div>
                        </div>
                    </li>
                    <li class="timeline-inverted">
                        <div class="timeline-image">
                            <h4>
                                <a>review</br>
                                 more</br>
                                 ...
                                </a>
                             </h4>
                        </div>
                    </li>
                </ul>
            </div>
        </section>
       
        
        <!-- Footer-->
        <footer class="footer py-4">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-lg-4 text-lg-start">ForPets E조 프로젝트</div>
                    <div class="col-lg-4 my-3 my-lg-0">
                        <a class="btn btn-dark btn-social mx-2" href="#!" aria-label="Twitter"><i class="fab fa-twitter"></i></a>
                        <a class="btn btn-dark btn-social mx-2" href="#!" aria-label="Facebook"><i class="fab fa-facebook-f"></i></a>
                        <a class="btn btn-dark btn-social mx-2" href="#!" aria-label="LinkedIn"><i class="fab fa-linkedin-in"></i></a>
                    </div>
                    <div class="col-lg-4 text-lg-end">
                        <a class="link-dark text-decoration-none me-3" href="#!">연은비</a>
                        <a class="link-dark text-decoration-none me-3" href="#!">이서연</a>
                        <a class="link-dark text-decoration-none me-3" href="#!">이도은</a>
                        <a class="link-dark text-decoration-none me-3" href="#!">임동진</a>
                        <a class="link-dark text-decoration-none me-3" href="#!">최지혁</a>
                        <a class="link-dark text-decoration-none" href="#!">정영현</a>
                    </div>
                </div>
            </div>
        </footer>
       
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="${pageContext.request.contextPath}/resources/js/home.js"></script>
        <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
        <!-- * *                               SB Forms JS                               * *-->
        <!-- * * Activate your form at https://startbootstrap.com/solution/contact-forms * *-->
        <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
        <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
    </body>
</html>
