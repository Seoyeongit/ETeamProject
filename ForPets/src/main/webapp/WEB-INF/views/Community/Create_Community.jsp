<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>    
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="/WEB-INF/views/nav.jsp"/>
<jsp:include page="../favicon.jsp"/>
 <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
  <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){
		// 구분을 위한 count 변수
		var count = 1;
		
		// 설문지 추가 버튼
		$("#addSurBtn").click(function(){
			// 구분을 위한 count 증가
			count += 1;
			
			// 설문지 최대 번호 구하기 -> 증가
			var last = $("#survey tr:last").attr("class").replace("item","");
			var newitem = $("#survey tr:eq(1)").clone();


			newitem.removeClass();
			newitem.find("td:eq(0)").attr("rowspan", "1");
			
			// item 추가할 때 title, type, answer 구분자를 추가해서 name 설정
			newitem.find("td:eq(0)").find("input:eq(0)").attr("name", "sd_title"+count);
			newitem.find("td:eq(1)").find("select:eq(0)").attr("name", "sd_type"+count);
			newitem.find("td:eq(2)").find("input:eq(1)").attr("name", "sc_answer"+count);
			
			newitem.addClass("item"+(parseInt(last)+1));
			
			// 총 작성된 질문 수 = count
			$("#survey_count").val(count);

			$("#survey").append(newitem);
		}); // 설문지 추가 END
		
		
		// 항목 추가 버튼
		$(".addBtn").live("click", function(){
			var click = $(this).parent().parent();
			var cls = click.attr("class");
			
			// tr복사 후 마지막에 추가
			var newrow = click.clone();
			newrow.find("td:eq(0)").children().remove();
			newrow.find("td:eq(1)").children().remove();
			newrow.insertAfter($("#survey ."+cls+":last"));
		}); // 항목 추가 END
		


        
        // 삭제버튼 클릭 시 
        $(".delBtn").live("click", function() {
        	var click = $(this).parent().parent();
        	var cls = click.attr("class");
        	
        	if (click.find("td:eq(0)").attr("rowspan")) {
        		if(click.next().hasClass(cls)) {
        			click.next().preped(click.find("td:eq(0)"));
        		}
        	}
        	click.remove();
        
        });
		
	});
     
 	 $(document).change("select[name=sd_type]", function() { 
	
		let qs = $("#surOpt").find("option:selected").val();	 
				
	 	 /* 	if (qs == "gaek") {
		    		alert (qs);
		    		
		    	} else if (qs == "check") {
		    		alert (qs); 
		    		
		    	} else if (qs == "ju") {
		    		alert (qs);
		    		
		    	} else if (qs == "time") {
		        		alert (qs);	
		        		
		    	} else if (qs == "schedule") {
		    		alert (qs);	 */
		    		
		    	//} // if end 
			}); 
			
	
</script>
<style>
	body {
		background: #f9f9f9; 
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
	    margin-bottom: 40px;
	}

	.title_board {
		max-width: 886px;
		position: relative;
	    padding-top: 20px;
	}

	hr {
	 height:1px;
	 border: 0;
	 padding-right: 100px; 
	 padding-left: 100px;
	 margin-right: 80px;
     margin-left: 80px;
	}
	
	.title_area {
		border:none; 
		text-align:center; 
		width:1000px; 
		height:100px; 
		padding-right: 100px; 
		padding-left: 100px; 
		font-size: 2.5em; 
		text-align: left;
		margin-bottm: 40px;
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
		height: 600px;
	}
	
	.buttons {
		   text-align: center;
		   margin-bottom: 30px;
	}

	.svinput {
		border-left-width:0;
		border-right-width:0;
		border-top-width:0;
		border-bottom-width:0.5px;
	}
	
	.pl{
	    width: 200px;
	    border: 1px solid #C4C4C4;
	    box-sizing: border-box;
	    border-radius: 10px;
		  height: 30px;
	    font-family: 'Roboto';
	    font-style: normal;
	    font-weight: 400;
	    font-size: 12px;

	    line-height: 16px;
	}
	
	.pl:focus{
	    border: 1px solid #9B51E0;
	    box-sizing: border-box;
	    border-radius: 10px;
	    outline: 3px solid #F8E4FF;
	    border-radius: 10px;
	}
	
	table {
	  border-spacing: 10px;
	  border-collapse: separate;
	}

