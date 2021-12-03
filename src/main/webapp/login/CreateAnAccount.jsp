<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CreateAnAccount</title>
<script type="text/javascript" src="../js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(function(){
	var id = $('#id').val().length;
	
	$('input[type=submit]').click(function(){
		if($('#name').val().length<1){
			alert('이름은 필수 항목입니다');
			$('#name').focus();
			return false;
		}else if($('#id').val().length<1){
			alert('아이디는 필수 항목입니다');
			$('#id').focus();
			return false;
		}else if(!validate_id($('#id').val())){
			return false;
		}else if($('#pwd').val().length<1){
			alert('비밀번호는 필수 항목입니다');
			$('#pwd').focus();
			return false;
		}else if($('#pwdCheck').val().length<1){
			alert('비밀번호 체크는 필수 항목입니다');
			$('#pwdCheck').focus();
			return false;
		}else if($('#pwd').val()!=$('#pwdCheck').val()){
			alert('비밀번호가 틀립니다');
			$('#pwdCheck').focus();
			return false;
		}else if(!validate_pwd($('#pwd').val())){
			return false;
		}else if($('#email2 option:selected').val()=="etc"){
			if($('#email3').val().length<1){
				alert('이메일 뒷자리를 입력해주세요');
				$('#email3').focus();
				return false;			
			}
		}else if($('#tel').val().length<1){
			alert('전화번호는 필수 항목입니다');
			$('#tel').focus();
			return false;
		}else if (!validate_phone($('#tel').val())){
			alert('전화번호엔 번호만 입력할 수 있습니다');
			$('#tel').focus();
			return false;
		}
		
	
	});
	
	$('#email2').change(function(){
		if($(this).val()=="etc"){
			$('#email3').val('');
			$('#email3').css('visibility',"visible");				
			$('#email3').focus();				
		}else{
			$('#email3').css('visibility',"hidden");				
		}
	});
	
	
	
	function validate_id(id) {
        var idRegExp = /^[a-zA-z0-9]{4,12}$/; //아이디 유효성 검사
        if (!idRegExp.test(id)) {
            alert("아이디는 영문 대소문자와 숫자 4~12자리로 입력해야합니다");
         	$('#id').focus();
            return false;
        }
        return true; //확인이 완료되었을 때
    }
	//숫자와 영문자 조합으로 8~16자리를 사용해야 합니다.
	function validate_pwd(pwd){
		var idRegExp = /^[a-zA-z0-9]{8,16}$/; 
		if(!idRegExp.test(pwd)){
			alert('숫자와 영문자 조합으로 8~16자리를 사용해야 합니다.');
			return false;
		}

		var checkNum = pwd.search(/[0-9]/g); // 숫자사용
		var checkEng = pwd.search(/[a-z]/ig); // 영문사용

		if(checkNum <0 || checkEng <0){
			alert("숫자와 영문자를 조합하여야 합니다.");
			return false;
		}
		return true;
		
	}



	
	function validate_phone(tel){
		var pattern = new RegExp(/^[0-9]*$/g);
		return pattern.test(tel);
		/* 0 에서 9사이의 숫자로 시작하거나 끝나야 한다는 의미 
		(^는 시작, $는 끝을 의미) 
		닫기 대괄호(]) 뒤의 * 기호는 0번 이상 반복 */
	}

});

	//아이디 4~12자/영문 소문자(숫자 조합 가능하게)0
	//숫자와 영문자 조합으로 8~16자리를 사용해야 합니다.0
	//이메일 직접입력란이 null이면 alert =>
</script>



	
</head>
<body>
<h1>정보입력</h1>
<form action="CreateAnAccount_ok.jsp">
	<div id="div0">
	<label for="name">이름</label><br>
	<input type ="text" id ="name" name ="name" >
	</div><br>
	<div id="div1">
	<label for="id">아이디</label><br>
	<input type ="text" id ="id" name ="id" >
	<input type="button" value="중복확인" id="btnChkId" title="새창열림"><br>
	<b>4~12자/영문 소문자(숫자 조합 가능)</b>
	</div><br>
	<div id="div2">
	<label for="pwd">비밀번호</label><br>
	<input type ="password" id ="pwd" name ="pwd" ><br>
	<input type ="password" id ="pwdCheck" name ="pwdCheck" ><br>
	<b>숫자와 영문자 조합으로 8~16자리를 사용해야 합니다.</b>
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
	<label for="tel">휴대폰 번호</label><br>
	<input type ="text" id ="tel" name ="tel" >
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