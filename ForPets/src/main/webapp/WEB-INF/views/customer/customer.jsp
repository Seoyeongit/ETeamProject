<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${pageContext.request.contextPath}/resources/css/customer.css" rel="stylesheet" />
<title>ForPets 고객센터</title>
<style>
	.footer {
  text-align: center;
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
	<h5 class="qs-text">자주 묻는 질문
	<span class="qs-text-bt">
	<button type="button"  onclick="location.href='myCustBoard.do'" name="myCust">내 문의 내역</button>
	<button type="button"  onclick="location.href='customerBoard.do'" name="customerBoard" >문의 글 쓰기</button>
	</span>
	</h5>
	<form action="/customerMain" method="post">
	<table class="qs-box font">
		<tr>
			<td><button type="button" onclick="location.href='getCustomerList';">매칭시간이 오래 걸리지는 않나요?</button></td>
			<td><button type="button" onclick="location.href='getCustomerList';">매칭시간이 오래 걸리지는 않나요?</button></td>
			<td><button type="button" onclick="location.href='getCustomerList';">매칭시간이 오래 걸리지는 않나요?</button></td>
			<td><button type="button" onclick="location.href='getCustomerList';">매칭시간이 오래 걸리지는 않나요?</button></td>
			<td><button type="button" onclick="location.href='getCustomerList';">매칭시간이 오래 걸리지는 않나요?</button></td>
		</tr>
		<tr>
			<td><button type="button" onclick="location.href='getCustomerList';">매칭시간이 오래 걸리지는 않나요?</button></td>
			<td><button type="button" onclick="location.href='getCustomerList';">매칭시간이 오래 걸리지는 않나요?</button></td>
			<td><button type="button" onclick="location.href='getCustomerList';">매칭시간이 오래 걸리지는 않나요?</button></td>
			<td><button type="button" onclick="location.href='getCustomerList';">매칭시간이 오래 걸리지는 않나요?</button></td>
			<td><button type="button" onclick="location.href='getCustomerList';">매칭시간이 오래 걸리지는 않나요?</button></td>
		</tr>
	</table>
	</form>
	<br>
	<%@ include file="/WEB-INF/views/footer.jsp" %>
</body>
</html>