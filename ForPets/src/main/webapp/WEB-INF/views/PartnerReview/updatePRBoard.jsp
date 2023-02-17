<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>    
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 수정하기</title>
</head>
<body>
	<h1>파트너 리뷰 수정 </h1>

	<form action="../updateprboard.do" method="post" >
		<input type="hidden" name="pr_num" value="${prboard.pr_num }">
		<input type="hidden" name="part_id" value="${prboard.part_id }">
		<input type="hidden" name="user_id">
		<table>
		<tr>
			<th>제목 : <input type="text" name="pr_title" value="${prboard.pr_title }"></th>
		</tr>
		<tr>
			<th>별점을 입력해 주세요 (1 ~ 5) <input type="number" name="pr_avg" value="${prboard.pr_avg}"></th>
		</tr>
		<tr>
			<td>내용을 입력해 주세요</td>
		</tr>
		<tr>	
			<td><textarea rows="15" cols="65" name="pr_content">${prboard.pr_content }</textarea></td>
		</tr>
		<tr>	
			<td colspan="2"><input type="submit" value="수정하기"></td>
			<td colspan="2"><input type="reset" value="취소"></td>
		</tr>
	</table>
	</form>
	<a href="partnerlist.do">펫트너 목록으로 돌아가기</a>
</body>
</html>