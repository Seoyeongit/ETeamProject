<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지 사항</title>
<jsp:include page="../favicon.jsp"></jsp:include>
<!-- Core theme CSS (includes Bootstrap)-->
<link
	href="${pageContext.request.contextPath}/resources/css/admin/sideBar.css"
	rel="stylesheet" />
</head>
<body>
	<div class="d-flex" id="wrapper">
		<jsp:include page="../Admin/sideBar.jsp" />
		<!-- Page content wrapper-->
		<div id="page-content-wrapper">
			<jsp:include page="../Admin/top.jsp" />

			<h1>공지 사항</h1>
			<!-- 검색 시작 -->
			<form action="noticeBoard" method="post">
				<table cellpadding="0" width="700">
					<tr>
						<td align="right"><select name="searchCondition">
								<option value="TITLE">제목</option>
								<option value="CONTENT">내용</option>
						</select> 
						<input name="searchKeyword" type="text"/> 
						<input type="submit" value="검색"/></td>
					</tr>
				</table>
				<br>
			</form>

			<!-- 검색 결과 조회 테이블 -->
			<table border="1" cellpadding="0" width="700">
				<tr>
					<th width="100">번호</th>
					<th width="300">제목</th>
					<th width="100">작성일</th>
					<th width="100">조회수</th>
				</tr>

				<c:forEach items="${noticeBoard }" var="notice">
					<tr>
						<td>${notice.ntc_seq }</td>
						<td align="left"><a
							href="getNoticeBoard.do/${notice.ntc_seq }">${notice.ntc_title }</a>
						</td>
						<td>${notice.ntc_cdate }</td>
						<td>${notice.ntc_hit }</td>
					</tr>
				</c:forEach>
			</table>
			<br>
			<button onclick="location.href ='noticeForm'">글쓰기</button>
		</div>
	</div>
</body>
<!-- Bootstrap core JS-->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script
	src="${pageContext.request.contextPath}/resources/js/admin/sideBar.js"></script>
</html>