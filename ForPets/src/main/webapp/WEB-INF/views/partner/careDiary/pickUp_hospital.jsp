<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>돌봄 일지</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <link href="${pageContext.request.contextPath}/resources/css/carediary.css" rel="stylesheet" />
</head>
<body>
<div class="condi">
    <label for="pet_condition">반려동물 상태</label><br>
    <textarea class="pet-condi" name="pet_condition" id="pet_condition" cols="30" rows="5"></textarea>
</div>
<div class="resul">
    <label for="medi_result">진료결과</label><br>
    <textarea class="medi-resul" name="medi_result" id="medi_result" cols="30" rows="5"></textarea>
</div>
<div class="revie">
    <label for="care_review">돌봄후기</label><br>
    <textarea class="care-reive" name="care_review" id="care_review" cols="30" rows="5"></textarea>
</div>
</body>
</html>