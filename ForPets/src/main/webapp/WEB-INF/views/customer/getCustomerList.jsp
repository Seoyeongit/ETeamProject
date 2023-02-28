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
<title>고객센터 문의 목록</title>
</head>
<body>
<%@ include file="/WEB-INF/views/nav.jsp" %>
<div class="main-ban">
<h2>고객센터 문의 목록</h2>
</div>
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
					<td align="left"><a href="getCustomerBoard?cust_no=${ customer.cust_no }">
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
		<button class="back-bt" type="button" onclick="location.href='customerMain';">뒤로가기</button>
</body>
</html>