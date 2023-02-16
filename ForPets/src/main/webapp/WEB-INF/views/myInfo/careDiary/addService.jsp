<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %> 
 
 <c:forEach items="${careDIA.voR.s_numArr }" var="sNum">
    
    <c:if test="${sNum eq 6 }">
    <div>
        <h4>추가 샤워서비스</h4>
        <div>${careDIA.shower_serv}</div>
    </div>
    </c:if>
   
    <c:if test="${sNum eq 7 }">
    <div>
        <h4>추가 훈련서비스</h4>
        <div>${careDIA.training_serv}</div>
    </div>
    </c:if>
    
</c:forEach>