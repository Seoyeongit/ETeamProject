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
    <h2>π'${careDIA.voR.voPet.name }'κΈ°λ³Έλλ΄μλΉμ€ λλ΄μΌμ§ μλλ€.</h2>
    <p>λ΄λΉ ν«νΈλ : ${careDIA.voR.voP.part_name }</p>


    <div>
        <h4>'${careDIA.voR.voPet.name }'μ μν</h4>
        <div id="report" >${careDIA.pet_condition }</div>
    </div>

    <div>
        <h4>μμ¬</h4>
        <div id="report" >${careDIA.meal }</div>
    </div>
    
    <div>
        <h4>κ°μ</h4>
        <div id="report" >${careDIA.snak }</div>
    </div>
    
    <div>
        <h4>λμ΄</h4>
        <div id="report" >${careDIA.pet_play }</div>
    </div>    

    <div>
        <h4>λλ΄μΌμ§</h4>
        <div id="report" >${careDIA.care_review }</div>
    </div>

</body>
</html>