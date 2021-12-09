<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE HTML>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>자유게시판 글 삭제</title>
<link rel="stylesheet" type="text/css" href="../css/mainstyle.css" />
<link rel="stylesheet" type="text/css" href="../css/clear.css" />
<link rel="stylesheet" type="text/css" href="../css/formLayout.css" />
<link rel="stylesheet" type="text/css" href="../css/mystyle.css" />
<style type="text/css">
body {
	padding: 5px;
	margin: 5px;
}

.divForm {
	width: 650px;
	border: 1px solid #ddd;
}
/* .divForm form{
		width:650px;
	} */
.divForm div {
	/* clear: both; */
	border: none;
	padding: 7px 0;
	margin: 0;
	overflow: auto;
}

.sp {
	font-size: 0.9em;
	color: #0056AC;
}

.divForm fieldset {
	border: 0;
}
</style>

<%-- <%
//detail.jsp에서 [삭제]링크 클릭하면 get방식으로 이동
//=> http://localhost:9090/herbmall/board/delete.jsp?no=4
//1
String bno = request.getParameter("bno");
if (bno == null || bno.isEmpty()) {
%>
<script type="text/javascript">
	alert('잘못된 url입니다.');
	location.href = "list.jsp";
</script>

<%
return;
}

//2

//3
%> --%>

<script type="text/javascript" src="../js/jquery-3.6.0.min.js"></script>
<!-- <script type="text/javascript">
	$(function(){
		$('form[name=frmDelete]').submit(function(){
			if($('#pwd').val().length<1){
				alert('비밀번호를 입력하세요');
				$('#pwd').focus();
				event.preventDefault();
			}else{
				if(!confirm('삭제하시겠습니까?')){
					event.preventDefault();
				}
			}
		});
	});	
</script> -->
</head>
<body>
	<div class="divForm">
		<form name="frmDelete" method="post" action="delete_ok.jsp">
			<input type="text" name="bno" value="<%-- <%=bno%> --%>">

			<fieldset>
				<legend>글 삭제</legend>
				<div>
				 	<span class="sp">번 글을 삭제하시겠습니까?</span>
				</div>
				<div class="center">
					<input type="submit" value="삭제" /> <input type="Button"
						value="글목록" OnClick="location.href='list.jsp'" />
				</div>
			</fieldset>
		</form>
	</div>

</body>
</html>