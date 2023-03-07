<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!DOCTYPE html>
<html>
<head>
<!-- 파비콘 -->
<jsp:include page="../favicon.jsp"></jsp:include>
<meta charset="UTF-8">
<link href="${pageContext.request.contextPath}/resources/css/customer.css" rel="stylesheet" />
<script type="text/javascript" src="http://code.jquery.com/jquery-3.1.1.js"></script>
<title>ForPets 고객센터</title>
<style>
  .footer{
	margin-top:200px;
	text-align: center;
  	font-size: 0.9rem;
  	font-family: "Montserrat", -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol", "Noto Color Emoji";
   }
   .qs-text{
   	  padding-top:5%;
   	  margin-left : 27%;
   }
   .qs-box{
      margin-left : 25%;
      margin-top : 5%;
   }
   .qa-box{
      margin-left : 5%;
      margin-bottom:5%;
      
   }
   .show-qa {
      background-color : white !important;
      color : black;
   }
   .active{
      background-color : #8bda8b !important;
      color : white;
   }
   .forpets_q{
      margin-bottom : 20%;
      box-shadow: 0 5px 7px lightgray, 0 6px 8px lightgray;
   }

</style>
<script>
function show_a(this_id) {
   var id = this_id + "_a";
   console.log("id : " + id);
   for(i=1;i<=10;i++){
      console.log("q_i_a : " + "q_" + i + "_a");
      var check = "q_"+i+"_a";
      console.log(check);
      console.log(id == check);
      if(id == check) {
         $("#"+check).toggle();
         $("#"+this_id).toggleClass("active");
      } else {
         $("#q_"+i+"_a").hide();
         $("#q_"+i).removeClass("active");;
      }
   }
}

