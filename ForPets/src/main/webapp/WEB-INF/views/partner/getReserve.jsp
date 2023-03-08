<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<jsp:include page="../favicon.jsp"></jsp:include>
<meta charset="UTF-8">
	<link href="${pageContext.request.contextPath}/resources/css/partner.css" rel="stylesheet" />
    <script src="${pageContext.request.contextPath}/resources/js/partner_page.js"></script>
    <script src="http://code.jquery.com/jquery-3.1.1.js"></script>
<title>예약 일정 관리</title>
<style>
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/nav2.jsp" %>
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
    <h2 class="main-tx"><b>예약 일정 <span class="main-tx2">관리</span></b></h2>
    <form action="../CareBefore" method="post">
	<h4 class="care-before">CARE <b><span class="care-before2">BEFORE</span></b></h4>
	<table class="care-tab">
		<tr class="tab-hd">
			<th>예약 번호</th>
			<th>예약자</th>
			<th class="reser-add-hd">예약 주소</th>
			<th>예약 날짜</th>
			<th class="reser-time-hd" colspan="2">예약 시간</th>
		</tr>
		<c:forEach items="${reserveList}" var="rList">
		<c:if test="${rList.status eq 1 }">
		<tr class="tab-con">
			<td><div id="num">${ rList.reserve_num }</div></td>
			<td><div id="user">${ rList.user_id }</div></td>
			<td><div class="reser-add" id="add">${ rList.reserve_add }</div></td>
			<td><div id="date">${ rList.reserve_day }</div></td>
			<td><div class="reser-time" id="time">${ rList.reserve_time }</div></td>
			<td><input type="button" class="write-bt" onclick="location.href='../partner/detail?reserve_num=${rList.reserve_num}&user_id=${rList.user_id}';" value="확인"/></td>
			<td><input type="button" class="check-bt" onclick="location.href='../CareBefore?reserve_num=${rList.reserve_num}'" value="시작"></td>
		</tr>
		</c:if>
		</c:forEach>
	</table>
	</form>
<!-- paging -->
   <!-- <div class="text-center">
        <ul class="pagination-forpets justify-content-center">
           <c:if test="${pageMaker.prev}">
                <li class="page-item-forpets paginate_button previous">
                   <a class=" page-link-forpets" href="${pageMaker.startPage -1}">Previous</a>
                </li>
           </c:if>
           <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="num" >
                <li class="page-item-forpets paginate_button ${pageMaker.cri.pageNum == num ? "active":""} ">
                   <a class=" page-link-forpets" href="${num}">${num}</a>
                </li>
           </c:forEach>
           <c:if test="${pageMaker.next}">
                <li class="page-item-forpets paginate_button next">
                   <a class=" page-link-forpets" href="${pageMaker.endPage +1 }">Next</a>
                </li>
           </c:if>
         </ul>
     </div>
     <form id='pageForm' action="myCustBoard" method="get">
         <input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
         <input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
                     
         <input type='hidden' name='searchCondition' value='<c:out value="${ pageMaker.cri.searchCondition }"/>'> 
         <input type='hidden' name='searchKeyword'   value='<c:out value="${ pageMaker.cri.searchKeyword }"/>'>
     </form> -->
    <form action="CareIng" method="post">
	<h4 class="care-ing">CARE <b><span class="care-ing2">ING</span></b></h4>
	<table class="care-tab">
		<tr class="tab-hd">
			<th>예약 번호</th>
			<th>예약자</th>
			<th class="reser-add-hd">예약 주소</th>
			<th>예약 날짜</th>
			<th class="reser-time-hd" colspan="2">예약 시간</th>
		</tr>
		<c:forEach items="${reserveList}" var="rList">
		<c:if test="${rList.status eq 2 }">
		<tr class="tab-con">
			<td><div id="num">${ rList.reserve_num }</div></td>
			<td><div id="user">${ rList.user_id }</div></td>
			<td><div class="reser-add" id="add">${ rList.reserve_add }</div></td>
			<td><div id="date">${ rList.reserve_day }</div></td>
			<td><div class="reser-time" id="time">${ rList.reserve_time }</div></td>
			<td><input type="button" class="write-bt" onclick="location.href='../partner/detail?reserve_num=${rList.reserve_num}&user_id=${rList.user_id}';" value="확인"/></td>
			<td><input type="button" class="check-bt" onclick="location.href='../CareIng?reserve_num=${rList.reserve_num}'" value="케어"></td>
		</tr>
		</c:if>
		</c:forEach>
	</table>
	</form>
