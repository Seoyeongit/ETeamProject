<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</head>

<c:if test="${empty reserveList || reserveList eq ''}">
	<jsp:include page="./noData/no_writeReview.jsp"></jsp:include>
</c:if>

<c:forEach items="${reserveList}" var="reserve">
	<div
		class="job-box d-md-flex align-items-center justify-content-between mb-30">
		<div class="job-left my-4 d-md-flex align-items-center flex-wrap">

			<div class="job-content">
				<h5>
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
				<p>'${reserve.voP.part_name}'펫트너님이 케어하신 서비스예요</p>
			</div>
		</div>
		<div class="job-right my-4 flex-shrink-0">
			<a id="open-review-modal" class="btn d-block w-100 d-sm-inline-block btn-light" param="${reserve.reserve_num}" data-bs-toggle="modal"
				data-bs-target="#review-modal">리뷰쓰기</a>
		</div>
	</div>
</c:forEach>

<!-- The Modal -->
<div class="modal fade" id="review-modal">
	<div class="modal-dialog modal-fullscreen-md-down">
		<div class="modal-content">
			<!-- Modal Header -->
			<div class="modal-header">
				<h4 class="modal-title mx-auto" id="modal-title">리뷰 쓰기</h4>
				<button type="button" class="btn-close m-0" data-bs-dismiss="modal"></button>
			</div>
			<!-- Modal body -->
			<div class="modal-body" style="padding : 40px 40px 10px 40px;">
			</div>
				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="button" class="btn btn-danger col-12 mx-auto" id="submit-btn">완료</button>
				</div>

			
		</div>
	</div>
</div>



<script>

//별점초기화할 변수입니다.

$('.job-right #open-review-modal').click(function(){
	var num = $(this).attr("param");
	var liurl = "../myInfo/writeReview";
	
	$.ajax({
		type : 'POST',
		dataType : 'html',
		url : liurl,
		data : {
			reserve_num : num
		},
		success : function(data){
			$(".modal-body").html(data);
		},
		error : function(result) {
			alert(result);
		}
	});
});


$('#submit-btn').click(function(){
	var r_title = $('#review-header').val();
	var r_content = $('#review-body').val();
	var reserve_num = $('#surviceContainer').attr("param");
	var star_rating = $('input[name=star_rating]').val();
	
	
	console.log(r_title+","+r_content+","+reserve_num+","+star_rating);
	
	$.ajax({
		url : "../myInfo/writeReview_go",
		dataType : 'text',
		type : 'POST',
		data : {
			star_rating : star_rating,
			r_content : r_content,
			r_title : r_title,
			reserve_num : reserve_num
		},
		success : function(){
			alert("리뷰가 등록되었습니다.");
			$('#review-modal').modal('hide');
		},
		error : function(result) {
			alert("리뷰등록에 실패했습니다.");
		}
	});
});


</script>
