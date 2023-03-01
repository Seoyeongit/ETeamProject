<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %> 
<head>
	<style>
		#review-header{
			border-radius : 5px;
			border: 1px solid #e5e5e5;
		}
	
		
		textarea{
			resize: none;
			border-radius : 5px;
			border: 1px solid #e5e5e5;
		}
		
		#review-header:focus{
			outline: none;
			border: 1px solid #0CC7B8;
			transition: border .3s;
		}
		
		textarea:focus {
			outline: none;
        	border: 1px solid #0CC7B8;
       		transition: border .3s;
		}
		
		#review-header::placeholder{
  			font-size: 13px;
		}
		
		textarea::placeholder {
		  font-size: 13px;
		}
	</style>
</head>
    <div>
        <h4>'${reserve.voPet.name}'
        <c:choose>
			<c:when test="${reserve.s_num eq 1}">기본돌봄서비스</c:when>
			<c:when test="${reserve.s_num eq 2}">산책돌봄서비스</c:when>
			<c:when test="${reserve.s_num eq 4}">병원픽업서비스</c:when>
			<c:when test="${reserve.s_num eq 5}">미용픽업서비스</c:when>
        </c:choose></h4>
        <c:if test="${not empty reserve.s_numArr}">
        	<ul>추가서비스 내역
        	<c:forEach items="${reserve.s_numArr }" var="sNum">
        		<c:choose>
        			<c:when test="${sNum eq 6 }"><li>샤워케어서비스</li></c:when>
        			<c:when test="${sNum eq 7 }"><li>훈련케어서비스</li></c:when>
        		</c:choose>
        	</c:forEach>
        	</ul>
        </c:if>
        <p>'${reserve.voP.part_name}'펫트너님이 케어하신 서비스 입니다.</p>

        
        <hr>
        <span class="text-bold">서비스만족도를 알려주세요</span>
        <div id="myform">
        <fieldset>
					<input type="radio" name="star_rating" value="5" id="rate1"><label
						for="rate1">★</label>
					<input type="radio" name="star_rating" value="4" id="rate2"><label
						for="rate2">★</label>
					<input type="radio" name="star_rating" value="3" id="rate3"><label
						for="rate3">★</label>
					<input type="radio" name="star_rating" value="2" id="rate4"><label
						for="rate4">★</label>
					<input type="radio" name="star_rating" value="1" id="rate5"><label
						for="rate5">★</label>
		</fieldset>
		</div>
    </div>
    <br>
    <div>
        솔직한  리뷰를 남겨주세요
        <div  id="surviceContainer" param="${reserve.reserve_num }">
                <input type="text" id="review-header" class="my-3 p-2" placeholder="한 줄 요약을 남겨주세요."><br>
                <div id="textareaWrrap">
                    <textarea id="review-body" cols="20" rows="10" placeholder="다른 고객님들에게 도움이 되도록 서비스에 대한 솔직한 평가를 남겨주세요."></textarea>
                    <div class="textLengthWrap">
                        <p class="textCount">0</p>
                        <p class="textTotal">/2000</p>
                    </div>
                </div>  
        </div>
    </div>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>

        $('textarea').keyup(function (e) {
        let content = $(this).val();
        
        // 글자수 세기
        if (content.length == 0 || content == '') {
            $('.textCount').text('0');
        } else {
            $('.textCount').text(content.length);
        }
        
        // 글자수 제한
        if (content.length > 2000) {
            // 2000자 부터는 타이핑 되지 않도록
            $(this).val($(this).val().substring(0, 2000));
            // 2000자 넘으면 알림창 뜨도록
            alert('글자수는 2000자까지 입력 가능합니다.');
        };
        
        if($('textarea').prop('scrollHeight') > $('textarea')[0].clientHeight){
        	console.log($('textarea').prop('scrollHeight')+"/"+$('textarea')[0].clientHeight);
        	$('textarea').css('height', $('textarea').prop('scrollHeight')+"px");
		}
        
        });
        
    </script>

