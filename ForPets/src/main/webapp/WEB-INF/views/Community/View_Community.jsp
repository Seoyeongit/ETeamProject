<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>    
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../favicon.jsp" />
<meta charset="UTF-8">
<title>Community board</title>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js" type="text/javascript"></script>
<jsp:include page="/WEB-INF/views/nav.jsp"/>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js" type="text/javascript"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" 
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" 
	integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<style>
	body{
	    background: #F5F5F5;
	    margin-top:100px;
	}
	
	.content_guide {
		/* position: absolute; */
	    top: 0;
	    right: 0;
	    bottom: 0;
	    left: 0;
	    width: 100%;
	    max-width: 1000px;
	    min-height: 100%;
	    margin: auto;
	    background-color: #fff;
	    border: solid #e8e8e8;
	    /* border-width: 0 1px; */
	    -webkit-box-sizing: content-box;
	    box-sizing: content-box;
	    margin-bottom: 50px;

	}
	
	.info {
		margin: 0 0 -6px;
	    text-align: left;
	    font-size: 14px;
	    line-height: 30px;
	    padding-right: 100px;
    	padding-left: 100px;
	}
	
	.title_board {
		position: relative;
	    padding-top: 20px;
	    padding-bottom: 32px;
	}
	
	.hr1 {
	 height:1px;
	 border: 0;
	 padding-right: 100px; 
	 padding-left: 100px;
	 margin-right : 80px;
	 margin-left : 80px;
	}
	
	.title_area {
		border:none; 
		text-align:center; 
		width:1000px; 
		padding-right: 100px; 
		padding-left: 100px; 
		font-size: 2.5em; 
		text-align: left;
	}
	
	.text_area {
		border:none; 
		text-align:center; 
		width:1000px; 
		height:100px; 
		padding-right: 100px; 
		padding-left: 100px; 
		font-size: 1.2em; 
		text-align: left; 
		resize: vertical; 
		height: fit-content;
	}
	
	.comment_area {
		width: 100%;
	    max-width: 1000px;
	    min-height: 100%;
	    margin: auto;
	    padding-right: 100px;
  		padding-left: 100px;
	}
	
	.comment {
		width: 100%;
	    max-width: 1000px;
	    min-height: 100%;
	    margin: auto;
	    padding-right: 100px;
  		padding-left: 100px;
  		margin-bottom: 200px;
	}
	
	.comment_board{
		position: relative;
	    height: 60px;
    	width: 800px;
    	resize: none;
	}
	
	.btn {
  	background-color: #19CE60;
  	color : white;
 
	}

	.btn:hover {
	background-color: green;
	color : white;
	}
	
	.buttons {
	text-align: center
	}

