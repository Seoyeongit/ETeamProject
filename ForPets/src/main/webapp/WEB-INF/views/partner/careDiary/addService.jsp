<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>
</head>
<body>
	<h3>추가서비스</h3>
	<input type="checkbox" onclick="check(this)" class="shower_serv"> 샤워서비스는 진행하셨나요?
	<textarea rows="" cols="" class="shower_serv"  readonly="readonly"></textarea>
	<hr>
	<input type="checkbox" onclick="check(this)" class="training_serv"> 훈련서비스는 진행하셨나요?
	<textarea rows="" cols="" class="training_serv"  readonly="readonly"></textarea>
	
	
	<script type="text/javascript">
		function check(e){
				var className = $(e).attr('class');
				
				
				if($("textarea[class="+className+"]").attr("readonly") === "readonly"){
					$("textarea[class="+className+"]").attr('name',className);
					$("textarea[class="+className+"]").prop('readonly', false);
				}else{
			        if (!confirm("체크를 지우면 작성하신 글이 지워집니다. 글을 지울까요?")) {
			        	$("input[class="+className+"]").prop('checked', true);
			        	$("textarea[class="+className+"]").prop('readonly', false);
			        } else {
						$("textarea[class="+className+"]").val(' ');
						$("textarea[class="+className+"]").prop('readonly', 'readonly');
			        }
				}
		}
	</script>
</body>
</html>