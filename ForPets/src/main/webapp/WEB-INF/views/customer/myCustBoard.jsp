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
<title>고객 센터</title>
<style>
	.cust-hd {
	margin-left:30%;
	margin-top:5%;
	}
	.my-cust-tb {
		margin-top:15px;
		width:60%;
		margin-right:auto;
		margin-left:auto;
		text-align:center;
	}
	.cust_hr {
	border:1px solid black;
	width:60%;
	margin-left:20%;
	}
	.cust-no{
		with:5%;
	}
	.cust-boa {
	width:250px;
	text-align:left;
	background-color:white;
	border:none;
	}
	.cust-line {
	border-bottom:1px solid rgb(128,128,128, 0.7);
	}
	.back-bt {
	background-color:white;
	border:1px solid rgb(128,128,128, 0.7);
	}
</style>
</head>
<body>
<%@ include file="/WEB-INF/views/nav.jsp" %>
	<fieldset>
		<div class="mainBanner">
		<h2 class="mainText">ForPets 고객센터</h2>
			<div class="top-search-form">도움말 검색&nbsp;
				<i class="fas fa-search"></i>
				<input type="text" class="element-input" id="searchKey" placeholder="검색어를 입력하세요." data-game="2017090003">
			</div>
		</div>
	</fieldset>
	<h4 class="cust-hd">내 문의 내역</h4>
	<hr class="cust_hr">
	<table class="my-cust-tb">
			<c:forEach items="${myCustBoard }" var="customer">
			<tr class="cust-line">
					<td><div class="cust-no">${customer.cust_no }</div></td>
					<td class="cust-tit-td"><button type="button" class="cust-boa" onclick="location.href='getCustomerBoardView?cust_no=${customer.cust_no}';">${ customer.cust_title }</button></td>
					<td><div  class="cust-id-td"><c:choose>
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
			</tr>
			</c:forEach>
	</table>
	<button type="button" class="back-bt" onclick="location.href='customer.do';">뒤로가기</button>	
</body>
</html>