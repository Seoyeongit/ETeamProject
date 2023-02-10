<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %> 
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style>

    body {
        overflow: hidden;
        padding: 30px;
        background: whitesmoke;
        display: table-cell;
    }

    hr:first-of-type{
        border: 2px solid rgb(207, 207, 207);
    }

    hr:last-child{
        border: 1px dotted rgb(207, 207, 207);
    }

    #star a{
    text-decoration: none;
    color: rgb(207, 207, 207);
    }
    #star a.on{
    color: red;
    } 

    input{
        width: 100%;
        border-radius: 8px;
        border: none;
        outline: solid 1px rgb(187, 187, 187);
        padding: 1em;
        margin: 10px 0px;
    }

    textarea {

    width: 100%;
    height: 10em;
    border: none;
    resize: none;
    border-radius: 10px;
    outline: solid 1px rgb(187, 187, 187);
    padding: 1em;
    }


    input:focus {
        outline: solid 1px green;
       
        transition: 0.55s;
    }

     textarea:focus {
        outline: solid 1px green;
       
        transition: 0.55s;
    }

     textarea:focus {
        outline: solid 1px green;
       
        transition: 0.55s;
    }

    .textLengthWrap{
        position: absolute !important;
        color: rgb(236, 59, 59);
    }


    /* Track */
    ::-webkit-scrollbar-track {
    background: rgb(157, 196, 169);
    }

    /* Handle */
    ::-webkit-scrollbar-thumb {
    background: rgb(122, 165, 135);
    border: 2px solid rgb(157, 196, 169);
    border-radius: 10px;
    }

    /* Handle on hover */
    ::-webkit-scrollbar-thumb:hover {
    background: rgb(94, 132, 105);
    border-radius: 10px;
    }

    button {
        margin: 20px;
    }

    .w-btn {
        position: relative;
        border: none;
        display: inline-block;
        padding: 15px 50px;
        border-radius: 30px;
        font-family: "paybooc-Light", sans-serif;
        text-decoration: none;
        font-weight: 600;
        transition: 0.25s;
    }

    .w-btn-outline {
        position: relative;
        padding: 15px 50px;
        border-radius: 30px;
        font-family: "paybooc-Light", sans-serif;
        text-decoration: none;
        font-weight: 600;
        transition: 0.25s;
    }

    .w-btn-green {
    background-color: rgb(122, 165, 135);
    color: #d7fff1;
    }

    .w-btn-green-outline {
        border: 2px solid rgb(247, 247, 247);
        color: darkgray;
    }

    .w-btn-green-outline:hover {
        border: 2px solid rgb(122, 165, 135);
        background-color: rgb(122, 165, 135);
        color: #ffffff;
    }


</style>
</head>
<body>
    <div>
        <h3>후기작성하기</h3>
        <hr>
        <h4>'${reserve.voPet.name}'
        <c:choose>
           <c:when test="${reserve.s_num eq 1}"><text>병원방문</text></c:when>
           <c:when test="${reserve.s_num eq 2}"><text>산책케어</text></c:when>
           <c:when test="${reserve.s_num eq 3}"><text>픽업</text></c:when>
        </c:choose></h4>
        <p>'${reserve.voP.part_name}'펫트너님이 케어하신 서비스 입니다.</p>
        <hr>
        <label for="star-rating">서비스는 어떠셨나요?</label>
        <P id="star"> <!-- 부모 -->
            <a href="#" value="1">★</a> <!-- 자식들-->
            <a href="#" value="2">★</a>
            <a href="#" value="3">★</a>
            <a href="#" value="4">★</a>
            <a href="#" value="5">★</a>
           <p>
        <hr>
    </div>
    <br>
    <div>
        솔직한  리뷰를 남겨주세요
        <div  id="surviceContainer">
            <form action="">
                <input type="text" id="review-header" placeholder="한 줄 요약을 남겨주세요."><br>
                <div id="textareaWrrap">
                    <textarea name="" id="review-body" cols="50" rows="10" placeholder="다른 고객님들에게 도움이 되도록 서비스에 대한 솔직한 평가를 남겨주세요."></textarea>
                    <div class="textLengthWrap">
                        <p class="textCount">0</p>
                        <p class="textTotal">/2000</p>
                    </div>
                </div>  
            </form>
        </div>
    </div>
    <div>
        <center>
            <button class="w-btn-outline w-btn-green-outline">리뷰등록하기</button>
        </center>
    </div>
    <script>
    
    	//별점초기화할 변수입니다.
   		 var star_rating;
    
        $('#star a').click(function(){ 
            $(this).parent().children("a").removeClass("on");    
            $(this).addClass("on").prevAll("a").addClass("on");
            console.log($(this).attr("value"));
            
            star_rating = $(this).attr("value");
        });

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
        });
        
        
        
        $('div .w-btn-outline').click(function(){
        	var r_title = $('#review-header').val();
        	var r_content = $('#review-body').val();
        	var reserve_num = '<c:out value="${reserve.reserve_num}"/>';
        	
        	$.ajax({
        		url : "../myInfo/writeReview_go",
        		dataType : 'text',
        		type : 'POST',
        		data : {
        			star_rating : star_rating,
        			r_content : r_content,
        			r_title : r_title,
        			reserve_num : reserve_num
        		},
    			success : function(){
    				alert("리뷰가 등록되었습니다.");
    				window.close();
    			},
    			error : function(result) {
    				alert("리뷰등록에 실패했습니다.");
    			}
        	});
        });
        
    </script>
</body>
</html>
