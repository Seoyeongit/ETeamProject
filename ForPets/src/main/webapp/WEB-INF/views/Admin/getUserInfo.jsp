<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<title>유저 정보</title>
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
	href="${pageContext.request.contextPath}/resources/css/admin/userList.css?ver=1.1"
	rel="stylesheet" type="text/css" />

<style>
#avatar-col {
	margin-right: auto;
	margin-left: auto;
	text-align: center;
}

.avatar {
	width: max-content;
}
</style>

</head>
<body>
	<div class="d-flex" id="wrapper">
		<jsp:include page="sideBar.jsp" />
		<!-- Page content wrapper-->
		<div id="page-content">
			<jsp:include page="top.jsp" />
			<div class="container-fluid" id="admin-content">
				<div
					class="d-sm-flex align-items-center justify-content-between mb-4">
					<h1 class="h3 mb-0 text-gray-800">유저 정보</h1>
				</div>
				<div class="card shadow mb-4">
					<div class="card-header py-3" id="table-card-header">
						<h5 class="m-0 text-gray">회원 정보</h5>
					</div>
					<div class="table-responsive px-5 mb-5">
						<table class="table table-borderless align-middle">
							<tbody>
								<tr height="50">
									<td class="align-middle">아이디</td>
									<td style="width: 90%"><input type="text"
										class="form-control" name="user_id"
										value="${userInfo.user_id}" readonly="readonly"
										onfocus="this.blur();" tabindex="-1"
										style="background-color: #f2f5f3;" /></td>
								</tr>

								<tr height="50">
									<td class="align-middle">이름</td>
									<td style="width: 90%"><input type="text"
										class="form-control" size="30" name="user_name"
										value="${userInfo.user_name}"></td>
								</tr>


								<tr height="50">
									<td class="align-middle">주소</td>
									<td><input type="text" class="form-control"
										name="user_add" value="${userInfo.user_add}"></td>
								</tr>

								<tr height="50">
									<td class="align-middle">생년월일</td>
									<td><input type="text" class="form-control" name="birth"
										value="${userInfo.birth}"></td>
								</tr>

								<tr height="50">
									<td class="align-middle">전화번호</td>
									<td><input type="tel" class="form-control" name="phnumber"
										value="${userInfo.phnumber}"></td>
								</tr>

							</tbody>
						</table>
					</div>
				</div>
				<div class="card shadow mb-4">
					<div class="card-header py-3" id="table-card-header">
						<h5 class="m-0 text-gray">펫 정보</h5>
					</div>
					<div class="table-responsive px-5 mb-5">
						<c:forEach var="userPet" items="${userPet}">
							<div class="row">
								<div class="col" id="avatar-col">
									<img src="${pageContext.request.contextPath}/myInfo/display?fileName=${userPet.img}" class="avatar" alt="${userPet.img}"
										style="width: 200px;" />
								</div>
							</div>
							<table class="table table-borderless align-middle">
								<tbody>
									<tr height="50">
										<td class="align-middle">이름</td>
										<td style="width: 90%"><input type="text"
											class="form-control" name="name" value="${userPet.name}"
											readonly="readonly" onfocus="this.blur();" tabindex="-1"
											style="background-color: #f2f5f3;" /></td>
									</tr>

									<tr height="50">
										<td class="align-middle">종류</td>
										<td style="width: 90%"><input type="text"
											class="form-control" size="30" name="type"
											value="<c:choose><c:when test="${userPet.type eq 'cat' }">고양이</c:when><c:when test="${userPet.type eq 'dog' }">강아지</c:when><c:otherwise></c:otherwise></c:choose>"></td>
									</tr>

									<tr height="50">
										<td class="align-middle">나이</td>
										<td style="width: 90%"><input type="text"
											class="form-control" size="30" name="age"
											value="${userPet.age}"></td>
									</tr>
<!--
									<tr height="50">
										<td class="align-middle">성별</td>
										<td style="width: 90%"><input type="text"
											class="form-control" size="30" name="gender"
											value="<c:choose><c:when test="${fn:contains(userPet.gender, 'f')}"> <c:out value="$여아" /></c:when><c:when test="${fn:contains(userPet.gender, 'm')}">남아</c:when><c:otherwise></c:otherwise></c:choose>"></td>
									</tr>

									<tr height="50">
										<td class="align-middle">중성화</td>
										<td style="width: 90%"><input type="text"
											class="form-control" size="30" name="isNeutered"
											value="${userPet.isNeutered}"></td>
									</tr>


									<tr height="50">
										<td class="align-middle">예방접종</td>
										<td><input type="text" class="form-control"
											name="isVaccin" value="${userPet.isVaccin}"></td>
									</tr>
  -->
								</tbody>
							</table>
						</c:forEach>
					</div>

				</div>
			</div>
		</div>
	</div>
</body>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<!-- Core theme JS-->
<script
	src="${pageContext.request.contextPath}/resources/js/admin/sideBar.js"></script>
</html>