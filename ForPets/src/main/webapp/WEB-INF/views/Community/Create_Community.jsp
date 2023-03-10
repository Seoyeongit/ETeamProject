<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>    
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../favicon.jsp"/>
<meta charset="UTF-8">
<title>make community</title>
<jsp:include page="/WEB-INF/views/nav.jsp"/>
 <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
  <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js" type="text/javascript"></script>

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

	.info {
		margin: 0 0 -6px;
		float:right;
	    font-size: 14px;
	    line-height: 30px;
	    padding-right: 100px;
    	padding-left: 100px;
	}
</style>
</head>
<body>

	<c:set var="now" value="<%=new java.util.Date()%>" />
	<c:set var="date"><fmt:formatDate value="${now}" pattern="yyMMddmmss" /></c:set>
	<c:set var="min"><fmt:formatDate value="${now}" pattern="yyyy-MM-dd" /></c:set>  
	<c:set var="c_code" value="c${date }"></c:set>
	
		<h1 style="text-align: center;">????????? ?????? </h1>
	<h5 style="text-align: center;">????????? ???????????? ????????? ?????????</h5>

 	

<form action="${pageContext.request.contextPath}/insertcommunity" method="post" >
 
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
				
					<input class="title_area" type="text" name="c_title" placeholder="??????" required>
				
				</div>
				<div class="info">
						<p > ????????? ??????????????? ??????????????? ! : 
						<select name="c_pet" id="c_pet" class="pl" required>
							<option value="">-- ????????? ????????? ?????????. --</option>
							<option value="dog">?????????</option>
							<option value="cat">?????????</option>
						</select> </p>
				</div>		
						
						
						<br><hr>
						<div style="white-space:pre;" ><textarea class="text_area" name="c_content" placeholder="????????? ????????? ?????????." required></textarea></div>

			
			<div class="buttons">
<c:choose>
    <c:when test="${empty cscode}">
		<input type="button" class="btn" data-bs-toggle="modal" data-bs-target="#exampleModal" value="????????? ?????????" style="background-color:#19CE60; color:white;">
	</c:when>
</c:choose>
			<input type="submit" value="????????????" class="btn" style="background-color:#19CE60; color:white ">
			<a href="communitylist"><input type="button" value="??????" class="btn" style="background-color:#19CE60; color:white "></a>
			
			</div>
			</div>
		
	</form>
	


<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-xl" style="width:1800px;">
    <div class="modal-content" >
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">????????? ????????????</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">


<form action="../biz/insertsurvey.do" method="post" >
	<input type="hidden" value="1" id="survey_count" name="survey_count">
	<input type="hidden" value="s${date}" name="sd_svcode">
	<input type="hidden" value="${c_code}" name="c_code">
	<p><b>** ????????? ???????????? ????????? ??? ????????? ???????????? ?????? ??? ?????????</b></p><br>
	
	<p style="text-align:center;"><b>????????? ?????? :</b> <input class="svinput" type="text" placeholder="????????? ????????? ???????????????." size=80 name="s_title" required></p>

	
	<table id="survey" >
		<tr>
			<th>?????? ??????</th>
			<th>?????? ??????</th>
			<th>?????? ??????</th>
			<th><button class="btn btn-sm" type="button" id="addSurBtn" style="border-color:#19CE60; color:#19CE60;">?????? ??????</button></th>
		</tr>
		<tr class="item1">
			<td>
			<!-- 	<input type="hidden" name="sd_order"> -->
				<input class="svinput" type="text" placeholder = "?????? ????????? ????????? ?????????." size=60 name="sd_title1" required></td>
			<td><select id="surOpt" name="sd_type1" class="pl" required onchange="handle(this)">

					<option value="">-- ????????? ????????? ????????? ????????? --</option>

					<option value="gaek">?????????</option>
					<option value="ju">?????????</option>
					<option value="check">????????????</option>
					<option value="time">?????????</option>
					<option value="schedule">?????????</option>
				</select>
			</td>
            <td><input type="hidden" name="sc_ascode" value=""><input class="svinput" type="text" name="sc_answer1" />      
            	<button type="button" class="addBtn btn btn-sm" style="border-color:#19CE60; color:#19CE60;">????????????</button></td>
            <td><button class="delBtn btn btn-sm" style="border-color:#19CE60; color:#19CE60;">??????</button></td>
		</tr>
	</table>
	 

	  	<input type="submit" value="????????????" class="btn" style="background-color:#19CE60; color:white; text-align: center; float: right;">

	 

  
    </form>
    	</div>
    </div>
  </div>
