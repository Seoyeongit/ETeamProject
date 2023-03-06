<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>    
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../favicon.jsp"></jsp:include>
<meta charset="UTF-8">
<link href="${pageContext.request.contextPath}/resources/css/customer.css" rel="stylesheet" />
<script src="http://code.jquery.com/jquery-3.1.1.js"></script>
<title>고객 센터</title>
<style>
	.cust-hd {
	margin-left:22%;
	margin-top:5%;
	}
	.my-cust-tb {
		margin-top:2%;
		width:60%;
		margin-right:auto;
		margin-left:auto;
		text-align:center;
	}
	.cust-no{
		with:5%;
	}
	.list-title {
		height:50px;
	}
	.cust-boa {
	width:250px;
	text-align:left;
	background-color:white;
	border:none;
	}
	.cust-line {
	margin-top:50px;
	border-bottom:1px solid rgb(128,128,128, 0.7);
	border-top:2px solid rgb(128,128,128, 0.7);
	height:50px;
	}
	.back-bt {
	margin-bottom:5%;
	background-color:white;
	border:1px solid rgb(128,128,128, 0.7);
	}
	.text-center{
		margin-top:5%;
	}
	.cust-boa {
		margin-right:48%;
	}
	
	.pagination-forpets {
      display: flex;
      padding-left: 0;
      list-style: none;
   }
	.page-link-forpets {
      font-weight:bold;
      text-decoration: none;
      color: #8bda8b;
      background-color: white;
      border: 1px solid #8bda8b;
      padding : 0.375rem 0.75rem
   }
   .page-item-forpets.active .page-link-forpets {
      z-index: 1;
      color: white;
      font-weight:bold;
      background-color: #8bda8b;
      border-color: #8bda8b;
    
   }
   .page-link-forpets:focus, .page-link-forpets:hover {
      color: #8bda8b;
      background-color: white;
      border-color: #8bda8b;
   }
   .page-item-forpets:first-child .page-link-forpets {
      border-top-left-radius: 0.25rem;
      border-bottom-left-radius: 0.25rem;
   }
   
   .page-item-forpets:not(:first-child) .page-link-forpets {
      margin-left: -1px;
   }
   
   .page-item-forpets:last-child .page-link-forpets {
      border-top-right-radius: 0.25rem;
      border-bottom-right-radius: 0.25rem;
   }
   .footer{
	text-align: center;
  	font-size: 0.9rem;
  	font-family: "Montserrat", -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol", "Noto Color Emoji";
	}
</style>
</head>
<body>
<%@ include file="/WEB-INF/views/nav.jsp" %>
	<form action="getCustomerList" method="post">
	<fieldset>
		<div class="mainBanner">
		<h2 class="mainText">ForPets 고객센터</h2>
			<div class="top-search-form">도움말 검색&nbsp;
				<i class="fas fa-search"></i>
				<input type="text" class="element-input" name="searchKeyword" placeholder="검색어를 입력하세요." data-game="2017090003">
			</div>
		</div>
	</fieldset>
	</form>
	<h4 class="cust-hd"><b>내 문의 내역</b></h4>
	<table class="my-cust-tb">
			<c:forEach items="${myCustBoard }" var="customer">
			<tr class="cust-line">
					<td><div class="cust-no" style="display:none">${customer.cust_no }</div></td>
					<td class="cust-tit-td"><button type="button" class="cust-boa" onclick="location.href='getCustomerBoardView?cust_no=${customer.cust_no}';">${ customer.cust_title }</button></td>
					<td><div  class="cust-id-td" style="display:none"><c:choose>
	                    <c:when test="${customer.user_id == ' '}">
	                    	<div>${customer.part_id }</div>
	                    </c:when>
	                    <c:otherwise>
	                    	<div>${customer.user_id }</div>
	                    </c:otherwise>
	                </c:choose>
	                </div>
	                </td>
					<td><fmt:formatDate value="${ customer.cust_date }" pattern="yyyy-MM-dd" /></td>
					<td>
						<c:if test="${customer.status eq null }">답변 완료</c:if>
						<c:if test="${customer.status eq 1 }">답변 대기</c:if>
						<c:if test="${customer.status eq 2 }">답변 완료</c:if>
						
					</td>
			</tr>
			</c:forEach>
	</table>
<!-- paging -->
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
	<button type="button" class="back-bt" onclick="location.href='customerMain';">뒤로가기</button>	
	<%@ include file="/WEB-INF/views/footer.jsp" %>
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