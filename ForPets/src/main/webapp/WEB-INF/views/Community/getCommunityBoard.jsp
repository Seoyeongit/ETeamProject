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
		 		
	<a href="../updatecommunity.do/${communityboard.c_code }"><input type="button" value="수정"></a>
	<a href="../deletecommunity.do/${communityboard.c_code }"><input type="button" value="삭제"></a>
	<a href="../communitylist.do">글 목록 가기</a>		
		
		
		<c:forEach items="${getdat }" var="gd">
		
		<hr>
		
		<form name="frm${gd.d_num }" method="post">
			<input type="hidden" name="d_code" value="${gd.d_code }">
			<input type="hidden" name="d_num" value="${gd.d_num }" id ="d_num">
			<table <%-- id="${gd.d_num }" --%> class="tr" >
				<tr>
					<th>작성자 : </th>
					<th>${gd.user_id } / ${gd.d_date }</th>
				</tr>
				<tr>
					<td>댓글 내용 : </td>
					<td id="${gd.d_num }"><a>${gd.d_content }</a></td>

				</tr>
			</table>
			<div id="b${gd.d_num }" style="float:left"><input type="button" value="수정" onclick="update(${gd.d_num })"></div>
			<input type="submit" value="삭제" onclick="javascript : frm${gd.d_num }.action='../deletedat.do';">
		</form>
		
		</c:forEach>
		
 		<script>
 			
 			function update(data) {
 				$('#'+data).children().remove();
 				$('#'+data).append('<td><input type="text" name="d_content"></td>');
 				$('#b'+data).children().remove();
 				$('#b'+data).append("<input type='submit' value='수정' onclick='javascript : frm"+data+".action=\"../updatedat.do\";'>");
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

		


	
	
</body>
</html>