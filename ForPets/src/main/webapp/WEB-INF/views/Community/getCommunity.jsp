<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>    
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>make community</title>
</head>
<body>
	<h1>소모임 생성</h1>
	<h5>자신의 소모임을 만들어 보세요</h5>
	
 	<c:set var="now" value="<%=new java.util.Date()%>" />
	<c:set var="date"><fmt:formatDate value="${now}" pattern="yyMMddmmss" /></c:set>
	<c:set var="min"><fmt:formatDate value="${now}" pattern="yyyy-MM-dd" /></c:set>  
	<c:set var="c_code" value="c${date }"></c:set>
<%-- 	<c:set var="sv_code" value="s${date}-${c_code}"></c:set> --%>
<%-- 	<!-- count 생성 -->
	<c:set var="c" value='${c+1}'></c:set>
	<c:if test="${c<10}">
		<c:set var="anscodeno" value="od0${j}"></c:set>
	</c:if>
	<c:if test="${c>=10}">
		<c:set var="anscodeno" value="od${j}"></c:set>
	</c:if> --%>

 	
	<form action="insertcommunity.do" method="post" >
<%-- 	<c:if test="com${date }-${listcount }" ></c:if> --%>
	<input type="hidden" value="c${date }" name="c_code">
		<table>
		<tr>
			<th>제목 : <input type="text" name="c_title"></th>
		</tr>
		<tr>
			<td>내용을 입력해 주세요</td>
			<td><a href="survey.do/${c_code }"><input type="button" value="설문지 만들기"/></a></td>
		</tr>
		<tr>	
			<td><textarea rows="15" cols="65" name="c_content"></textarea></td>
		</tr>
		<tr>	
			<td colspan="2"><input type="submit" value="작성하기"></td>
			<td colspan="2"><input type="reset" value="취소"></td>
		</tr>
	</table>
	</form>
	<a href="communitylist.do">글 목록 가기</a>
</body>
</html>