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
    <h2>π'${careDIA.voR.voPet.name }'λ³μν½μμλΉμ€ λλ΄μΌμ§ μλλ€.</h2>
    <p>λ΄λΉ ν«νΈλ : ${careDIA.voR.voP.part_name }</p>

    
  	<div id="care-report-container">
  		μ£Όμ : μ΄λμ΄λλ³μ
  		λ΄λΉμμ¬ : νκΈΈλμ μλ
  	</div>

    <div >
        <h4>'${careDIA.voR.voPet.name }'μ μν</h4>
        <div id="report" >${careDIA.pet_condition }</div>
    </div>

    <div >
        <h4>λ³μμ§λ£ κ²°κ³Ό</h4>
        <div id="report">${careDIA.medi_result }</div>
    </div>

    <div >
        <h4>λλ΄μΌμ§</h4>
        <div id="report">${careDIA.care_review }</div>
    </div>

</body>
</html>