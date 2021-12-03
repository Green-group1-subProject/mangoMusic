<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Document</title>
<link rel ="stylesheet" href ="../css/Login.css">
<script src="../js/jquery-3.6.0.min.js"></script>
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
				<button type="submit" value ="Login"><img src = "../icon/kicon.PNG" ><b>카카오 로그인</b></button>
			</div>
			<div class ="btn-area2">
				<button type="submit" value ="Login"><img src = "../icon/ticon.PNG" ><b>트위터 로그인</b></button>
			</div>
			<div class ="btn-area2">
				<button type="submit" value ="Login"><img src = "../icon/ficon.PNG" ><b>페이스북 로그인</b></button>
			</div>
		</form>
		<div class ="caption">
		 	<a href = "">Forgot Password?</a>
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