<!-- paging -->
	<!--
    <div class="text-center">
        <ul class="pagination-forpets justify-content-center">
           <c:if test="${pageMaker.prev}">
                <li class="page-item-forpets paginate_button previous">
                   <a class=" page-link-forpets" href="${pageMaker.startPage -1}">Previous</a>
                </li>
           </c:if>
           <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="num" >
                <li class="page-item-forpets paginate_button ${pageMaker.cri.pageNum == num ? "active":""} ">
                   <a class=" page-link-forpets" href="${num}">${num}</a>
                </li>
           </c:forEach>
           <c:if test="${pageMaker.next}">
                <li class="page-item-forpets paginate_button next">
                   <a class=" page-link-forpets" href="${pageMaker.endPage +1 }">Next</a>
                </li>
           </c:if>
         </ul>
     </div>
     <form id='pageForm' action="myCustBoard" method="get">
         <input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
         <input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
                     
         <input type='hidden' name='searchCondition' value='<c:out value="${ pageMaker.cri.searchCondition }"/>'> 
         <input type='hidden' name='searchKeyword'   value='<c:out value="${ pageMaker.cri.searchKeyword }"/>'>
     </form>
     -->
    <form action="CareAfter" method="post">
	<h4 class="care-after">CARE <b><span class="care-after2">AFTER</span></b></h4>
	<table class="care-tab">
		<tr class="tab-hd">
			<th>예약 번호</th>
			<th>예약자</th>
			<th class="reser-add-hd">예약 주소</th>
			<th>예약 날짜</th>
			<th class="reser-time-hd" colspan="2">예약 시간</th>
		</tr>
		<c:forEach items="${reserveList}" var="rList">
		<c:if test="${rList.status eq 3 }">
		<tr class="tab-con">
			<td><div id="num">${ rList.reserve_num }</div></td>
			<td><div id="user">${ rList.user_id }</div></td>
			<td><div class="reser-add" id="add">${ rList.reserve_add }</div></td>
			<td><div id="date">${ rList.reserve_day }</div></td>
			<td><div class="reser-time" id="time">${ rList.reserve_time }</div></td>
			<td><input type="button" class="write-bt" onclick="location.href='../partner/detail?reserve_num=${rList.reserve_num}&user_id=${rList.user_id}';" value="확인"/></td>
			<td><input type="button" class="check-bt" onclick="location.href='../CareAfter?reserve_num=${rList.reserve_num}'" value="완료"></td>
		</tr>
		</c:if>
		</c:forEach>
	</table>
	</form>
<!-- paging -->
<!-- 
    <div class="text-center">
        <ul class="pagination-forpets justify-content-center">
           <c:if test="${pageMaker.prev}">
                <li class="page-item-forpets paginate_button previous">
                   <a class=" page-link-forpets" href="${pageMaker.startPage -1}">Previous</a>
                </li>
           </c:if>
           <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="num" >
                <li class="page-item-forpets paginate_button ${pageMaker.cri.pageNum == num ? "active":""} ">
                   <a class=" page-link-forpets" href="${num}">${num}</a>
                </li>
           </c:forEach>
           <c:if test="${pageMaker.next}">
                <li class="page-item-forpets paginate_button next">
                   <a class=" page-link-forpets" href="${pageMaker.endPage +1 }">Next</a>
                </li>
           </c:if>
         </ul>
     </div>
     <form id='pageForm' action="myCustBoard" method="get">
         <input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
         <input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
                     
         <input type='hidden' name='searchCondition' value='<c:out value="${ pageMaker.cri.searchCondition }"/>'> 
         <input type='hidden' name='searchKeyword'   value='<c:out value="${ pageMaker.cri.searchKeyword }"/>'>
     </form>
     -->
	<button type="button" class="back-bt" onclick="location.href='partnerMain';">뒤로가기</button>
<script>
  	$(function(){
      $(".paginate_button a").on("click",
         function(e) {
            e.preventDefault();
            $("#pageForm").find("input[name='pageNum']").val($(this).attr("href"));
            $("#pageForm").submit();
         }
      );
   	});
</script>
</body>
</html>