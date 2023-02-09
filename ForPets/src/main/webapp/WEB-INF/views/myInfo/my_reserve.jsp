<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>예약확인하기</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<style>
    body{
    background: #edf1f5;
    margin-top:20px;
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
     border-radius: 10px
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
 
</style>
</head>
<body>
    <div>
        <header>
        <h5>안녕하세요 ${member.user_nick}님 <a href="#">로그아웃</a></h5>
        </header>
    </div>
<div class="row container my-5 rounded">
    <div class="col-sm-4 card card-body">
        예약내역
        <div>${resultCnt}건</div>
    </div>
    <div class="col-sm-4 card card-body">
        케어완료
        <div>${resultCP}건</div>        
    </div>
    <div class="col-sm-4 card card-body">
        리뷰
         <div>${resultR}건</div> 
    </div>
</div>
</div>

<div class="container-rapper container-md row">
    <c:forEach items="${reserveList}" var="reserve">
		<div class="page-content note-has-grid p-4 col-sm-4">
            <div class="tab-content bg-transparent ">
                <div id="note-full-container" class="note-has-grid row">
                    <div class="single-note-item all-category">
                      <c:choose>
                      	<c:when test="${reserve.status eq 3}"><div class="card card-body  text-bg-secondary opacity-75"></c:when>
						<c:otherwise><div class="card card-body"></c:otherwise>
                      </c:choose>
                            <span class="side-stick"></span>

                            <h5 class="note-title text-truncate">'${reserve.voPet.name}'
                                <c:choose>
                                    <c:when test="${reserve.s_num eq 1}"><text>기본케어</text></c:when>
                                    <c:when test="${reserve.s_num eq 2}"><text>산책케어</text></c:when>
                                    <c:when test="${reserve.s_num eq 3}"><text>픽업</text></c:when>
                                    <c:when test="${reserve.s_num eq 4}"><text>병원진료</text></c:when>
                                    <c:when test="${reserve.s_num eq 5}"><text>미용케어</text></c:when>
                                </c:choose>
                                <h5 class="note-title text-truncate">${reserve.reserve_day}<i
                                        class="point fa fa-circle ml-1 font-10"></i></h5>
                                <c:choose>
                                <c:when test="${reserve.status eq 1 }"> <p class="note-date font-12 text-muted">펫트너와 매칭중입니다.</p></c:when>
                               	<c:when test="${reserve.status eq 2 }"> <p class="note-date font-12 text-muted">펫시터가 열심히 케어중...</p>
                               	<p>담당펫트너 : ${reserve.voP.part_name}펫트너님</p></c:when>
                                <c:when test="${reserve.status eq 3 }"> <p class="note-date font-12 text-white">완료된 내역입니다.</p></c:when>
                                </c:choose>
                                <div class="note-content d-grid">
                                    <p>
                                    <c:choose>
                               	<c:when test="${reserve.status eq 2 }"><button type="button" class="btn btn-primary btn-lg btn-block" >1:1채팅하기</button></p></c:when>
                                <c:when test="${reserve.status eq 3 }"><button type="button" class="btn btn-dark btn-lg btn-block">돌봄일지보기</button></p></c:when>
                                </c:choose>
                                </div>
                                
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </c:forEach>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>


</body>
</html>