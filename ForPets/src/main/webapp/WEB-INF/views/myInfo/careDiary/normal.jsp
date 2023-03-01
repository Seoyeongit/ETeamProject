<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <h2>📄'${careDIA.voR.voPet.name }'기본돌봄서비스 돌봄일지 입니다.</h2>
    <p>담당 펫트너 : ${careDIA.voR.voP.part_name }</p>


    <div>
        <h4>'${careDIA.voR.voPet.name }'의 상태</h4>
        <div id="report" >${careDIA.pet_condition }</div>
    </div>

    <div>
        <h4>식사</h4>
        <div id="report" >${careDIA.meal }</div>
    </div>
    
    <div>
        <h4>간식</h4>
        <div id="report" >${careDIA.snak }</div>
    </div>
    
    <div>
        <h4>놀이</h4>
        <div id="report" >${careDIA.pet_play }</div>
    </div>    

    <div>
        <h4>돌봄일지</h4>
        <div id="report" >${careDIA.care_review }</div>
    </div>

</body>
</html>