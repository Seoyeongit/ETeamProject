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
</head>
<body>
	<%@ include file="/WEB-INF/views/nav.jsp" %>
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
    <h2 class="main-tex">예약 일정 관리</h2>
	<h3 class="before">캐어 전</h3>
	<table>
		<tr>
			<th>예약 번호</th>
			<th>예약자</th>
			<th>예약 주소</th>
			<th>예약 날짜</th>
			<th>예약 시간</th>
		</tr>
		<c:forEach items="${reserveList}" var="rList">
		<c:if test="${rList.status eq 1 }">
		<tr>
			<td><input type="text" name="num" value="${ rList.reserve_num }" readonly /></td>
			<td><input type="text" name="user" value="${ rList.user_id }" readonly /></td>
			<td><input type="text" name="add" value="${ rList.reserve_add }" readonly /></td>
			<td><input type="text" name="date" value="${ rList.reserve_day }" readonly /></td>
			<td><input type="text" name="time" value="${ rList.reserve_time }" readonly /></td>
			<td><input type="button" onclick="location.href='../partner/detail?reserve_num=${rList.reserve_num}&user_id=${rList.user_id}';" value="확인하기"/></td>
		</tr>
		</c:if>
		</c:forEach>
	</table>
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
	<h3>캐어 중</h3>
	<table>
		<tr>
			<th>예약 번호</th>
			<th>예약자</th>
			<th>예약 주소</th>
			<th>예약 날짜</th>
			<th>예약 시간</th>
		</tr>
		<c:forEach items="${reserveList}" var="rList">
		<c:if test="${rList.status eq 2 }">
		<tr>
			<td><input type="text" name="num" value="${ rList.reserve_num }" readonly /></td>
			<td><input type="text" name="user" value="${ rList.user_id }" readonly /></td>
			<td><input type="text" name="add" value="${ rList.reserve_add }" readonly /></td>
			<td><input type="text" name="date" value="${ rList.reserve_day }" readonly /></td>
			<td><input type="text" name="time" value="${ rList.reserve_time }" readonly /></td>
			<td><input type="button" onclick="location.href='../partner/detail?reserve_num=${rList.reserve_num}&user_id=${rList.user_id}';" value="확인하기"/></td>
		</tr>
		</c:if>
		</c:forEach>
	</table>
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
	<h3>캐어 완료</h3>
	<table>
		<tr>
			<th>예약 번호</th>
			<th>예약자</th>
			<th>예약 주소</th>
			<th>예약 날짜</th>
			<th>예약 시간</th>
		</tr>
		<c:forEach items="${reserveList}" var="rList">
		<c:if test="${rList.status eq 3 }">
		<tr>
			<td><input type="text" name="num" value="${ rList.reserve_num }" readonly /></td>
			<td><input type="text" name="user" value="${ rList.user_id }" readonly /></td>
			<td><input type="text" name="add" value="${ rList.reserve_add }" readonly /></td>
			<td><input type="text" name="date" value="${ rList.reserve_day }" readonly /></td>
			<td><input type="text" name="time" value="${ rList.reserve_time }" readonly /></td>
			<td><input type="button" onclick="location.href='../partner/detail?reserve_num=${rList.reserve_num}&user_id=${rList.user_id}';" value="확인하기"/></td>
		</tr>
		</c:if>
		</c:forEach>
	</table>
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
	<input type="button" onclick="location.href='partnerMain';" value="뒤로가기"/>
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