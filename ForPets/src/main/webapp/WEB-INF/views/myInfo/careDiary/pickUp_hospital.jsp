<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
    	#care-report-container{
    		padding: 30px;
    		background-color: #fff;
    		margin-bottom: 40px;
    	}
    </style>
</head>
<body>
    <h2>📄'${careDIA.voR.voPet.name }'병원픽업서비스 돌봄일지 입니다.</h2>
    <p>담당 펫트너 : ${careDIA.voR.voP.part_name }</p>

    
  	<div id="care-report-container">
  		주소 : 어디어디병원
  		담당의사 : 홍길동선생님
  	</div>

    <div >
        <h4>'${careDIA.voR.voPet.name }'의 상태</h4>
        <div id="report" >${careDIA.pet_condition }</div>
    </div>

    <div >
        <h4>병원진료 결과</h4>
        <div id="report">${careDIA.medi_result }</div>
    </div>

    <div >
        <h4>돌봄일지</h4>
        <div id="report">${careDIA.care_review }</div>
    </div>

</body>
</html>