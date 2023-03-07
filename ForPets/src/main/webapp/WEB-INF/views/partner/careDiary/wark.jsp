<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<title>Insert title here</title>
</head>
<body>
<div class="돌봄목록 정보div">
    <label for="pet_condition">반려동물 상태</label><br>
    <textarea name="pet_condition" id="pet_condition" cols="30" rows="5"></textarea>
</div>
<div>
    <label for="walk_time">산책이행시간</label> 
    <input type="number" id="hour">시간<input type="number" id="min">분 산책했습니다.
    <input type="hidden" name="walk_time" val="" id="hiddenVal">
</div>
<div>
    <label for="care_review">돌봄후기</label><br>
    <textarea name="care_review" id="care_review" cols="30" rows="5"></textarea>
</div>
</body>
</html>