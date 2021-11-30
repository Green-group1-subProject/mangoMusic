<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CreateAnAccount</title>
<link rel ="stylesheet" href ="../css/CreateAnAccount.css">
<script type="text/javascript" src="../js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(function(){
	$('input[type=submit]').click(function(){
		if($('#pwd').val()!=$('#pwdCheck').val()){
			alert('비밀번호가 틀립니다');
			$('#pwdCheck').focus();
			return false;
		}
	});
	
});

	
	
//아이디 4~12자/영문 소문자(숫자 조합 가능하게)
//아이디 필수 입력 0
//비밀번호, 휴대폰 필수 입력 0
//비밀번호와 비밀번호 확인란이 서로 다르면 alert
//이메일 직접입력란이 null이면 alert
</script>



	
</head>
<body>
<h1>정보입력</h1>
<form action="CreateAnAccount_ok.jsp">
	<div id="div1">
	<label for="userid">아이디</label><br>
	<input type ="text" id ="userid" name ="userid" autocomplete ="off" required>
	<input type="button" value="중복확인" id="btnChkId" title="새창열림"><br>
	<b>4~12자/영문 소문자(숫자 조합 가능)</b>
	</div><br>
	<div id="div2">
	<label for="pwd">비밀번호</label><br>
	<input type ="password" id ="pwd" name ="pwd" autocomplete ="off" required><br>
	<input type ="password" id ="pwdCheck" name ="pwdCheck" autocomplete ="off" required><br>
	<b></b>
	</div>
	<div id="div3">
	 <label for="email1">이메일</label><br>
        <input type="text" name="email1"  id="email1" title="이메일주소 앞자리">@
        <select name="email2" id="email2"  title="이메일주소 뒷자리">
            <option value="naver.com">naver.com</option>
            <option value="hanmail.net">hanmail.net</option>
            <option value="nate.com">nate.com</option>
            <option value="gmail.com">gmail.com</option>
            <option value="etc">직접입력</option>
        </select>
        <input type="text" name="email3" id="email3" title="직접입력인 경우 이메일주소 뒷자리"
        	style="visibility:hidden">
        	
	</div><br>
	<div id="div4">
	<label for="hp">휴대폰 번호</label><br>
	<input type ="text" id ="hp" name ="hp" autocomplete ="off" required >
	<input type="button" value="인증번호 받기" id="receiveNo" ><br>
	</div>
	<div id= "div5">
	<input type ="submit" value="가입하기">
	</div>
	
</form>
</section><br>
<footer>
<div class="div7">
<a href="" id="terms">이용약관</a>|
<a href="" id="userInfo">개인정보처리방침</a>|
<a href="" id ="EmailReject">이메일주소무단수집거부</a>|
<a href="">고객센터</a><br>
</div>
<div class="div8">
<b>Copyright @ Mango Music Corp All rights reserved.</b>
</div>
</footer>

</body>

</html>