<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>    
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
@charset "UTF-8";

#myform fieldset{
    display: inline-block;
    direction: rtl;
    border:0;
}
#myform fieldset legend{
    text-align: right;
}
#myform input[type=radio]{
    display: none;
}
#myform label{
    font-size: 3em;
    color: transparent;
    text-shadow: 0 0 0 #f0f0f0;
}

#myform input[type=radio]:checked ~ label{
    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}
#reviewContents {
    width: 100%;
    height: 150px;
    padding: 10px;
    box-sizing: border-box;
    border: solid 1.5px #D3D3D3;
    border-radius: 5px;
    font-size: 16px;
    resize: none;
}
</style>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js" type="text/javascript"></script>
<title>펫트너 리뷰</title>
</head>
<body>
<h1>펫트너 리뷰</h1>
	<h5>펫트너를 평가해주세요!</h5>

		<h3>${prList } 펫트너</h3>
		<form class="mb-3" name="myform" id="myform" method="post" >
		<p>파트너 평균 평점 ${avg }점</p>
			<fieldset>
						<input type="radio" name="pr_avg" value="5" id="rate5" onclick="return(false);"><label
							for="rate1">★</label>
						<input type="radio" name="pr_avg" value="4" id="rate4"  onclick="return(false);"><label
							for="rate2">★</label>
						<input type="radio" name="pr_avg" value="3" id="rate3"  onclick="return(false);"><label
							for="rate3">★</label>
						<input type="radio" name="pr_avg" value="2" id="rate2"  onclick="return(false);"><label
							for="rate4">★</label>
						<input type="radio" name="pr_avg" value="1" id="rate1"  onclick="return(false);"><label
							for="rate5">★</label>
					</fieldset>
					<script type="text/javascript">
						$('input#rate${avg }').prop("checked", true);
					</script>
		</form>
		<table>
			<tr>
				<th>글 번호</th>
				<th>평점</th>
				<th>리뷰 제목</th>
				<th>아이디</th>
				<th>작성 날짜</th>
			</tr>
			<c:forEach items="${reviewList }" var="rl">
			<tr>
				<td>${rl.pr_num }</td>
				<td>${rl.pr_avg }</td>
				<td><a href="../viewpartreview/${rl.pr_num }">${rl.pr_title }</a></td>
				<td>${rl.user_id }</td>
				<td>${rl.pr_date }</td>
			</tr>
			</c:forEach>
		</table>

	<a href="../createpartreview/${part_id }"><input type="button" value="글 작성하기"></a>
</body>
</html>