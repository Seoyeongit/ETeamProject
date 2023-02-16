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
</body>
</html>