<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약확인하기</title>
<jsp:include page="../favicon.jsp"></jsp:include>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<style>

#chat-button{
	background-color: #19CE60;
	color : #fff;
}

#chat-button:hover{
	background-color: #2bbc64;
	color : #fff;
}


.card {
	position: relative;
	display: flex;
	flex-direction: column;
	min-width: 0;
	word-wrap: break-word;
	background-color: #fff;
	background-clip: border-box;
	border: 0 solid transparent;
	border-radius: 0;
}

.card {
	margin-bottom: 30px;
}

.card-body {
	flex: 1 1 auto;
	padding: 1.57rem;
}

.note-has-grid .nav-link {
	padding: .5rem
}

.note-has-grid .single-note-item .card {
	border: 1px solid #dbdbdb;
	border-radius: 10px;
	min-height: 260px;
}

.note-has-grid .single-note-item .favourite-note {
	cursor: pointer
}

.note-has-grid .single-note-item .side-stick {
	position: absolute;
	width: 3px;
	height: 35px;
	left: 0;
	background-color: rgba(82, 95, 127, .5)
}

.note-has-grid .single-note-item.all-category .point {
	color: rgba(82, 95, 127, .5)
}

.state-content{
	text-align: center;
	box-shadow: 0 1px 3px 0 #dbdbdb;
	height: 130px;
	border-radius: 4px;
	padding: 20px;
}

.state-content .card-body:hover{
	cursor: pointer;
	font-weight: bold;
}

#result-count{
	color:#19CE60;
}

#count-col{
	border-right: 1px dotted rgba(82, 95, 127, .5);
}

</style>

</head>

<body>


	<div class="container" id="reserve-container-root">

			<div>
				<div class="col-lg-10 mx-auto mb-4">

					<div class="row container rounded state-content" id="state-container">
						
						<div class="col-lg-2 col-1 card-body" id="count-col">
						예약내역 
						<div id="result-count">${state.reserveCnt}건</div>
						</div>
						
						<div class="col-lg-2 col-1 card-body" id="count-col" param="1">
							케어전
							<div id="result-count">${state.BeforeCnt}건</div>
						</div>
						
						<div class="col-lg-2 col-1 card-body" id="count-col" param="2">
							케어중
							<div id="result-count">${state.IngCnt}건</div>
						</div>
						
						<div class="col-lg-2 col-1 card-body" param="3">
							케어완료
							<div id="result-count">${state.CpleteCnt}건</div>
						</div>
						
					</div>

				<c:if test="${empty reserveList || reserveList eq ''}">
					<jsp:include page="./noData/no_reserve.jsp"></jsp:include>
				</c:if>
				<div class="container-rapper container-md row pt-5">
				
				
					<c:forEach items="${reserveList}" var="reserve">
						<div class="page-content note-has-grid p-3 col-sm-4">
							<div class="tab-content bg-transparent ">
								<div id="note-full-container" class="note-has-grid row">
									<div class="single-note-item all-category">
										<c:choose>
											<c:when test="${reserve.status eq 3}">
												<div class="card card-body  text-bg-secondary opacity-75">
											</c:when>
											<c:otherwise>
												<div class="card card-body">
											</c:otherwise>
										</c:choose>
										<span class="side-stick"></span>

										<h5 class="note-title text-truncate fw-bold">
											'${reserve.voPet.name}'
											<c:choose>
												<c:when test="${reserve.s_num eq 1}">
													<text>기본케어</text>
												</c:when>
												<c:when test="${reserve.s_num eq 2}">
													<text>산책케어</text>
												</c:when>
												<c:when test="${reserve.s_num eq 4}">
													<text>병원진료</text>
												</c:when>
												<c:when test="${reserve.s_num eq 5}">
													<text>미용케어</text>
												</c:when>
											</c:choose>
											</h5>
											<h5 class="note-title text-truncate">${reserve.reserve_day}</h5>
											<c:choose>
												<c:when test="${reserve.status eq 1 }">
													<p class="note-date font-12 text-muted">펫트너와 매칭중입니다.</p>
												</c:when>
												<c:when test="${reserve.status eq 2 }">
													<p class="note-date font-12 text-muted">펫시터가 열심히 케어중...</p>
													<p>담당펫트너 : ${reserve.voP.part_name}펫트너님</p>
												</c:when>
												<c:when test="${reserve.status eq 3 }">
													<p class="note-date font-12 text-white">완료된 내역입니다.</p>
												</c:when>
											</c:choose>
											<div class="note-content d-grid gap-2 mx-auto">
												<p>
												<c:choose>
													<c:when test="${reserve.status eq 2 }"><button type="button" class="btn btn-lg btn-block" id="chat-button">1:1채팅하기</button></p></c:when>
													<c:when test="${reserve.status eq 3 }"><button type="button" class="btn  btn-lg btn-dark btn-block">돌봄일지보기</button></p></c:when>
												</c:choose>
												
											</div>
											
											</div>
									</div>
								</div>
							</div>
						</div>
				</c:forEach>
				
				</div>

			</div>
		</div>
	</div>
	

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>
	<script type="text/javascript">
	
	
	$("#state-container .card-body").click(function(){
		var status = $(this).attr("param");
		var liurl = "../myInfo/check-reservation";
		
		
		$.ajax({
			type : 'POST',
			url : liurl,
			data:{
				status : status
			},
			dataType : 'html',
			success : function(data) {
				$("#reserve-container-root").html(data);

			},
			error : function(result) {
				alert(result);
			}
		});
	});
	
	</script>


</body>
</html>