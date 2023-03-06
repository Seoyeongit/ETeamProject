<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:if test="${empty myDat || myDat eq ''}">
	<jsp:include page="./noData/no_comdat.jsp"></jsp:include>
</c:if>

<c:forEach items="${myDat}" var="myD">

<div class="d-md-flex align-items-center justify-content-between mt-5">
	<div class="d-flex flex-column">
		<div class="m-0">
			<p>${myD.d_content}</p>
		</div>

		<div class="p-0">
		<c:set var="postId" value="${myD.d_num}" />
			<div class="text-black-50">'${postInMyDat[postId].c_title}'에서  ${myD.d_date}에 작성</div>
		</div>
	</div>
	
	<div class="job-right my-4 flex-shrink-0">
		<a class="btn d-block w-100 d-sm-inline-block btn-light" id="myComdat-delete" onclick="deleteComdat(${myD.d_num}, '${myD.d_code}')">삭제하기</a>
		<a class="btn d-block w-100 d-sm-inline-block btn-light" href="${pageContext.request.contextPath}/viewcommunityboard/${postInMyDat[postId].c_code}">더보기</a>
	</div>
	
	
</div>
	<hr>
</c:forEach>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
	function deleteComdat(num,code){
		$.ajax({
			url:"../myInfo/deleteMyDat",
			type:'POST',
			data : {
				d_num : num,
				d_code : code,
			},
			success : function(result){
				if(result === 'success'){
					alert("삭제되었습니다.");
					reload();
				}else{
					alert("삭제에실패했습니다.");
				}
								},
			error : function(){
				alert(result);
			}
		});
	}
	
</script>
</body>
</html>