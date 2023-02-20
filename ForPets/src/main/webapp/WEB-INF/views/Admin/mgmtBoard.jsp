<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 관리</title>
</head>
<body>
<button onclick="location.href='${pageContext.request.contextPath}/Admin/main'">관리자 페이지 홈</button>
<h1>게시판 관리</h1>

<h3>반려인 팁</h3>
	<form action="getTipList" method="post">
		<table border="1" cellpadding="0" cellspacing="0" width="700">
			<tr>
				<td align="right"><select name="searchCondition">
						<option value="TITLE">제목</option>
						<option value="CONTENT">내용</option>
				</select> <input name="searchKeyword" type="text" /> <input type="submit"
					value="검색" /></td>
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
				<td><img src="${ tip.tip_img_url }"
					onclick="location.href='getTip?tip_seq=${ tip.tip_seq }'"></td>
				<td align="left"><a href="getTip?tip_seq=${ tip.tip_seq }">
						${ tip.tip_title }</a></td>
				<td>관리자</td>
				<td><fmt:formatDate value="${ tip.tip_create_date }"
						pattern="yyyy-MM-dd" /></td>
				<td>${ tip.tip_hit }</td>
			</tr>
		</c:forEach>
	</table>
	<br>
	<a href="${pageContext.request.contextPath}/Tip/insertTip">새 글 작성</a>

	<h3>소모임</h3>


</body>
</html>