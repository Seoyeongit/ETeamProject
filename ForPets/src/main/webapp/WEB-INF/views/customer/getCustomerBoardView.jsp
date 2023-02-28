<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
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
div.get-tit {
	margin-left:22%;
	font-size:1.5em;
}
div.get-con {
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
	margin-left:51%;
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
	<fieldset>
		<div class="mainBanner">
		<h2 class="mainText">ForPets 고객센터</h2>
			<div class="top-search-form">도움말 검색&nbsp;
				<i class="fas fa-search"></i>
				<input type="text" class="element-input" id="searchKey" placeholder="검색어를 입력하세요." data-game="2017090003">
			</div>
		</div>
	</fieldset>
		<form action="getCustomerBoard" method="post">
			<h4 class="head-tit"><b>문의 상세보기</b></h4>
			<hr class="get-cus-line">
			<div class="get-tit" id="title">${ customer.cust_title}</div>
			<div class="wri-no">${customer.cust_no}</div><c:choose><c:when test="${customer.user_id == ' '}"><div class="wri-part">${customer.part_id }</div></c:when>
			<c:otherwise><div class="wri-user">${customer.user_id }</div></c:otherwise></c:choose><div class="wri-date">${ customer.cust_date}</div><br>
			<hr class="con-line">
			<div class="get-con" id="content">${ customer.cust_content}</div>
			<hr class="foot-line">
		
		<input type="button" class="cust-upd cust-del" onclick="location.href='deleteCustomer?cust_no=${ customer.cust_no }';" value="삭제"/>
		<input type="button" class="cust-lis" onclick="location.href='myCustBoard';" value="목록"/>
		</form>
			<div class="">${ customerRe.cust_content }</div>
		<c:choose>
			<c:when test="${role eq 'admin' }">
				<div class="comment">
					<form action="insertCustomerRe" method="post">
						<input type="hidden" name="cust_no" value="${customer.cust_no }">
						<input type="hidden" name="admin">
						<input type="text" class="Re-box" name="content" placeholder="댓글을 입력해 주세요."/>
						<input type="submit" value="댓글 작성하기" class="btn" style="background-color:#19CE60; color:white; float:right;">
					</form>
				</div>
			</c:when>
		</c:choose>
</body>
</html>