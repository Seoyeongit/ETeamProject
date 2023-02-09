<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>  
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>후기작성하기</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style>

    body {
        overflow: hidden;
        padding: 30px;
        background: whitesmoke;
        display: table-cell;
    }

    #surviceContainer{
        margin: 0;
        margin-left: auto;
        margin-right : auto;
        border: 1px solid rgb(209, 206, 206);
        width: 500px;
        height: 400px;
        overflow: scroll;
        overflow-x: hidden;
    }

    ol {
        list-style-position: inside;
        padding: 0px 0px;
        margin: 0px;
        }
    li{
        border: 1px solid rgb(209, 206, 206);
        padding: 1rem;
        margin-left: 0;
        margin-bottom: 2px;
        list-style: none;
    }

    li:hover{
        background-color: rgb(97, 153, 114);
        color: white;
    }
    
    .change_back{
        background-color: rgb(97, 153, 114);
        color: white;
    }

    .change_othewsie{
        background-color: rgb(234, 234, 234);
        color: rgb(204, 204, 204);
    }
    
        /* width */
    ::-webkit-scrollbar {
    width: 10px;
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
        border: 2px solid rgb(200, 200, 200);
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
        <p>케어서비스는 잘 받으셨나요? 고객님의 후기는 포펫츠에게 큰 힘이 됩니다 :)</p>
    </div>
    <br>
    <div>
        <div  id="surviceContainer">
            <ol>
            	<c:forEach items="${reserveList}" var="reserve">
                <li onclick="getReserveNum('${reserve.reserve_num}')">
                	<div id="">${reserve.reserve_num }</div>
                    <h4>'${reserve.voPet.name}'의 
                       <c:choose>
                        <c:when test="${reserve.s_num eq 1}"><text>병원방문</text></c:when>
                        <c:when test="${reserve.s_num eq 2}"><text>산책케어</text></c:when>
                        <c:when test="${reserve.s_num eq 3}"><text>픽업</text></c:when>
                       </c:choose></h4>
                
                    <p>'${reserve.voP.part_name}'펫트너님이 케어하신 서비스예요</p>
                </li>
                </c:forEach>
            </ol>
        </div>
    </div>
    <div>
        <center>
            <button class="w-btn-outline w-btn-green-outline">다음으로</button>
        </center>
    </div>
    <script>
    
    	var num;
    
        $('li').click(function(){
            $(this).removeClass('change_othewsie');
            $(this).addClass('change_back');
            $(this).siblings().addClass('change_othewsie');
        })
        
        
        $('center .w-btn-outline').click(function(){
    		var _this = $(this);
    		var liurl = "../myInfo/writeReview";
    		$("head").html('');
    		
    		$.ajax({
    			type : 'POST',
    			url : liurl,
    			data : {
    				reserve_num : num
    			},
    			dataType : 'html',
    			success : function(data){
    				console.log(num);
    				$('style').remove();
    				$("body").html(data);
    			},
    			error : function(result) {
    				alert(result);
    			}
    		});
        });
        
        //변수에 누른 예약리스트 reserve_num이 초기화 됩니다.
        function getReserveNum(Rnum){
        	num = Rnum;
        	console.log(num);
        }
        
        
    </script>
</body>
</html>