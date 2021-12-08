<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Document</title>

<link rel ="stylesheet" href ="../css/Login.css">
<script src="../js/jquery-3.6.0.min.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script async defer crossorigin="anonymous" src="https://connect.facebook.net/ko_KR/sdk.js#xfbml=1&version=v10.0&appId=775300137198358" nonce="SiOBIhLG">
</script>
<script type="text/javascript">
	$(function(){
		
		//트위터 로그인 누르면 트위터 홈페이지로 이동
		$('#twitter').click(function(){
			var openNewWindow = window.open("about:blank");
			openNewWindow.location.href = "https://twitter.com";
		});
		
		$('#facebook').click(function(){
			var openNewWindow = window.open("about:blank");
			openNewWindow.location.href = "https://facebook.com";
		});
		
	});

	
    
	Kakao.init('c3f652018208ba3e648564ba2a7a52ae'); //발급받은 키 중 javascript키를 사용해준다.
	console.log(Kakao.isInitialized()); // sdk초기화여부판단
	//카카오로그인
        function kakaoLogin() {
            window.Kakao.Auth.login({
                scope: 'profile_nickname, account_email, age_range', //동의항목 페이지에 있는 개인정보 보호 테이블의 활성화된 ID값을 넣습니다.
                success: function(response) {
                    console.log(response) // 로그인 성공하면 받아오는 데이터
                    window.Kakao.API.request({ // 사용자 정보 가져오기 
                        url: '/v2/user/me',
                        success: (res) => {
                            const kakao_account = res.kakao_account;
                            console.log(kakao_account)
                        }
                    });
                    window.location.href='../index.jsp'; //리다이렉트 되는 코드
                },
                fail: function(error) {
                    console.log(error);
                }
            });
        }
	
	
	
    </script>


</head>
<body>
	
	<section class ="login-form">
		<form method="post"	action="Login_ok.jsp">
			<div class ="log-area">
				로그인
			</div>
			<div class ="int-area">
				<input type="text" name ="id" id="id" autocomplete ="off" required>
				<label for ="id">USER NAME</label>
			</div>
			<div class ="int-area">
				<input type="password" name ="pwd" id="pwd" autocomplete ="off" required>
				<label for ="id">PASSWORD</label>
			</div>
			<div class ="btn-area">
				<button type="submit" value ="Login">Login</button>
			</div>
			<div class ="btn-area2">
				<button id="kakao" onclick="kakaoLogin();"><img src = "../icon/kicon.PNG" ><b>카카오 로그인</b></button>
			</div>
			<div class ="btn-area2">
				<button id="twitter" onclick="twiterLogin();"><img src = "../icon/ticon.PNG" ><b>트위터 로그인</b></button>
			</div>
			<div class ="btn-area2">
				<button id="facebook" onclick="fnFbCustomLogin();"><img src = "../icon/ficon.PNG" ><b>페이스북 로그인</b></button>
			</div>
		</form>
		<div class ="caption">
		 	<a href = "findPwd.jsp">Forgot Password?</a>
		</div>	
		<div class ="caption">
		 	<a href = "findId.jsp">Forgot ID?</a>
		</div>	
		<div class ="caption">
		 	<a href = "Agreement.jsp">Create an account</a>
		</div>	
	</section>
	 
	<script type="text/javascript">
	
		let id =$('#id');
		let pwd = $('#pwd');
		let btn = $('#btn');
		
		$(btn).on('click',function()){
			if($(id).val()==""){
				$(id).next('label').addClass('warning');
				setTimeout(function(){
					$('label').removeClass('warning');
				},1500);
			}else if($(pwd).val()==""){
				$(pw).next('label').addClass('warning');
				setTimeout(function(){
					$('label').removeClass('warning');
				},1500);
			}
		});
		
		
	 
      
	</script>
	
</body>
</html>