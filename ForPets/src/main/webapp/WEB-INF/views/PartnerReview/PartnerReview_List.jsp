<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>    
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/WEB-INF/views/favicon.jsp" />
<meta charset="UTF-8">
<title>펫트너 리뷰</title>
<jsp:include page="/WEB-INF/views/nav.jsp"/>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js" type="text/javascript"></script>
<style>

  	body{
	    background: #F5F5F5;
	    margin-top:100px;
	}
	
	.content_guide {
	    top: 0;
	    right: 0;
	    bottom: 0;
	    left: 0;
	    width: 100%;
	    max-width: 1200px;
	    min-height: 100%;
	    margin: auto;
	    background-color: #fff;
	    border: solid #e8e8e8;
	    -webkit-box-sizing: content-box;
	    box-sizing: content-box;
	    margin-bottom: 100px;
	}
	
	.pt_guide {
		float : left;
	}
	
	.ptinfo {
		text-align: center;
		margin-top : 30px;
		margin-bottom : 30px;
		border-right : black;
	}
	
	.review_guide {
		float: right;
	}

	.review_list {
		text-align: -webkit-center;
		margin-top : 30px;
		margin-bottom : 30px;
	}

	.review_board {
	display: flex;
    flex-direction: column;
    justify-content: flex-start;
    padding: 20px 20px 20px;
    max-width: 760px;
    height: fit-content;
    border: 1px solid #d1d1d1;
    border-radius: 15px;
    position: relative;
    cursor: pointer;
    transition: .2s ease-in;
    margin-bottom: 15px;
    align-content: flex-start;
    text-align : left;
}

	.btn {
  	background-color: #19CE60;
  	color : white;
 
}

	.btn:hover {
	background-color: green;
	color : white;
	}
	

	.btns {
		border: none; 
		background-color:transparent;
		float: right;
	}
	
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

</head>
<body>
	
	
	 
	<c:if test="${member.user_id != null}">
		<h1 style="text-align: center;">펫트너 리뷰</h1>
		<h5 style="text-align: center;">펫트너를 평가해주세요!
		<a href="../createpartreview/${part_id }"><input type="button" class="btn btn-sm btn-block" value="글 작성하기"></a></h5>
	</c:if>
	
	
	<c:if test="${role eq 'partners' }">
		<h1 style="text-align: center;">펫트너 리뷰
		<a href="${pageContext.request.contextPath}/partner/partnerMain"><input type="button" class="btn btn-sm btn-block" value="파트너 페이지로 돌아가기"></a></h1>
	</c:if>

<div class="content_guide">
	
	
     <div class="row">
     <div class="pt_guide col-4">
	<div class="ptinfo"  >
	    <img src = " ./partner/display?fileName=${img }" style="width: 200px; height: 150px;">
		<h2>${prList } 펫트너</h2>
		<input type="hidden" name="part_id" value="${part_id}">

		<form class="mb-3" name="myform" id="myform" method="post" >
		<h6>파트너 평균 평점 ${avg }점</h6>
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
	</div>
	</div>
	
	<div class="review_guide col-8">
	<div class="review_list" style="border-left: solid 1.5px #D3D3D3; margin-left:-30px;">
	
	<c:forEach items="${reviewList }" var="rl" varStatus="vs"> 
		<div class="review_board">

			<input type="hidden" value="${rl.pr_num }">

				<h5>${rl.pr_title }</h5>
				<p style="font-size: 12px;">${rl.user_id } | ${rl.pr_date }</p>
				
				
						
				<form class="mb-3" name="myform" id="myform">
	
				<fieldset >
						<input type="radio" name="pr_avg" value="5" id="${vs.count }rate5" onclick="return(false);"><label 
							for="${vs.index }rate1" style=" font-size: 1em; " >★</label>
						<input type="radio" name="pr_avg" value="4" id="${vs.count }rate4"  onclick="return(false);"><label 
							for="${vs.index }rate2" style=" font-size: 1em; ">★</label>
						<input type="radio" name="pr_avg" value="3" id="${vs.count }rate3"  onclick="return(false);"><label 
							for="${vs.index }rate3" style=" font-size: 1em; ">★</label>
						<input type="radio" name="pr_avg" value="2" id="${vs.count }rate2"  onclick="return(false);"><label
							for="${vs.index }rate4" style=" font-size: 1em; ">★</label>
						<input type="radio" name="pr_avg" value="1" id="${vs.count }rate1"  onclick="return(false);"><label
						 	for="${vs.index }rate5" style=" font-size: 1em; ">★</label>
					</fieldset>
					
					<script type="text/javascript">
						$('input#${vs.count }rate${rl.pr_avg }').prop("checked", true);
					</script>
				
				</form>

				

				<p>${rl.pr_content }</p>
		<div class="btns">
		<c:if test="${member.user_id == rl.user_id }">
			<a href="../updatepartreview/${rl.pr_num }"><input type="button" value="수정" style="border: none; background-color:transparent; float: right;"></a>
			<a href="../deletepartreview/${rl.pr_num}&${part_id}"><input type="submit" value="삭제" style="border: none; background-color:transparent; float: right;" ></a>
		</c:if>
		</div>

		</div>
		
			</c:forEach>
			
	
		</div>
		</div>
	</div>
		
	</div>
	
	
<%@ include file="/WEB-INF/views/footer.jsp" %>	
	
</body>
</html>