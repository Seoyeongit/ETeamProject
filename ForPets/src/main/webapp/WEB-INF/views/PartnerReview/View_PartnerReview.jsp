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
<title>PartnerReview board</title>
</head>
<body>
	<h1>파트너 리뷰 상세보기</h1>
	
	<h4>파트너에 대한 칭찬글이나 평가를 확인해 보세요!</h4>
	
	<form class="mb-3" name="myform" id="myform" method="post" >
		<table>
		 	<tr>
		 		<th>제목</th>
		 		<td>${prboard.pr_title }</td>
		 	</tr>
		 	<tr>
		 		<th>평점</th>
				<td>
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
						$('input#rate${prboard.pr_avg}').prop("checked", true);
					</script>
				</td>
		 	</tr>
		 	<tr>
		 		<th>내용</th>
		 		<td>${prboard.pr_content }</td>
		 	</tr>
		 </table>
	</form>
	<a href="../updatepartreview/${prboard.pr_num }"><input type="button" value="수정"></a>
	<a href="../deletepartreview/${prboard.pr_num}"><input type="button" value="삭제"></a>		

</body>
</html>