</div>




<%@ include file="/WEB-INF/views/footer.jsp" %>	
<script type="text/javascript">
	$(document).ready(function(){
		// ????????? ?????? count ??????
		var count = 1;
		
		// ????????? ?????? ??????
		$("#addSurBtn").click(function(){
			// ????????? ?????? count ??????
			count += 1;
			
			// ????????? ?????? ?????? ????????? -> ??????
			var last = $("#survey tr:last").attr("class").replace("item","");
			var newitem = $("#survey tr:eq(1)").clone();
			
			newitem.find("td:eq(0)").find("input:eq(0)").attr('value','');
			newitem.find("td:eq(1)").find("select:eq(0)").attr('value','');
			newitem.find("td:eq(2)").find("input:eq(1)").attr('value','');
			
			newitem.removeClass();
			newitem.find("td:eq(0)").attr("rowspan", "1");
			
			// item ????????? ??? title, type, answer ???????????? ???????????? name ??????
			newitem.find("td:eq(0)").find("input:eq(0)").attr("name", "sd_title"+count);
			newitem.find("td:eq(1)").find("select:eq(0)").attr("name", "sd_type"+count);
			newitem.find("td:eq(2)").find("input:eq(1)").attr("name", "sc_answer"+count);
			
			newitem.addClass("item"+(parseInt(last)+1));
			
			// ??? ????????? ?????? ??? = count
			$("#survey_count").val(count);

			$("#survey").append(newitem);
		}); // ????????? ?????? END
		
		
		// ?????? ?????? ??????
		$(".addBtn").live("click", function(){
			var click = $(this).parent().parent();
			var cls = click.attr("class");
			
			// tr?????? ??? ???????????? ??????
			var newrow = click.clone();
			newrow.find("td:eq(0)").children().remove();
			newrow.find("td:eq(1)").children().remove();
			newrow.find("td:eq(2)").find("input:eq(1)").attr('value','');
			newrow.insertAfter($("#survey ."+cls+":last"));
		}); // ?????? ?????? END
		


        
        // ???????????? ?????? ??? 
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
     
/*  	 $(document).onchange("select[name=sd_type]", function() { 
	
		let qs = $(this).$("#surOpt").find("option:selected").val();	 
				
	 	  	if (qs == "gaek") {
		    		alert (qs);
		    		
		    	} else if (qs == "check") {
		    		alert (qs); 
		    		
		    	} else if (qs == "ju") {
		    		alert (qs);
		    		
		    	} else if (qs == "time") {
		        		alert (qs);	
		        		
		    	} else if (qs == "schedule") {
		    		alert (qs);	 
		    		
		    	} // if end 
			});  */
			
			function handle(test_sel) {
				let qs = $(test_sel).val();
				let name = $(test_sel).attr('name');
				let no_name = name.substring(name.length -1);
				if (qs == "gaek") {
					$("input[name=sc_answer"+no_name+"]").attr('readonly', false);
		    	} else if (qs == "check") {
		    		$("input[name=sc_answer"+no_name+"]").attr('readonly', false);
		    	} else if (qs == "ju") {
		    		$("input[name=sc_answer"+no_name+"]").attr('readonly', true);
		    	} else if (qs == "time") {
		        	$("input[name=sc_answer"+no_name+"]").attr('readonly', true);
		    	} else if (qs == "schedule") {
		    		$("input[name=sc_answer"+no_name+"]").attr('readonly', true);
		    	} // if end 
			}
	
</script>
</body>
</html>