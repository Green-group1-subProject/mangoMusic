<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<link rel="stylesheet" type="text/css" href="../css/mainstyle.css" />
<link rel="stylesheet" type="text/css" href="../css/clear.css" />
<link rel="stylesheet" type="text/css" href="../css/formLayout.css" />
<link rel="stylesheet" type="text/css" href="../css/mystyle.css" />

<title>질문 글쓰기</title>
<script type="text/javascript" src="../js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(function(){
		$('form[mno=frmWrite]').submit(function(){
			$('.infobox').each(function(idx, item){
				if($(this).val().length<1){
					alert($(this).prev().html() + "을(를) 입력하세요");
					$(this).focus();
					event.preventDefault();
					return false;  //each 탈출
				}
			});
		});
		
		$('#btList').click(function(){
			location.href='list.jsp';	
		});
		
	});
</script>

</head>
<body>
	<div class="divForm">
		<form name="frmWrite" method="post" action="write_ok.jsp">
			<fieldset>
				<legend>글쓰기</legend>
				<div class="firstDiv">
					<label for="btitle">제목</label> <input type="text" id="btitle"
						name="btitle" class="infobox" />
				</div>
				<div>
					<label for="mno">회원번호</label> <input type="text" id="mno"
						name="mno" class="infobox" />
				</div>
				<div>
					<label for="content">내용</label>
					<textarea id="content" name="content" rows="12" cols="40"></textarea>
				</div>
				<div class="center">
					<input type="submit" value="등록" /> <input type="Button" id="btList"
						value="글목록" />
				</div>
			</fieldset>
		</form>
	</div>


</body>
</html>