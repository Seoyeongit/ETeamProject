<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../favicon.jsp"></jsp:include>
<meta charset="UTF-8">
<link href="${pageContext.request.contextPath}/resources/css/customer.css" rel="stylesheet" />
<title>문의 글 보기</title>
<style>
.wri-no,.wri-part,.wri-user,.wri-date{
	float:left;
	padding-left:7.2%;
	margin-top:10px;
	font-size:0.7em;
	color:rgb(128,128,128);
}
.wri-no {
	margin-left:15%;
}
.wri-part,.wri-user,.wri-date {
	padding-left:30px;
}
.get-cus-line {
	border:2px solid rgb(0,0,0);
}
.head-tit {
	margin-top:5%;
	margin-left:20%;
	color:rgba(0,0,0,0.7);
}
.get-cus-line{
	width:60%;
	margin-top:1.5%px;
	margin-left:auto;
	margin-right:auto;
}
.get-tit {
	margin-left:22%;
	font-size:1.5em;
}
.get-con {
	margin-left:22%;
	margin-top:4%;
}
.con-line {
	width:60%;
	margin-top:1.5%px;
	margin-left:auto;
	margin-right:auto;
}
.foot-line {
	width:60%;
	margin-top:4%;
	margin-left:auto;
	margin-right:auto;
}
.cust-upd{
	margin-left:305px;
}
.cust-lis{
	margin-left:47.3%;
	margin-bottom:5%;
}
.cust-upd, .cust-del{
	background-color: white;
	border-radius:5px;
	border:1px solid rgba(128,128,128,0.7);
	width:4%;
	height:40px;
}
.cust-lis {
	background-color: #8bda8b;
	color:#ffffff;
	border-radius:5px;
	border:1px solid rgba(128,128,128,0.7);
	width:4%;
	height:40px;
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
	<form action="updateCustomer" method="post">
			<input type="hidden" value="${customer.cust_no}" name="cust_no">
			<h4 class="head-tit"><b>문의 상세보기</b></h4>
			<hr class="get-cus-line">
			<input type="text" class="get-tit" name="title" value="${ customer.cust_title}"/>
			<div class="wri-no">${customer.cust_no}</div><c:choose><c:when test="${customer.user_id == ' '}"><div class="wri-part">${customer.part_id }</div></c:when>
			<c:otherwise><div class="wri-user">${customer.user_id }</div></c:otherwise></c:choose><div class="wri-date">${ customer.cust_date}</div><br>
			<hr class="con-line">
			<input type="text" class="get-con" name="content" value="${ customer.cust_content}"/>
			<hr class="foot-line">
		<input type="submit" class="cust-upd" value="완료" />
		<input type="button" class="cust-lis" onclick="location.href='myCustBoard';" value="목록"/>
	</form>
</body>
</html>