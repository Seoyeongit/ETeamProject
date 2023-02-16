<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div>
    <label for="pet_condition">반려동물 상태</label><br>
    <textarea name="pet_condition" id="pet_condition" cols="30" rows="5"></textarea>
</div>
<div>
    <label for="beauty_list">미용받은내역</label><br>
    <input type="checkbox" id="beauty_list" name="beauty_list" value="몸클리닝">몸클리닝
    <input type="checkbox" id="beauty_list" name="beauty_list" value="귀청소">귀청소
    <input type="checkbox" id="beauty_list" name="beauty_list" value="발톱깎기">발톱깎기
    <input type="checkbox" id="beauty_list" name="beauty_list" value="항문낭짜기">항문낭짜기
    <input type="checkbox" id="beauty_list" name="beauty_list" value="목욕">목욕
    <input type="checkbox" id="beauty_list" name="beauty_list" value="가위컷">가위컷
    <input type="checkbox" id="beauty_list" name="beauty_list" value="면도컷">면도컷
    <input type="hidden" name="hiddenVal" id="hiddenVal" value="">
</div> 
<div>
    <label for="care_review">돌봄후기</label><br>
    <textarea name="care_review" id="care_review" cols="30" rows="5"></textarea>
</div>
</body>
</html>