$(document).ready(function(){
   for(i=1;i<=10;i++){
      $("#q_"+i+"_a").hide();
   }
});
</script>
</head>
<body>
   <%@ include file="/WEB-INF/views/nav.jsp" %>
   <form action="getCustomerList" method="post">
   <fieldset>
      <div class="mainBanner">
      <h2 class="mainText">ForPets 고객센터</h2>
         <div class="top-search-form">도움말 검색&nbsp;
            <i class="fas fa-search"></i>
            <input type="text" class="element-input" name="searchKeyword" placeholder="검색어를 입력하세요." data-game="2017090003">
         </div>
      </div>
   </fieldset>
   </form>
   <h5 class="qs-text">자주 묻는 질문
   <span class="qs-text-bt">
   <button type="button"  onclick="location.href='myCustBoard.do'" name="myCust">내 문의 내역</button>
   <button type="button"  onclick="location.href='customerBoard.do'" name="customerBoard" >문의 글 쓰기</button>
   </span>
   </h5>
   <div class="qs-box font">
      <div class="row container">
         <div class="col-2 d-flex justify-content-center">
            <button type="button" class="forpets_q show-qa" id="q_1" onclick="show_a(this.id)">회원에서 파트너로 전향하려면</button>
         </div>
         <div class="col-2 d-flex justify-content-center">
            <button type="button" class="forpets_q show-qa" id="q_2" onclick="show_a(this.id)">출입 비밀번호등 정보 유출이 걱정될 때</button>
            
         </div>
         <div class="col-2 d-flex justify-content-center">
            <button type="button" class="forpets_q show-qa" id="q_3" onclick="show_a(this.id)">픽업이란?</button>
         </div>
         <div class="col-2 d-flex justify-content-center">
            <button type="button" class="forpets_q show-qa" id="q_4" onclick="show_a(this.id)">강아지와 고양이 동시에 돌봄 가능한가요?</button>
         </div>
         <!-- <div class="col-2 d-flex justify-content-center">
            <button type="button" class="forpets_q show-qa" id="q_5" onclick="show_a(this.id)">자주 묻는 질문 5</button>
         </div>-->
         <div class="col-2 d-flex justify-content-center"></div>
         <div class="col-2 d-flex justify-content-center"></div>
         
         <div class="col-12" id="q_1_a">
            <div class="qa-box">
               <h5>회원에서 펫트너로 전향하려면 어떻게 해야 하나요</h5>
               <span>펫트너는 회원분들의 아이를</span><br>
               <span>자기 자식 처럼 여길 수 있는 분들로</span><br>
               <span>엄선하고 있기 때문에 관리자가 선별하여</span><br>
               <span>승인 해드리는 형태 이므로</span><br>
               <span>관리자에게 신청을 먼저 해주시면 됩니다.</span><br>
            </div>
         </div>
         
         <div class="col-12" id="q_2_a">
            <div class="qa-box">
               <h5>출입 비밀번호등 정보 유출이 걱정될 때</h5>
            <span>출입 비밀번호는 포펫츠 서버에도</span><br>
            <span>저장되지 않으며, 돌봄종료 시 자동으로 </span><br>
            <span>소멸됩니다.</span><br>
            <span>또한, 펫트너도 개인정보의 중요성을</span><br>
            <span>인지한 펫트너만 운영 중입니다.</span><br>
            </div>
         </div>
         
         <div class="col-12" id="q_3_a">
            <div class="qa-box">
               <h5>픽업이란?</h5>
            <span>포펫츠 펫트너가 고객님이 희망하시는</span><br>
            <span>출발지에서 도착지까지 반려견을 픽업합니다.</span><br>
            <span>병원 방문 (간단한 진료, 예방접종)</span><br>
            <span>미용샵, 유치원 등 요청 장소까지 산책 이동</span><br>
            <span>병원 왕복인 경우 최대 30분 동안 대기합니다.</span><br>
            </div>
         </div>
         
         <div class="col-12" id="q_4_a">
            <div class="qa-box">
               <h5>강아지와 고양이 동시에 돌봄 가능한가요?</h5>
            <span>가능합니다.</span><br>
            <span>기본돌봄으로 선택 시 반려견/반려묘</span><br>
            <span>동시 돌봄을 신청하실 수 있습니다.</span><br>
            </div>
         </div>
         
         <!-- <div class="col-12" id="q_5_a">
            <div class="qa-box">
               <h5>자주 묻는 질문 5</h5>
            <span>자주 묻는 질문 5에 대한 답변입니다.</span><br>
            <span>자주 묻는 질문 5에 대한 답변입니다.</span><br>
            <span>자주 묻는 질문 5에 대한 답변입니다.</span><br>
            <span>자주 묻는 질문 5에 대한 답변입니다.</span><br>
            <span>자주 묻는 질문 5에 대한 답변입니다.</span><br>
            </div>
         </div> -->
         
         <div class="col-2 d-flex justify-content-center">
            <button type="button" class="forpets_q show-qa" id="q_6" onclick="show_a(this.id)">원하는 펫트너와 예약하고 싶을때</button>
         </div>
         <div class="col-2 d-flex justify-content-center">
            <button type="button" class="forpets_q show-qa" id="q_7" onclick="show_a(this.id)">새벽이나 밤 늦게도 이용 할 수 있나요?</button>
         </div>
         <div class="col-2 d-flex justify-content-center">
            <button type="button" class="forpets_q show-qa" id="q_8" onclick="show_a(this.id)">서비스에 대한 비용 결제는 언제되나요?</button>
         </div>
         <div class="col-2 d-flex justify-content-center">
            <button type="button" class="forpets_q show-qa" id="q_9" onclick="show_a(this.id)">하루에 여러번 방문도 되나요?</button>
         </div>
        <!-- <div class="col-2 d-flex justify-content-center">
            <button type="button" class="forpets_q show-qa" id="q_10" onclick="show_a(this.id)">자주 묻는 질문 10</button>
         </div> -->
         <div class="col-2 d-flex justify-content-center"></div>
         <div class="col-12" id="q_6_a">
            <div class="qa-box">
               <h5>원하는 펫트너와 예약할 수 있나요?</h5>
            <span>서비스 예약 단계에서 펫트너 리스트를</span><br>
            <span>확인하여 원하는 펫트너를 선택할 수</span><br>
            <span>있습니다.</span><br>
            </div>
         </div>
         
         <div class="col-12" id="q_7_a">
            <div class="qa-box">
               <h5>새벽이나 밤 늦게도 이용 할 수 있나요?</h5>
            <span>포펫츠 서비스 이용 가능 시간은</span><br>
            <span>오후 12시 ~ 오후 8시 입니다.</span><br>
            </div>
               
         </div>
         
         <div class="col-12" id="q_8_a">
            <div class="qa-box">
               <h5>서비스에 대한 비용 결제는 언제되나요?</h5>
            <span>결제는 서비스 예약 시 이루어집니다.</span><br>
            </div>
         </div>
         
         <div class="col-12" id="q_9_a">
            <div class="qa-box">
               <h5>하루에 여러번 방문도 되나요?</h5>
            <span>펫트너는 하루에 2타임까지 예약이 가능합니다.</span><br>
            </div>
               
         </div>
         
         <!-- <div class="col-12" id="q_10_a">
            <div class="qa-box">
               <h5>자주 묻는 질문 10</h5>
            <span>자주 묻는 질문 10에 대한 답변입니다.</span><br>
            <span>자주 묻는 질문 10에 대한 답변입니다.</span><br>
            <span>자주 묻는 질문 10에 대한 답변입니다.</span><br>
            <span>자주 묻는 질문 10에 대한 답변입니다.</span><br>
            <span>자주 묻는 질문 10에 대한 답변입니다.</span><br>
            </div>
         </div> -->
      </div>
   </div>
   <br>
   <%@ include file="/WEB-INF/views/footer.jsp" %>
</body>
</html>