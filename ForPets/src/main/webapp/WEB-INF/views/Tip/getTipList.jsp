<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>    
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<body>
	<ul>
		<li><a href="${pageContext.request.contextPath}/">홈</a></li>
		<li><a href="${pageContext.request.contextPath}/Service/choice">서비스 예약</a></li>
		<li><a href="${pageContext.request.contextPath}/FindHospital/findHospital">근처 병원 찾기</a></li>
		<li><a href="${pageContext.request.contextPath}/Tip/getTipList">Tip 게시판</a></li>
	</ul>
	<center>
		<form action="getTipList" method="post">
		<table border="1" cellpadding="0" cellspacing="0" width="700">
			<tr>
				<td align="right">
					<select name="searchCondition">
							<option value="TITLE">제목</option>
							<option value="CONTENT">내용</option>
					</select>
					<input name="searchKeyword" type="text" />
					<input  type="submit" value="검색" />
				</td>
			</tr>
		</table>
		</form>
		<table border="1" cellpadding="0" cellspacing="0" width="700">
			<tr>
				<th bgcolor="orange" width="100"></th>
				<th bgcolor="orange" width="200">제목</th>
				<th bgcolor="orange" width="150">작성자</th>
				<th bgcolor="orange" width="150">작성일</th>
				<th bgcolor="orange" width="100">조회수</th>
			</tr>
			<c:forEach items="${tipList }" var="tip">
				<tr>
					<td><img src="${ tip.tip_img_url }" onclick="location.href='getTip?tip_seq=${ tip.tip_seq }'"></td>
					<td align="left"><a href="getTip?tip_seq=${ tip.tip_seq }">
							${ tip.tip_title }</a></td>
					<td>관리자</td>
					<td><fmt:formatDate value="${ tip.tip_create_date }" pattern="yyyy-MM-dd" /></td>
					<td>${ tip.tip_hit }</td>
				</tr>
			</c:forEach>
		</table>
		<br>
		<a href="insertTip">새 글 작성</a>
	</center>
</body>
</html>