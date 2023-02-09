<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>    
	<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
	<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객센터 문의 목록</title>
</head>
<body>
<center>
<h1>고객센터 문의 목록</h1>
<hr>
<br>
	<table>
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
					<td>${ customer.user_id}</td>
					<td><fmt:formatDate value="${ customer.cust_date }" pattern="yyyy-MM-dd" /></td>
				</tr>
			</c:forEach>
			<tr>
			</tr>
		</table>
		<a href="customer.do">뒤로가기</a>
</center>
</body>
</html>