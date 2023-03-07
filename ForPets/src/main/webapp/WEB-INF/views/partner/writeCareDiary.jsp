<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="../favicon.jsp"></jsp:include>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>돌봄일지쓰기</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <link href="${pageContext.request.contextPath}/resources/css/carediary.css" rel="stylesheet" />
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Dongle&display=swap" rel="stylesheet">
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Poor+Story&display=swap" rel="stylesheet">
	
    <style>
        .infomation-container{
            background-color: rgb(236, 236, 236);
        }

        .iframe-container{
            position: relative;
            padding-bottom: 56.25%;
            height: 0;
            overflow: hidden;
        }

        .iframe-container iframe,
        .iframe-container object,
        .iframe-container embed{
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            min-height: 100%;
        }
    </style>
</head>
<body>
	<form action="../partner/writeCare" method="post">
	<div class=""></div>
        <h1 class="hd-main"><b>돌봄일지 작성</b></h1>
        	<div class="main-control">
        		<h3 class="main-con-hdd">고객님이 신청하신 서비스내역 입니다.</h3>
            <div class="main-control-hd">
            <div class="pet-info">
                <!--이데이터는 서버로 보내지 않습니다.-->
                <div class="pet-info-detail">
                <div class="info-detail">
                    <h3 class="pet-name">${pet.name }</h3>
                    <c:if test="${pet.gender eq 'm'.charAt(0)}">남</c:if>
                    <c:if test="${pet.gender eq 'f'.charAt(0)}">여</c:if>
                     (${pet.age }세/
                    <c:if test="${pet.type eq 'dog'}">강아지</c:if>
                    <c:if test="${pet.type eq 'cat'}">고양이</c:if>
                     )
                </div>
                <div class="pet-detail">
						<div>사회성 : 보통입니다</div>
                        <div>예민한 곳 : 배를 만지는것을 싫어합니다.</div>
                </div>
                </div>
            </div>
			<div class="serivce-list">
            <div class="인적사항정보div">
                <!--이데이터는 서버로 보내지 않습니다.-->
                <div>
                    <h3>
                    <c:choose>
          				<c:when test="${reserve.s_num eq 1}">기본돌봄서비스</c:when>
          				<c:when test="${reserve.s_num eq 2}">산책돌봄서비스</c:when>
          				<c:when test="${reserve.s_num eq 4}">병원픽업서비스</c:when>
          				<c:when test="${reserve.s_num eq 5}">미용픽업서비스</c:when>
          			</c:choose>  
                    
                    </h3>
                </div>
                <div>
                    <div>요청날짜 ${reserve.reserve_day }</div>
                    <div>요청시간 ${reserve.reserve_time }</div>
                </div>
                <div>
                    <ul>
                        <li>
          				<c:choose>
          				<c:when test="${reserve.s_num eq 1}">기본돌봄  <c:if test ="${not empty reserve.reserve_add && reserve.reserve_add ne '' }"> : ${reserve.reserve_add}</c:if> </c:when>
          				<c:when test="${reserve.s_num eq 2}">산책돌봄  <c:if test ="${not empty reserve.reserve_add && reserve.reserve_add ne ''}"> : ${reserve.reserve_add}</c:if> </c:when>
          				<c:when test="${reserve.s_num eq 4}">병원픽업  <c:if test ="${not empty reserve.pick_add }"> : ${reserve.pick_add}</c:if> </c:when>
          				<c:when test="${reserve.s_num eq 5}">미용픽업  <c:if test ="${not empty reserve.pick_add }"> : ${reserve.pick_add}</c:if> </c:when>
          				</c:choose>  
                      	</li>
                      	<c:if test="${not empty reserve.s_numArr }">
                      	<c:forEach items="${reserve.s_numArr }" var="sNum">
                      	<li>
                      	<c:choose>
                      		<c:when test="${sNum eq 6 }">샤워추가서비스</c:when>
                      		<c:when test="${sNum eq 7 }">훈련추가서비스</c:when>
                      	</c:choose>
                      	</li>
                      	</c:forEach>
                      	</c:if>
                    </ul>
                    <p><b>요청사항</b></p>
                    <div class="rque-st">
                        ${reserve.reserve_request}
                    </div>
                </div>
            </div>
            </div>
            </div>
            <hr>
			<div class="care-list">
				<h3 class="care-list-lis">돌봄 목록</h3>
				<div class="day-time">
				 케어완료 날짜/시간 : <input type="text" class="input-tex"name="complete_day" value="${now}"><input type="time" class="input-tim" name="complete_time">
				</div>
			<div class="serv-con">
				<c:choose>
				<c:when test="${reserve.s_num eq 1 }"><%@ include file="/WEB-INF/views/partner/careDiary/normal.jsp" %></c:when>
				<c:when test="${reserve.s_num eq 2 }"><%@ include file="/WEB-INF/views/partner/careDiary/wark.jsp" %></c:when>
				<c:when test="${reserve.s_num eq 4 }"><%@ include file="/WEB-INF/views/partner/careDiary/pickUp_hospital.jsp" %></c:when>
				<c:when test="${reserve.s_num eq 5 }"><%@ include file="/WEB-INF/views/partner/careDiary/pickUp_salon.jsp" %></c:when>
				</c:choose>
			</div>
			<hr>
			<div class="add-serv">
				<c:forEach items="${reserve.s_numArr }" var="sNum">
        			<c:choose>
        				<c:when test="${sNum eq 6 || sNum eq 7}"><%@ include file="/WEB-INF/views/partner/careDiary/addService.jsp" %></c:when>
        			</c:choose>
        		</c:forEach>
        	</div>
        	</div>
        	<div class="write-bt-control">
        		<input type="hidden" name="reserve_num" value="${reserve.reserve_num }">
				<div class="write-bt"><input type="submit" class="write-bt-sub" value="작성하기"></div>
				<div class="back-bt"><input type="button" class="back-bt-sub" onclick="location.href='careDiaryList';" value="뒤로가기"></div></div>
    	</div> 
    	</form>
    		
    		<script type="text/javascript">
    			
    		var snum = <c:out value="${reserve.s_num}"/>;
    		
    		
    			$('form').submit(function(){
    				console.log(snum);
    				
    				if(snum == 5 && $('#hiddenVal').length){
        				var array = [];
        				
        				$('input:checkbox[name=beauty_list]:checked').each(function(){
        					array.push(this.value);
        				});

        				$('#hiddenVal').val(array);
    				}
    				
					if(snum == 2 && $('#hiddenVal').length){
	    				var result = $("#hour").val() + '시간 ' + $("#min").val() +'분';
		    				$('#hiddenVal').val(result);
					}

    			})
    			
    		</script>
</body>
</html>