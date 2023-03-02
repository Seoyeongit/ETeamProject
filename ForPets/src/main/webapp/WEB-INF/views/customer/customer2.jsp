<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${pageContext.request.contextPath}/resources/css/customer.css" rel="stylesheet" />
<script type="text/javascript" src="http://code.jquery.com/jquery-3.1.1.js"></script>
<title>ForPets 고객센터</title>
<style>
   .footer {
  text-align: center;
  }
   .qs-box{
      margin-left : 15%;
   }
   .qa-box{
      margin-left : 5%;
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
	<c:choose>
			<c:when test="${role eq 'admin' }">
			<button type="button"  onclick="location.href='getCustomerList'" name="getCustomerList">모든 문의 내역</button>
			</c:when>
			<c:otherwise>
			<button type="button"  onclick="location.href='myCustBoard.do'" name="myCust">내 문의 내역</button>
			</c:otherwise>
	</c:choose>
	<button type="button"  onclick="location.href='customerBoard.do'" name="customerBoard" >문의 글 쓰기</button>
	</span>
   </h5>
   <div class="qs-box font">
      <div class="row container">
         <div class="col-2 d-flex justify-content-center">
            <button type="button" class="forpets_q show-qa" id="q_1" onclick="show_a(this.id)">자주 묻는 질문 1</button>
         </div>
         <div class="col-2 d-flex justify-content-center">
            <button type="button" class="forpets_q show-qa" id="q_2" onclick="show_a(this.id)">자주 묻는 질문 2</button>
            
         </div>
         <div class="col-2 d-flex justify-content-center">
            <button type="button" class="forpets_q show-qa" id="q_3" onclick="show_a(this.id)">자주 묻는 질문 3</button>
         </div>
         <div class="col-2 d-flex justify-content-center">
            <button type="button" class="forpets_q show-qa" id="q_4" onclick="show_a(this.id)">자주 묻는 질문 4</button>
         </div>
         <div class="col-2 d-flex justify-content-center">
            <button type="button" class="forpets_q show-qa" id="q_5" onclick="show_a(this.id)">자주 묻는 질문 5</button>
         </div>
         <div class="col-2 d-flex justify-content-center"></div>
         
         <div class="col-12" id="q_1_a">
            <div class="qa-box">
               <h5>자주 묻는 질문 1</h5>
               <span>자주 묻는 질문 1에 대한 답변입니다.</span><br>
               <span>자주 묻는 질문 1에 대한 답변입니다.</span><br>
               <span>자주 묻는 질문 1에 대한 답변입니다.</span><br>
               <span>자주 묻는 질문 1에 대한 답변입니다.</span><br>
               <span>자주 묻는 질문 1에 대한 답변입니다.</span><br>
            </div>
         </div>
         
         <div class="col-12" id="q_2_a">
            <div class="qa-box">
               <h5>자주 묻는 질문 2</h5>
            <span>자주 묻는 질문 2에 대한 답변입니다.</span><br>
            <span>자주 묻는 질문 2에 대한 답변입니다.</span><br>
            <span>자주 묻는 질문 2에 대한 답변입니다.</span><br>
            <span>자주 묻는 질문 2에 대한 답변입니다.</span><br>
            <span>자주 묻는 질문 2에 대한 답변입니다.</span><br>
            </div>
         </div>
         
         <div class="col-12" id="q_3_a">
            <div class="qa-box">
               <h5>자주 묻는 질문 3</h5>
            <span>자주 묻는 질문 3에 대한 답변입니다.</span><br>
            <span>자주 묻는 질문 3에 대한 답변입니다.</span><br>
            <span>자주 묻는 질문 3에 대한 답변입니다.</span><br>
            <span>자주 묻는 질문 3에 대한 답변입니다.</span><br>
            <span>자주 묻는 질문 3에 대한 답변입니다.</span><br>
            </div>
         </div>
         
         <div class="col-12" id="q_4_a">
            <div class="qa-box">
               <h5>자주 묻는 질문 4</h5>
            <span>자주 묻는 질문 4에 대한 답변입니다.</span><br>
            <span>자주 묻는 질문 4에 대한 답변입니다.</span><br>
            <span>자주 묻는 질문 4에 대한 답변입니다.</span><br>
            <span>자주 묻는 질문 4에 대한 답변입니다.</span><br>
            <span>자주 묻는 질문 4에 대한 답변입니다.</span><br>
            </div>
         </div>
         
         <div class="col-12" id="q_5_a">
            <div class="qa-box">
               <h5>자주 묻는 질문 5</h5>
            <span>자주 묻는 질문 5에 대한 답변입니다.</span><br>
            <span>자주 묻는 질문 5에 대한 답변입니다.</span><br>
            <span>자주 묻는 질문 5에 대한 답변입니다.</span><br>
            <span>자주 묻는 질문 5에 대한 답변입니다.</span><br>
            <span>자주 묻는 질문 5에 대한 답변입니다.</span><br>
            </div>
         </div>
         
         <div class="col-2 d-flex justify-content-center">
            <button type="button" class="forpets_q show-qa" id="q_6" onclick="show_a(this.id)">자주 묻는 질문 6</button>
         </div>
         <div class="col-2 d-flex justify-content-center">
            <button type="button" class="forpets_q show-qa" id="q_7" onclick="show_a(this.id)">자주 묻는 질문 7</button>
         </div>
         <div class="col-2 d-flex justify-content-center">
            <button type="button" class="forpets_q show-qa" id="q_8" onclick="show_a(this.id)">자주 묻는 질문 8</button>
         </div>
         <div class="col-2 d-flex justify-content-center">
            <button type="button" class="forpets_q show-qa" id="q_9" onclick="show_a(this.id)">자주 묻는 질문 9</button>
         </div>
         <div class="col-2 d-flex justify-content-center">
            <button type="button" class="forpets_q show-qa" id="q_10" onclick="show_a(this.id)">자주 묻는 질문 10</button>
         </div>
         <div class="col-2 d-flex justify-content-center"></div>
         
         <div class="col-12" id="q_6_a">
            <div class="qa-box">
               <h5>자주 묻는 질문 6</h5>
            <span>자주 묻는 질문 6에 대한 답변입니다.</span><br>
            <span>자주 묻는 질문 6에 대한 답변입니다.</span><br>
            <span>자주 묻는 질문 6에 대한 답변입니다.</span><br>
            <span>자주 묻는 질문 6에 대한 답변입니다.</span><br>
            <span>자주 묻는 질문 6에 대한 답변입니다.</span><br>
            </div>
               
         </div>
         
         <div class="col-12" id="q_7_a">
            <div class="qa-box">
               <h5>자주 묻는 질문 7</h5>
            <span>자주 묻는 질문 7에 대한 답변입니다.</span><br>
            <span>자주 묻는 질문 7에 대한 답변입니다.</span><br>
            <span>자주 묻는 질문 7에 대한 답변입니다.</span><br>
            <span>자주 묻는 질문 7에 대한 답변입니다.</span><br>
            <span>자주 묻는 질문 7에 대한 답변입니다.</span><br>
            </div>
               
         </div>
         
         <div class="col-12" id="q_8_a">
            <div class="qa-box">
               <h5>자주 묻는 질문 8</h5>
            <span>자주 묻는 질문 8에 대한 답변입니다.</span><br>
            <span>자주 묻는 질문 8에 대한 답변입니다.</span><br>
            <span>자주 묻는 질문 8에 대한 답변입니다.</span><br>
            <span>자주 묻는 질문 8에 대한 답변입니다.</span><br>
            <span>자주 묻는 질문 8에 대한 답변입니다.</span><br>
            </div>
         </div>
         
         <div class="col-12" id="q_9_a">
            <div class="qa-box">
               <h5>자주 묻는 질문 9</h5>
            <span>자주 묻는 질문 9에 대한 답변입니다.</span><br>
            <span>자주 묻는 질문 9에 대한 답변입니다.</span><br>
            <span>자주 묻는 질문 9에 대한 답변입니다.</span><br>
            <span>자주 묻는 질문 9에 대한 답변입니다.</span><br>
            <span>자주 묻는 질문 9에 대한 답변입니다.</span><br>
            </div>
               
         </div>
         
         <div class="col-12" id="q_10_a">
            <div class="qa-box">
               <h5>자주 묻는 질문 10</h5>
            <span>자주 묻는 질문 10에 대한 답변입니다.</span><br>
            <span>자주 묻는 질문 10에 대한 답변입니다.</span><br>
            <span>자주 묻는 질문 10에 대한 답변입니다.</span><br>
            <span>자주 묻는 질문 10에 대한 답변입니다.</span><br>
            <span>자주 묻는 질문 10에 대한 답변입니다.</span><br>
            </div>
         </div>
      </div>
   </div>
   <br>
   <%@ include file="/WEB-INF/views/footer.jsp" %>
</body>
</html>