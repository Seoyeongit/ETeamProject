<%@page import="com.forpets.biz.customer.CustomerVO"%>
<%@page import="com.forpets.biz.partner.PartnerVO"%>
<%@page import="com.forpets.biz.user.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${pageContext.request.contextPath}/resources/css/customer.css" rel="stylesheet" />
<title>문의 글 쓰기</title>
	<style>
		select.select{
		margin-left:62px;
		padding-left:10px;
		width:25%;
		height:30px;
	}
	</style>
</head>
<body>
<%@ include file="/WEB-INF/views/nav.jsp" %>
	<fieldset>
		<div class="mainBanner">
		<h2 class="mainText">ForPets 고객센터</h2>
			<div class="top-search-form">도움말 검색&nbsp;
				<i class="element-svg icon-search size-24"></i>
				<input type="text" class="element-input" id="searchKey" placeholder="검색어를 입력하세요." data-game="2017090003">
			</div>
		</div>
	</fieldset>
	<br>
	<div class="main-tb">
		<h4 class="ins-ins">문의 글 쓰기</h4>
		<hr class="insert-line"/>
		<div class="tb-ins">
			<div class="tb-ins-id">아이디<input type="text" class="cid" name="cid" value="
				<c:choose>
		             <c:when test="${customer.user_id == ' '}">
		                 <div>${customer.part_id }</div>
		             </c:when>
		             <c:otherwise>
		                 <div>${customer.user_id }</div>
		             </c:otherwise>
		         </c:choose>"/></div>
			<div><hr/></div>
			<div class="tb-ins-sel">문의 유형<select class="select">
				<option value="service">서비스</option>
				<option value="cash">결제</option>
				<option value="refund">환불</option>
			</select></div>
			<hr>
			<div class="tb-ins-tit">문의 제목<input type="text" class="ctitle" id="title" name="title"/></div>
			<div><hr/></div>
			<div class="tb-ins-con">문의 내용<input type="text" class="ccontent" id="content" name="content"/></div>
		</div>
		<hr/>
		<div>
		<button type="submit" class="check-in" id="cheke" onclick="location.href='insertCustomer.do';">확인</button>
		<button type="button" class="cancle-out" onclick="location.href='customerMain.do';">취소</button>
		</div>
	</div>
	<br>
</body>
</html>