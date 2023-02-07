<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>    
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 상세보기</title>
</head>
<body>
<input name="seq" type="hidden" value="${getNoticeBoard.ntc_seq }" />

<table cellpadding="0" cellspacing="0" align="center">
	<tr>
		<td width="70">제목</td>
		<td align="left">${getNoticeBoard.ntc_title}</td>
	</tr>
	<tr>
		<td>내용</td>
		<td align="left" width="700" height="100">${getNoticeBoard.ntc_ctnt}</td>
	</tr>
	<tr>
		<td>등록일</td>
		<td align="left">${getNoticeBoard.ntc_cdate }</td>
	</tr>
	<tr>
		<td>조회수</td>
		<td align="left">${getNoticeBoard.ntc_hit }</td>
	</tr>
	<tr>
		<td colspan="2" align="right">
		<input type="button" value="목록" onclick="location.href= '../noticeBoard'" />
		<input type="button" value="수정" onclick="location.href= '../updateNotice'" />
		<input type="button" value="삭제" id="deletNotice" />
		</td>
	</tr>
</table>
</body>
</html>