</style>
<title>make community</title>
</head>
<body>

	<c:set var="now" value="<%=new java.util.Date()%>" />
	<c:set var="date"><fmt:formatDate value="${now}" pattern="yyMMddmmss" /></c:set>
	<c:set var="min"><fmt:formatDate value="${now}" pattern="yyyy-MM-dd" /></c:set>  
	<c:set var="c_code" value="c${date }"></c:set>
	
		<h1 style="text-align: center;">소모임 생성 </h1>
	<h5 style="text-align: center;">자신의 소모임을 만들어 보세요</h5>

 	

<form action="../insertcommunity" method="post" >
 
 		<div class="content_guide">
 		<c:choose>
   			 <c:when test="${empty cscode}">
			<input type="hidden" value="c${date }" name="c_code">
			 </c:when>
			 <c:otherwise>
			 	<input type="hidden" value="${cscode }" name="c_code">
			 </c:otherwise> 
		</c:choose>
				<div class = "title_board">
					<input class="title_area" type="text" name="c_title" placeholder="제목">

						
						</div>
						<hr>
						<div style="white-space:pre;" ><textarea class="text_area" name="c_content" placeholder="내용을 입력해 주세요."></textarea></div>

			
			<div class="buttons">
<c:choose>
    <c:when test="${empty cscode}">
		<input type="button" class="btn" data-bs-toggle="modal" data-bs-target="#exampleModal" value="설문지 만들기" style="background-color:#19CE60; color:white;">
	</c:when>
</c:choose>
			<input type="submit" value="작성하기" class="btn" style="background-color:#19CE60; color:white ">
			<a href="communitylist"><input type="button" value="취소" class="btn" style="background-color:#19CE60; color:white "></a>
			
			</div>
			</div>
		
	</form>
	

  
<!-- Button trigger modal -->

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-xl" style="width:1800px;">
    <div class="modal-content" >
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">설문지 생성하기</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">


<form action="../biz/insertsurvey.do" method="post" >
	<input type="hidden" value="1" id="survey_count" name="survey_count">
	<input type="hidden" value="s${date}" name="sd_svcode">
	<input type="hidden" value="${c_code}" name="c_code">
	<p style="text-align:center;"><b>설문지 제목 :</b> <input class="svinput" type="text" placeholder="설문지 제목을 입력하세요." size=80 name="s_title"></p>

	
	<table id="survey" >
		<tr>
			<th>질문 내용</th>
			<th>질문 유형</th>
			<th>옵션 추가</th>
			<th><button class="btn btn-sm" type="button" id="addSurBtn" style="border-color:#19CE60; color:#19CE60;">문항 추가</button></th>
		</tr>
		<tr class="item1">
			<td>
			<!-- 	<input type="hidden" name="sd_order"> -->
				<input class="svinput" type="text" placeholder = "질문 내용을 입력해 주세요." size=60 name="sd_title1"></td>
			<td><select id="surOpt" name="sd_type1" class="pl">

					<option value="">-- 설문지 유형을 선택해 주세요 --</option>

					<option value="gaek">객관식</option>
					<option value="ju">주관식</option>
					<option value="check">체크박스</option>
					<option value="time">시간형</option>
					<option value="schedule">달력형</option>
				</select>
			</td>
            <td><input type="hidden" name="sc_ascode" value=""><input class="svinput" type="text" name="sc_answer1"/>      
            	<button type="button" class="addBtn btn btn-sm" style="border-color:#19CE60; color:#19CE60;">항목추가</button></td>
            <td><button class="delBtn btn btn-sm" style="border-color:#19CE60; color:#19CE60;">삭제</button></td>
		</tr>
	</table>
	 

	  	<input type="submit" value="작성완료" class="btn" style="background-color:#19CE60; color:white; text-align: center; float: right;">

	 

  
    </form>
    	</div>
    </div>
  </div>
</div>




<%@ include file="/WEB-INF/views/footer.jsp" %>	

</body>
</html>