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

<form action="getCustomerList" method="post">
		<table border="1" cellpadding="0" cellspacing="0" width="700">
			<tr>
				<td align="right">
					<select name="searchCondition">
							<option value="TITLE">제목</option>
							<option value="CONTENT">내용</option>
					</select>
					<input name="searchKeyword" type="text" />
					<input  type="submit" value="검색" />
				</td>
			</tr>
		</table>
		</form>
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
		<a href="customer.do">뒤로가기</a>
</center>
</body>
</html>