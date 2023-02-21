<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>    
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객 센터</title>
</head>
<body>
<center>
	<h2>내 문의 내역</h2>
	<br>
	<hr>
	<table>
			<c:forEach items="${myCustBoard }" var="customer">
				<tr>
					<td>${ customer.cust_no }</td>
					<td align="left">
							${ customer.cust_title }</td>
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
				<td><a href="getCustomerBoard?cust_no=${ customer.cust_no }">글수정</a></td>
			<td><a href="deleteCustomer?cust_no=${ customer.cust_no }">글삭제</a></td>
			</c:forEach>
	</table>
	<hr>
	<br>
	<a href="customer.do">고객센터 돌아가기</a>
	
</center>	
</body>
</html>