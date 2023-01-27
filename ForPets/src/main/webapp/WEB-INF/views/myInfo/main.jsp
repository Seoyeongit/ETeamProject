<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <div>
        <header>
        <h3>안녕하세요 김작두님 <a href="#">로그아웃</a></h3>
        </header>
    </div>
    <div>
        <aside>
            <div>
                <div>김작두님</div>
                 <a href="../myInfo/edit-Profile"><div>회원정보수정</div></a>
            </div>
        </aside>
        <main>
            <div>
                <p>마이페이지</p>
                <div>
                    <div>
                    	<c:choose>
                    		<c:when test="${not empty userPet.img}">
								<div><img alt="" src="../myInfo/display?fileName=${userPet.img }"></div>                    			
                    		</c:when>
                    	</c:choose>
                    	
                    	<p>김작두님의 애완동물 : ${userPet.name}
                    	<c:choose >
                    		<c:when test="${userPet.type eq '강아지' }"><text>🐶</text></c:when>
                    		<c:when test="${userPet.type eq '고양이' }"><text>😺</text></c:when>
                    	</c:choose></p>
                        <a href="${pageContext.request.contextPath}/myInfo/my-petView" 
                        onclick="window.open(this.href, '_blank', 'width=500, height=800'); return false;">
                        <input type="button" id="register_pet" value="반려동물 등록하기" ></a>
                    </div>
                    <div>
                    	<a href="${pageContext.request.contextPath}/myInfo/create-roadMap" 
                        onclick="window.open(this.href, '_blank', 'width=500, height=800'); return false;">
                        <input type="button" id="register_wark" value="산책로 등록하기"></a>
                    </div>
                </div>
                <hr>
                <p>나의서비스</p>
                <div>
                    <a href="../myInfo/check-reservation"><div>예약확인</div></a>
                    <a href=""><div>돌봄일지</div></a>
                    <a href=""><div>파트너와 1:1채팅하기</div></a>
                    <a href=""><div>후기작성</div></a>
                </div>
                <p>나의활동</p>
                <div>
                    <a href=""></a><div>고객센터</div></a>
                </div>
            </div>

        </main>
    </div>
	<script type="text/javascript">
	</script>
</body>
</html>