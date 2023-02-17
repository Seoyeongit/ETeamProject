<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>    
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js" type="text/javascript"></script>
<title>PartnerReview board</title>
</head>
<body>
	<h1>파트너 리뷰 상세보기</h1>
	
	<h4>파트너에 대한 칭찬글이나 평가를 확인해 보세요!</h4>
	

		<table>
		 	<tr>
		 		<th>제목</th>
		 		<td>${prboard.pr_title }</td>
		 	</tr>
		 	<tr>
		 		<th>평점</th>
		 		<td>${prboard.pr_avg }</td>
		 	</tr>
		 	<tr>
		 		<th>내용</th>
		 		<td>${prboard.pr_content }</td>
		 	</tr>
		 </table>
		 
	<a href="../updatepr.do/${prboard.pr_num }"><input type="button" value="수정"></a>
	<a href="../deletepr.do/${prboard.pr_num}"><input type="button" value="삭제"></a>		

</body>
</html>