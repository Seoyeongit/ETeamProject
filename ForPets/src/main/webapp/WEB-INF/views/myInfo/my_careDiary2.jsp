<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body {
	padding-top : 80px;
	margin : 0 auto;
	color : #2f3438;
	background-color: #f5f5f5;
	
}
h2{
	font-weight: bold;
}

h4{
	margin-bottom: 10px;
	color :  #8bda8b;
	font-weight: bold;
}
#report{
	margin-bottom:30px;
	padding: 30px;
    background-color: #fff;
    border-top: 1px solid #8ea38e;
}

#Agreement{
	text-align: center;
	color : #2f3438;
}

#Agreement h5{
	font-size: 18px;
	font-weight: 500;
}

#Agreement-1{
	color:#888;
	font-size: 12px;
	margin:10px;
}

.draggable{
  -webkit-user-select:none;
  -moz-user-select:none;
  -ms-user-select:none;
  user-select:none
}
</style>

</head>
<body>
	<c:choose>
		<c:when test="${careDIA.voR.s_num eq 1 }"><jsp:include page="./careDiary/normal.jsp"/></c:when>
		<c:when test="${careDIA.voR.s_num eq 2 }"><jsp:include page="./careDiary/wark.jsp"/></c:when>
		<c:when test="${careDIA.voR.s_num eq 4 }"><jsp:include page="./careDiary/pickUp_hospital.jsp"/></c:when>
		<c:when test="${careDIA.voR.s_num eq 5 }"><jsp:include page="./careDiary/pickUp_salon.jsp"/></c:when>
	</c:choose>
	
	<c:forEach items="${careDIA.voR.s_numArr }" var="sNum">
    
    <c:if test="${sNum eq 6 || sNum eq 7 }">
    <div>
        <jsp:include page="./careDiary/addService.jsp"/>
    </div>
    </c:if>
	</c:forEach>
	
	<div id="Agreement" class="draggable">
		<h5>고객님에게 한치 거짓 없는 돌봄일지 인 것을 알려드립니다.</h5>
		작성자 : ${careDIA.voR.voP.part_name} (펫트너)<br>
		<div id="Agreement-1">
		이 문서는 ${careDIA.complete_day} 에 작성된 돌봄일지 입니다.<br>
		${careDIA.voR.voP.part_name}(펫트너)는 고객님을 기만한 돌봄일지 작성시 법적책임을 받는것에 동의합니다.
		</div>
		<div>
			<img src = "${pageContext.request.contextPath}/resources/assets/img/logo_bk.png" width="120px" style="opacity: 0.2;">
		</div>
		</div>
</body>
</html>