</style>
</head>
<body>


	<h1 style="text-align: center;">소모임 상세보기</h1>
	<h4 style="text-align: center;">소모임을 찾고, 설문지를 작성하세요!</h4>
	<br>
 		<div class="content_guide">
			<div class = "title_board">
				<p class="title_area">${communityboard.c_title }</p>
		
				
				<div class="info">
						<p class="writer"> <b>${communityboard.user_id }</b> | ${communityboard.c_date } </p>
 					<c:set var="test" value="${svcode[0].sa_svcode }"> </c:set>
					<%-- 	<c:choose>
							<c:when  test="${not empty test}">
						 <a style="float :right" data-value="${s_svcode[0].s_svcode }"onclick="click_ans(this);">설문지 답변하러 가기</a>
		 					</c:when>
		 				</c:choose> 
		 				<script>
		 				function click_ans(s_code) {
		   					var scode = $(s_code).data("value");
		   			 		
			   						window.location.href="${pageContext.request.contextPath}/surveyboard.do/"+scode+"";		
			   					 
		   					}
		 				</script>  --%>
		 			</div> 
		 			
		 			<hr class="hr1"><br>

		 		
		 		<div class="text_area" style="white-space:pre;">${communityboard.c_content }</div>
		 		
		 	<br>
	
		<div class="buttons"> 
	<c:choose>
		<c:when test="${member.user_id == communityboard.user_id}">		
				<a href="${pageContext.request.contextPath}/updatecommunity/${communityboard.c_code }"><input class="btn" style="background-color:#19CE60; color:white;" type="button" value="수정"></a>
				<a href="${pageContext.request.contextPath}/deletecommunity/${communityboard.c_code }"><input class="btn" style="background-color:#19CE60; color:white;" type="button" value="삭제"></a>
			<c:choose>
				<c:when test="${not empty test }">	
				<a href="${pageContext.request.contextPath}/answerlist.do/${svcode[0].sa_svcode }"><input class="btn" style="background-color:#19CE60; color:white;" type="button" value="설문지 답변 확인"></a>
				</c:when>		
			</c:choose>		 
		</c:when>

	</c:choose>

			<a href="${pageContext.request.contextPath}/communitylist"><input class="btn" style="background-color:#19CE60; color:white;" type="button" value="목록보기"></a>		
		</div>
	
		</div>
		</div>
		
		
		
		<div class="comment_area">
		<c:forEach items="${getdat }" var="gd">
			
	
		<form name="frm${gd.d_num }" method="post">
			<input type="hidden" name="d_code" value="${gd.d_code }">
			<input type="hidden" name="d_num" value="${gd.d_num }" id ="d_num">
			<input type="hidden" id="c${gd.d_num }" value="${gd.d_content}">
				
					<p><b>${gd.user_id }</b> | ${gd.d_date }</p> 
					<p id="${gd.d_num }"><a>${gd.d_content }</a></p>
			
		<c:if test="${member.user_id == gd.user_id }">
			<a id="b${gd.d_num }"><input type="button" value="수정" onclick="update(${gd.d_num})" style="border: none; background-color:transparent; float:right;" ></a>
			<input type="submit" value="삭제" onclick="javascript : frm${gd.d_num }.action='../deletedat';" style="border: none; background-color:transparent; float:right;">
		</c:if>
		</form><br>
		<hr style="height:1px; border: 0; ">
		</c:forEach>
		
	
 		<script>
 			
 			function update(data) {
 				
 				$('#'+data).children().remove();
 				$('#'+data).append('<input type="text" name="d_content" class="comment_board" value="'+$('#c'+data).val()+'">');
 				$('#b'+data).children().remove();
 				$('#b'+data).append("<input type='submit' value='수정' style='border: none; background-color:transparent; float:right;' onclick='javascript : frm"+data+".action=\"../updatedat\";'>");
 				/* $('#b'+data).attr("onclick", "updatedat("+data+")"); */
 			}
 			
 			function updatedat(data) {
 				/* alert(data);
 				var frm = "frm" + data;
 				alert(frm);  */
 	/* 
 				document.getElementById("frm"+data).action = "../updatedat.do"; */
 				document.getElementById('frm'+data+'').submit();
 			}
 			
 			
 		
			
			
		</script> 
   
	</div>
	

	<div class="comment">
	<c:choose>
		<c:when test="${member.user_id != null }">
		<form action="${pageContext.request.contextPath}/insertcomdat" method="post">
			<input type="hidden" name="d_code" value="${communityboard.c_code }">
			<input type="hidden" name="user_id">
	
					<textarea class="comment_board" name="d_content" style="" placeholder="댓글을 입력해 주세요." required></textarea>
					<input type="submit" value="댓글 작성하기" class="btn" style="background-color:#19CE60; color:white; float:right;">
	
		</form>
		</c:when>
		<c:otherwise>
			<p style="text-align: center;"><a href="${pageContext.request.contextPath}/member/login" >로그인</a>을 하시면 댓글 쓰기가 가능합니다.</p>
		</c:otherwise>
	</c:choose>
	</div>
		

	

	

	
<%@ include file="/WEB-INF/views/footer.jsp" %>	
</body>
</html>