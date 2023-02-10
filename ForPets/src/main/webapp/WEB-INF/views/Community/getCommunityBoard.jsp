<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>    
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Community board</title>
</head>
<body>
	<h1>소모임 상세보기</h1>
	
	<h4>소모임을 찾고, 설문지를 작성하세요!</h4>
	

		<table>
		 	<tr>
		 		<th>제목</th>
		 		<td>${communityboard.c_title }</td>
		 	</tr>
		 	<tr>
		 		<th>내용</th>
		 		<td>${communityboard.c_content }</td>
		 	</tr>
		 </table>
		 		
		 		
		
		
		<c:forEach items="${getdat }" var="gd">
		
		<hr>
		
		<table>
			<tr>
				<th>작성자 : </th>
				<th>${gd.user_id } / ${gd.d_date }</th>
			</tr>
			<tr>
				<td>댓글 내용 : </td>
				<td>${gd.d_content }</td>
			</tr>
		</table>
		</c:forEach>
	
	<form action="../insertcomdat.do" method="post">
		<input type="hidden" name="d_code" value="${communityboard.c_code }">
		<input type="hidden" name="user_id">
		<table>
			<tr>
				<td><textarea rows="5" cols="50" name="d_content"></textarea></td>
				<td><input type="submit" value="댓글 작성하기">
			</tr>
		</table>
	</form>

		

	<a href="../updatecommunity.do/${communityboard.c_code }"><input type="button" value="수정"></a>
	<a href="../deletecommunity.do/${communityboard.c_code }"><input type="button" value="삭제"></a>
	<a href="../communitylist.do">글 목록 가기</a>
	
	
</body>
</html>