<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="../css/findPassword.css">
<script type="text/javascript" src="../js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(document).on("change","input[type=text]",function(){
		if($(this).val()==''){
			$('input[type=submit]').css({
				"background-color":'#999999',
				color:"#333333"});
		}else{
			$('input[type=submit]').css({
				"background-color":'#ffbc50',
				color:"#ffffff" });
		}
	});
	
	
	
	
		
	
	


</script>
</head>
<body>
	<h1>비밀번호찾기</h1>
	<section class="Agree-form">
		<form name="frmData" id="frmData" method="post"
			action="emailSendActionPwd.jsp">
			<div id="div1">
				<b id="b0">이메일로 비밀번호 찾기</b>
			</div>
			<div id="div2">
				이메일 <input type="text" id="email" name="email" class="AllAgree">
			</div>
			<div id="div3">
				<b>Facebook, Twitter 등 외부 연동 계정의 아이디 및 비밀번호는 가입하신 SNS 사이트에서
					확인하시길 바랍니다.</b><br> <b>본인 인증 시 제공되는 정보는 인증기관에서 수집하며, 인증 수단 이외의
					용도로 사용하지 않습니다.</b><br> <b>위 방법으로 찾기가 어려우신 경우, 망고
					고객센터(1234-1234)에 문의하시면 본인 확인 절차 후 안내해 드립니다.</b><br>
			</div>
			<div id="div9">
				<input type="submit" value="확인" active>
			</div>
		</form>

	</section>
	<br>

	<footer>
		<div class="div7">
			<a href="" id="terms">이용약관</a>| <a href="" id="userInfo">개인정보처리방침</a>|
			<a href="" id="EmailReject">이메일주소무단수집거부</a>| <a href="">고객센터</a><br>
		</div>
		<div class="div8">
			<b>Copyright @ Mango Music Corp All rights reserved.</b>
		</div>
	</footer>
</body>
</html>