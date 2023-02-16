<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>    
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 수정하기</title>
</head>
<body>
	<h1>소모임 수정</h1>
	
	<!-- ** 경환 : 설문지코드 자동생성 : s + 날짜(yyyymmdd) + 커뮤니티코드 -->
<%-- 	<c:set var="now" value="<%=new java.util.Date()%>" />
	<c:set var="date"><fmt:formatDate value="${now}" pattern="yyyyMMdd" /></c:set>
	<c:set var="min"><fmt:formatDate value="${now}" pattern="yyyy-MM-dd" /></c:set>  
	<c:set var="sv_code" value="s${date}-${c_code}"></c:set>
	<!-- count 생성 -->
	<c:set var="c" value='${c+1}'></c:set>
	<c:if test="${c<10}">
		<c:set var="anscodeno" value="od0${j}"></c:set>
	</c:if>
	<c:if test="${c>=10}">
		<c:set var="anscodeno" value="od${j}"></c:set>
	</c:if> --%>

 	
	<form action="../updateboard.do" method="post" >
	<input type="hidden" name="c_code" value="${communityboard.c_code }">
		<table>
		<tr>
			<th>제목 : <input type="text" name="c_title" value="${communityboard.c_title }"></th>
		</tr>
		<tr>
			<td>내용을 입력해 주세요</td>
			<td><input type="button" value="설문지 만들기"/></td>
		</tr>
		<tr>	
			<td><textarea rows="15" cols="65" name="c_content" >${communityboard.c_content }</textarea></td>
		</tr>
		<tr>	
			<td colspan="2"><input type="submit" value="수정하기"></td>
			<td colspan="2"><input type="reset" value="취소"></td>
		</tr>
	</table>
		
	</form>
	<a href="communitylist.do">글 목록 가기</a>
</body>
</html>