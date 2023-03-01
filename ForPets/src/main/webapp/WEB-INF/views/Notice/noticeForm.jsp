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
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link
	href="${pageContext.request.contextPath}/resources/css/admin/notice.css?ver=1"
	rel="stylesheet" type="text/css" />
</head>
<body>
	<div class="d-flex" id="wrapper">
		<jsp:include page="../Admin/sideBar.jsp" />
		<!-- Page content wrapper-->
		<div id="page-content">
			<jsp:include page="../Admin/top.jsp" />

			<div class="container-fluid" id="admin-content">
				<div
					class="d-sm-flex align-items-center justify-content-between mb-4">
					<h3 class="h3 mb-0 text-gray-800">공지사항 등록</h3>
				</div>
				<div class="card shadow mb-4">
					<form action="insertNotice.do" method="post">
						<div class="table-responsive px-5">
							<table class="table table-borderless align-middle">
								<tr>
									<td>제목</td>
									<td align="left" style="width: 90%"><input
										name="ntc_title" type="text" class="form-control" /></td>
								</tr>
								<tr>
									<td>내용</td>
									<td align="left" style="width: 90%"><textarea
											name="ntc_ctnt" class="form-control" cols="70"></textarea></td>
								</tr>
								<tr>
									<td colspan="2" align="right"><input type="reset"
										class="btn border" value="모두 삭제" /> <input type="button"
										class="btn border" value="목록"
										onclick="location.href= 'noticeBoard';"> <input
										type="submit" class="btn border" value="작성" /></td>
								</tr>
							</table>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>