<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>

<style type="text/css">
	.list-beauty {
		padding: 8px;
		padding-left: 15px;
		padding-right: 15px;
		margin-right: 3px;
		border: 1px solid #8bda8b;
		background-color: #c1f5c1;
		border-radius: 50px;
		border: 1px solid #8bda8b;
	}
	
	#care-report-container {
		padding: 30px;
		background-color: #fff;
		margin-bottom: 40px;
	}
</style>
</head>
<body>
	<h2>📄' ${careDIA.voR.voPet.name }'미용픽업서비스 돌봄일지 입니다.</h2>
	<p>담당 펫트너 : ${careDIA.voR.voP.part_name }</p>


	<div id="care-report-container">주소 : 어디어디살롱 담당미용사 : 이날두미용사</div>


	<div>
		<h4>'${careDIA.voR.voPet.name }'의 상태</h4>
		<div id="report">${careDIA.pet_condition }</div>
	</div>

	<div>
		<h4>미용 받은 내역</h4>
		<div id="report">
			<c:forEach items="${beauty_list}" var="list">
				<button class="list-beauty">
					<span>${list}</span>
				</button>
			</c:forEach>
		</div>
	</div>

	<div>
		<h4>돌봄일지</h4>
		<div id="report">${careDIA.care_review }</div>
	</div>

</body>
</html>