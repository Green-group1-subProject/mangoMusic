<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <title>망고뮤직:달달한 음악이 필요할 때</title>
        <link rel="icon" type="image/x-icon" href="../images/logos/망고로고2k.png" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="../css/styles.css" rel="stylesheet" />
	    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
        <script type="text/javascript" src="../js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">

$(function(){
	$("#password_suc").hide();
	$("#password_fail").hide();
	var id = $('#id').val().length;
	
	$(".inputPwd").change(function(){
		var pwd=$("#pwd").val();
		var pwd2=$("#pwdCheck").val();
		
		if(pwd!="" && pwd2!=""){
			if(pwd==pwd2){
				$("#password_suc").show();
				$("#password_fail").hide();
			}else{
				$("#password_suc").hide();
				$("#password_fail").show();
			}
		}
	});
	
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
			alert('비밀번호가 일치하지 않습니다');
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
		}else if($('#chkId').val()!='Y'){
			alert('아이디 중복확인을 하세요!');
			$('#btnChkId').focus();
			event.preventDefault();
		}
	
	});
	
	
	$('#email3').hide();
	$('#email2').change(function(){
		if($(this).val()=="etc"){
			$('#email3').val('');
			$('#email3').show();			
			$('#email3').focus();				
		}else{
			$('#email3').hide();			
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
	
	
	
	$('#btnChkId').click(function move_valuecheck_id(){
		var id_value=window.open('idCheck.jsp','idCheck',
				'width=430,height=200,location=no,status=no,scrollbars=yes');
	});
	


});

	//아이디 4~12자/영문 소문자(숫자 조합 가능하게)0
	//숫자와 영문자 조합으로 8~16자리를 사용해야 합니다.0
	//이메일 직접입력란이 null이면 alert =>
</script>
<style>
#createAccForm {
	background: white;
	padding: 20px;
	width: 450px;
	margin: 20px auto;
}
.div7 a{
	text-decoration: none;
}

.emails{
	margin-bottom:6px;
}
</style>


	
</head>
<body style="background:#F7F4ED">
<div class="row" style="text-align: center; margin-top:50px;">
	<img src="../images/logos/망고로고2e.png" style="width:300px; margin:0 auto;">
</div>
<div class="row">
<div class="col-4"></div>
<div class="col-4" >
<form action="CreateAnAccount_ok.jsp" id="createAccForm" method="post">
	<div id="div0">
		<label for="name" class="form-label">이름</label><br>
		<input type ="text" id ="name" class="form-control" name ="name" >
		</div>
	<div id="div1" >
		<label for="id" class="form-label">아이디</label><br>
		<input type ="text" id ="id" name ="id" class="form-control" style="width:80%; display: inline;" >
		<input type="button" value="중복확인" id="btnChkId" class="btn btn-mango btn-sm text-center" title="새창열림">
		<div id="idHelpBlock" class="form-text">
			4~12자/영문 소문자(숫자 조합 가능)
		</div>
	</div>
	<div id="div2">
		<label for="pwd" class="form-label">비밀번호</label><br>
		<input type ="password" id ="pwd" name ="pwd" class="form-control inputPwd">
		<div id="passwordHelpBlock" class="form-text">
			숫자와 영문자 조합으로 8~16자리를 사용해야 합니다.
		</div>
		<label for="pwd_check" class="form-label">비밀번호 확인</label><br>
		<input type ="password" id ="pwdCheck" name ="pwdCheck" class="form-control inputPwd">
		<div id="password_suc" class="form-text" style="color:blue;">
			비밀번호가 일치합니다.
		</div>
		<div id="password_fail" class="form-text" style="color:red;">
			비밀번호가 일치하지 않습니다.
		</div>
	</div>
	<div id="div3">
		 <label for="email1" class="form-label">이메일</label><br>
	        <input type="text" name="email1"  id="email1" title="이메일주소 앞자리" class="form-control emails" style="width:90%; display: inline;" >
	        <span style="font-size: 1.6em;">@</span>
	        <select name="email2" id="email2" class="form-control emails" title="이메일주소 뒷자리">
	            <option value="선택하세요">선택하세요</option>
	            <option value="naver.com">naver.com</option>
	            <option value="hanmail.net">hanmail.net</option>
	            <option value="nate.com">nate.com</option>
	            <option value="gmail.com">gmail.com</option>
	            <option value="etc">직접입력</option>
	        </select>
	        <input type="text" name="email3" id="email3" class="form-control emails" title="직접입력인 경우 이메일주소 뒷자리" class="form-control">
		</div>
	<div id="div4">
		<label for="tel" class="form-label">휴대폰 번호</label><br>
		<input type ="text" id ="tel" name ="tel" class="form-control">
	</div>
	<div id= "div5" style="text-align: center;">
		<input type ="submit" value="가입하기" class="btn btn-mango btn-lg text-center" style="margin-top:20px;">
	</div>
	<!-- 아이디 체크 완료했을 때 -->
	<input type="hidden" name="chkId" id="chkId"> 
</form>
</div>
</div>
	
</section>
<br><br>
<footer>
<div class="row" style="text-align:center; ">
<div class="div7">
<a href="" id="terms">이용약관 </a>|
<a href="" id="userInfo"> 개인정보처리방침 </a>|
<a href="" id ="EmailReject"> 이메일주소무단수집거부 </a>|
<a href=""> 고객센터</a><br>
</div>
<div class="div8">
	<b>Copyright @ Mango Music Corp All rights reserved.</b>
</div>
</div>
</footer>

</body>
</html>