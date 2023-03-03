<%@page import="com.forpets.biz.customer.CustomerVO"%>
<%@page import="com.forpets.biz.partner.PartnerVO"%>
<%@page import="com.forpets.biz.user.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
        <%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../favicon.jsp"></jsp:include>
<meta charset="UTF-8">
<link href="${pageContext.request.contextPath}/resources/css/customer.css" rel="stylesheet" />
<title>문의 글 쓰기</title>
	<style>
		select.select{
		margin-left:62px;
		padding-left:10px;
		width:25%;
		height:36px;
		border-radius:6px;
		border:1px solid rgb(128,128,128, 0.7);
		}
		.cid{
			padding-left:14px;
		}
		.ctitle{
			padding-left:14px;
		}
		.ccontent{
			width:247%;
			resize:none;
			padding-left:14px;
			margin-bottom:5%;
		}
		.qs-con-red, .qs-con-box {
			float:left;
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
	<form action="insertCustomer.do" method="post">
	<div class="main-tb">
		<h4 class="ins-ins">문의 글 쓰기</h4>
		<hr class="insert-line"/>
		<div class="tb-ins">
			<div class="tb-ins-id">아이디<input type="text" class="cid" name="cid" 
			value="<c:choose><c:when test="${customer.part_id ne null}">${customer.part_id }</c:when><c:otherwise>${customer.user_id }</c:otherwise></c:choose>" readonly/>
			</div>
			<div><hr/></div>
			<div class="tb-ins-sel">문의 유형<select class="select">
				<option value="service">서비스</option>
				<option value="cash">결제</option>
				<option value="refund">환불</option>
			</select></div>
			<hr>
			<div class="tb-ins-tit">문의 제목<input type="text" class="ctitle" id="title" name="title"/></div>
			<div><hr/></div>
			<div class="tb-ins-con"><div class="qs-con-red">문의 내용</div><div class="qs-con-box"><textarea class="ccontent" id="content" name="content"></textarea></div></div>
		</div>
		<hr>
		<div>
		<button type="submit" class="check-in" id="cheke">확인</button>
		<button type="button" class="cancle-out" onclick="location.href='customerMain.do';">취소</button>
		</div>
	</div>
	</form>
	<br>
</body>
</html>