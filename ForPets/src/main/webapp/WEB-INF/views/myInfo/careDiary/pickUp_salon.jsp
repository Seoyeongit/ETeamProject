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
    <h2>'${careDIA.voR.voPet.name }'미용픽업서비스 돌봄일지 입니다.</h2>
    <p>담당 펫트너 : ${careDIA.voR.voP.part_name }</p>

    <hr>

    <div>
        <h4>'${careDIA.voR.voPet.name }'의 상태</h4>
        <div>${careDIA.pet_condition }</div>
    </div>

    <div>
        <h4>미용 받은 내역</h4>
        <div>${careDIA.beauty_list }</div>
    </div>

    <div>
        <h4>돌봄일지</h4>
        <div>${careDIA.care_review }</div>
    </div>

</body>
</html>