<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>    
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<link href="${pageContext.request.contextPath}/resources/css/partner_review/star.css" rel="stylesheet">
<meta charset="UTF-8">
<title>make community</title>
</head>

<body>
	<h1>파트너 리뷰 작성 페이지</h1>
	<h5>파트너 평가를 해주세요!</h5>

	<form action="../insertpartreview" class="mb-3" name="myform" id="myform" method="post" >
		<input type="hidden" name="part_id" value="${part_id }">
		<input type="hidden" name="user_id">
		<table>
		<tr>
			<th>제목 : <input type="text" name="pr_title"></th>
		</tr>
		<tr>
			<td>	
				<fieldset>
					<span class="text-bold">파트너 별점을 선택해주세요</span>
					<input type="radio" name="pr_avg" value="5" id="rate1"><label
						for="rate1">★</label>
					<input type="radio" name="pr_avg" value="4" id="rate2"><label
						for="rate2">★</label>
					<input type="radio" name="pr_avg" value="3" id="rate3"><label
						for="rate3">★</label>
					<input type="radio" name="pr_avg" value="2" id="rate4"><label
						for="rate4">★</label>
					<input type="radio" name="pr_avg" value="1" id="rate5"><label
						for="rate5">★</label>
				</fieldset>
			</td>
		</tr>
		<tr>
			<td>내용을 입력해 주세요</td>
		</tr>
		<tr>	
			<td><textarea rows="15" cols="65" name="pr_content"></textarea></td>
		</tr>
		<tr>	
			<td colspan="2"><input type="submit" value="작성하기"></td>
			<td colspan="2"><input type="reset" value="취소"></td>
		</tr>
	</table>



		</form>
		

	<a href="partnerlist">펫트너 목록으로 돌아가기</a>
	

</body>
</html>