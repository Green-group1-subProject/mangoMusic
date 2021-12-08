<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel ="stylesheet" href ="../css/Agreement.css">
<script type="text/javascript" src="../js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(function(){
		$('#AllAgree').click(function(){
			$('.'+this.id).prop('checked',this.checked);
			$('#div9 button').css({
				"background-color":'#ffbc50',
				color:"#ffffff"
			});
			if(!$('#AllAgree').is(':checked')){
				$('#div9 button').css({
					"background-color":'#999999',
					color:"#333333"
				});
			}
		});
		
		$('input[type=submit]').click(function(){
			if(!$('#S-Agree').is(":checked")){
				alert('필수 동의 체크를 해주세요');
				$('#S-Agree').focus();
				event.preventDefault();
				return false();
			}
			if(!$('#div3 input[type=checkbox]').is(":checked")){
				alert('필수 동의 체크를 해주세요');
				$('#div3 input[type=checkbox]').focus();
				event.preventDefault();
				return false();
			}
		});
		
	
		$('#S-Agree').change(function(){
			if($(this).is(':checked')){
				$('#info-Agree').change(function(){
					if($(this).is(':checked')){
						$('#div9 button').css({
							"background-color":'#ffbc50',
							color:"#ffffff"
						});
					}
				});
			}else{
				$('#div9 button').css({
					"background-color":'#999999',
					color:"#333333"
				});
			}
		});
		
		$('#EmailReject').click(function(){
			open('EmailReject.jsp','zip',
			'width=500,height=200,left=0,top=0,location=yes,resizable=yes');
		});
		
		$('#terms').click(function(){
			open('Agreement_detail.jsp','zip',
					'width=500,height=500,left=0,top=0,location=yes,resizable=yes');
		});
		
		$('#userInfo').click(function(){
			open('Agreement_detail2.jsp','zip',
					'width=500,height=500,left=0,top=0,location=yes,resizable=yes');
		});
		
		$('#Agree-detail1').click(function(){
			open('Agreement_detail.jsp','zip',
			'width=500,height=500,left=0,top=0,location=yes,resizable=yes');
		});
		
		$('#Agree-detail2').click(function(){
			open('Agreement_detail2.jsp','zip',
			'width=500,height=500,left=0,top=0,location=yes,resizable=yes');
		});
	});
	
	 function openPop(){
		 if(!$('#S-Agree').is(":checked")){
				alert('필수 동의 체크를 해주세요');
				$('#S-Agree').focus();
				event.preventDefault();
				return false();
			}
			if(!$('#div3 input[type=checkbox]').is(":checked")){
				alert('필수 동의 체크를 해주세요');
				$('#div3 input[type=checkbox]').focus();
				event.preventDefault();
				return false();
			}
			
	        var pop_title = "popupOpener" ;
	         
	        window.open("", pop_title) ;
	         
	        var frmData = document.frmData ;
	        frmData.target = pop_title ;
	        frmData.action = "CreateAnAccount.jsp" ;
	         
	        frmData.submit() ;
	    }
</script>
</head>
<body>
<h1>법정 대리인 동의</h1>
<section class ="Agree-form">
<form name ="frmData" id ="frmData" method ="post">
	<div id="div1">
	<b id ="b0">본 14세 미만 회원은 가입을 위해 법정대리인의 가입 동의 및 본인 인증이 필요합니다.</b>
	<br><br>
	<input type ="checkbox" id ="AllAgree" onclick="AllAgree(this.id,this.checked);">
	<label for ="AllAgree">모두 동의합니다</label><br>
	</div>
	<div id="div2">
	<input type ="checkbox" id ="S-Agree" class="AllAgree">
	<b id ="b2">[필수]</b>
	<label for ="S-Agree" onclick="S-Agree">만 14세 미만 회원가입 동의</label>
	</div>
	<div id="div3">
	<input type ="checkbox" id ="info-Agree" class="AllAgree" >
	<b id ="b2">[필수]</b>
	<label for ="info-Agree">개인정보 수집/이용 동의</label>
	<button id="Agree-detail2" onclick ="Agree-detail2()">></button>
	</div>
</form>
	<div id ="div9">
	<button id="account3" onclick = "openPop()">인증하기</button>
	</div>
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