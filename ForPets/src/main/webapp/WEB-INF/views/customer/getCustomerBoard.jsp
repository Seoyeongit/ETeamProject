<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의 글 보기</title>
</head>
<body>
	<form action="updateCustomer.do" method="post">
	<table>
		<tr>
			<td>게시글 번호</td>
			<td><input type="text" name="number" value="${ customer.cust_no}" readonly /></td>
		</tr>
		<tr>
			<td>제목</td>
			<td><input name="title" type="text" value="${ customer.cust_title}" /></td>
		</tr>
		<tr>
			<td>내용</td>
			<td><textarea name="content" cols="40" rows="10">${ customer.cust_content }</textarea></td>
		</tr>
			<td>작성자</td>
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
		<tr>
			<td>날짜</td>
			<td>${ customer.cust_date}</td>
		</tr>
		<tr>
			<td colspan="2" align="center"><input type="submit" value="글 수정" /></td>
		</tr>
	</table>
	</form>
	<hr>
		<a href="customerBoard">글쓰기</a>&nbsp;&nbsp;&nbsp;
		<a href="deleteCustomer?cust_no=${ customer.cust_no }">글삭제</a>&nbsp;&nbsp;&nbsp;
		<a href="getCustomerList">글목록</a>
	
</body>
</html>