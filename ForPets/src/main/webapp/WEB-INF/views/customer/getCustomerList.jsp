<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>    
	<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
	<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${pageContext.request.contextPath}/resources/css/customer.css" rel="stylesheet" />
<script src="http://code.jquery.com/jquery-3.1.1.js"></script>
<title>고객센터 문의 목록</title>
<style>
	.text-center {
		margin-top:4%;
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
<br>
<form action="getCustomerList" method="post">
		<div>
			<div class="list-sel" align="right">
				<select class="li-sel" name="searchCondition">
						<option value="TITLE">제목</option>
						<option value="CONTENT">내용</option>
				</select>
				<input class="sel-sear" name="searchKeyword" type="text" />
				<input class="sel-btn" type="submit" value="검색" />
			</div>
		</div>
		</form>
		<table class="list-tb">
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
			</tr>
			<c:forEach items="${CustList }" var="customer">
				<tr>
					<td>${ customer.cust_no }</td>
					<td align="left"><a href="getCustomerBoardView?cust_no=${ customer.cust_no }">
							${ customer.cust_title }</a></td>
					<td>
					<c:choose>
	                    <c:when test="${customer.user_id == ' '}">
	                    	<div>${customer.part_id }</div>
	                    </c:when>
	                    <c:otherwise>
	                    	<div>${customer.user_id }</div>
	                    </c:otherwise>
	                </c:choose>
	                </td>
					<td><fmt:formatDate value="${ customer.cust_date }" pattern="yyyy-MM-dd" /></td>
				</tr>
			</c:forEach>
			<tr>
			</tr>
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
                     <form id='pageForm' action="getCustomerList" method="get">
                        <input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
                        <input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
                     
                        <input type='hidden' name='searchCondition' value='<c:out value="${ pageMaker.cri.searchCondition }"/>'> 
                        <input type='hidden' name='searchKeyword'   value='<c:out value="${ pageMaker.cri.searchKeyword }"/>'>
                     </form>
		<button class="back-bt" type="button" onclick="location.href='customerMain';">뒤로가기</button>
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