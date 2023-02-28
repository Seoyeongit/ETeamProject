<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 상세보기</title>
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
				<form action="../deleteNotice.do">
					<input name="ntc_seq" type="hidden"
						value="${getNoticeBoard.ntc_seq }" />

					<table cellpadding="0" cellspacing="0" align="center">
						<tr>
							<td width="70">제목</td>
							<td align="left">${getNoticeBoard.ntc_title}</td>
						</tr>
						<tr>
							<td>내용</td>
							<td align="left" width="700" height="100"><pre>${getNoticeBoard.ntc_ctnt}</pre></td>
						</tr>
						<tr>
							<td>등록일</td>
							<td align="left">${getNoticeBoard.ntc_cdate }</td>
						</tr>
						<tr>
							<td>수정일</td>
							<td align="left">${getNoticeBoard.ntc_udate }</td>
						</tr>
						<tr>
							<td>조회수</td>
							<td align="left">${getNoticeBoard.ntc_hit }</td>
						</tr>
						<tr>
							<td colspan="2" align="right"><input type="button"
								value="목록" onclick="location.href= '../noticeBoard'" /> <input
								type="button" value="수정"
								onclick="location.href= '../updateNoticeForm.do/${getNoticeBoard.ntc_seq}'" />
								<input type="submit" value="삭제" /></td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>
</body>
</html>