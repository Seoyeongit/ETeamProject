<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
				<form action="insertNotice.do" method="post">
					<table align="center">
						<tr>
							<td colspan="2"><h1>공지사항 등록</h1></td>
						</tr>
						<tr>
							<td width="70">제목</td>
							<td align="left"><input name="ntc_title" type="text"
								size="74" /></td>
						</tr>
						<tr>
							<td>내용</td>
							<td align="left"><textarea name="ntc_ctnt" cols="70"
									rows="10"></textarea></td>
						</tr>
						<tr>
							<td colspan="2" align="right"><input type="reset"
								value="모두 삭제" /> <input type="button" value="목록"
								onclick="location.href= 'noticeBoard';"> <input
								type="submit" value="작성" /></td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>
</body>
</html>