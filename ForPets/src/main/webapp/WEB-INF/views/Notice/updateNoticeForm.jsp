<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 수정</title>
<jsp:include page="../favicon.jsp"></jsp:include>
<!-- Core theme CSS (includes Bootstrap)-->
<link
	href="${pageContext.request.contextPath}/resources/css/admin/sideBar.css"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath}/resources/css/admin/admin.css?after"
	rel="stylesheet" type="text/css" />
<link
	href="${pageContext.request.contextPath}/resources/css/admin/notice.css?after"
	rel="stylesheet" type="text/css" />
</head>
<body>
	<div class="d-flex" id="wrapper">
		<jsp:include page="../Admin/sideBar.jsp" />
		<!-- Page content wrapper-->
		<div id="page-content">
			<jsp:include page="../Admin/top.jsp" />

			<div class="container-fluid" id="admin-content">
				<form action="../updateNotice.do" method="post">
					<input name="ntc_seq" type="hidden"
						value="${getNoticeBoard.ntc_seq }" />

					<table>
						<tr>
							<td width="70">제목</td>
							<td align="left"><input name="ntc_title" type="text"
								size="74" value="${getNoticeBoard.ntc_title}" /></td>
						</tr>
						<tr>
							<td>내용</td>
							<td align="left"><textarea name="ntc_ctnt" cols="70"
									rows="10">${getNoticeBoard.ntc_ctnt}</textarea></td>
						</tr>
						<tr>
							<td>등록일</td>
							<td align="left">${getNoticeBoard.ntc_cdate }</td>
						</tr>
						<tr>
							<td>조회수</td>
							<td align="left">${getNoticeBoard.ntc_hit }</td>
						</tr>
						<tr>
							<td colspan="2" align="right"><input type="submit"
								value="확인" /></td>
						</tr>
					</table>
				</form>
				<hr>
			</div>
		</div>
	</div>
</body>
</html>