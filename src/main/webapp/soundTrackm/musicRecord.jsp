<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/bootstrap.css">
<title>Insert title here</title>
<style type="text/css" >
#artist{
	text-align: center;
}
#artist img{
	width: 200px;
	height: 200px;
	margin-left: 10px;
}
#customized{
	text-align: center;
}
#customized img{
	margin-top:2px;
	width: 50px;
	height: 50px;
}
#customized div{
	margin-left: 120px;
	background: red;
	height: 60px;
	text-align: left;
}
.musicname{
	position: absolute;
	background: white;
}
.artist{
	margin-top: 30px;
	position: absolute;
	background: yellow;
	
}
.alname{
	margin-top: 30px;
	margin-left: 150px;
	position: absolute;
	background:pink;
}
</style>
<script type="text/javascript" src="../css/bootstrap.css"></script>
<script type="text/javascript">
	$(function () {
		$('#artist img').css('cursor','pointer').click(function () {
			location.href='artistBoard.jsp';
		});
		
	});
</script>
</head>
<body>
	<h2>artist record</h2>
	<div class='row' id='artist'>
		<div class="col-lg-2 col-sm-6">
			<img src='../images/album/1.jpg'>
		</div>
		<div class="col-lg-2 col-md-6">
			<img src='../images/album/2.jpg'>
		</div>
		<div class="col-lg-2 col-md-6">
			<img src='../images/album/3.jpg'>
		</div>
		<div class="col-lg-2 col-md-6">
			<img src='../images/album/4.jpg'>
		</div>
		<div class="col-lg-2 col-md-6">
			<img src='../images/album/5.jpg'>
		</div>
		<div class="col-lg-2 col-md-6">
			<img src='../images/album/6.jpg'>
		</div>
	</div>
	<h2>맞춤 선곡</h2>
	<div class='row' id='customized' >
		<div class="col-md-3 col-sm-6">
			<img src='../images/album/1.jpg'>
			<span class='musicname'>노래 이름</span>
			<span class='artist'>가수이름</span><span class='alname'>앨범이름</span>
		</div>
		<div class="col-md-3 col-sm-6">
			<img src='../images/album/2.jpg'>
			<span class='musicname'>노래 이름</span>
			<span class='artist'>가수이름</span><span class='alname'>앨범이름</span>
		</div>
		<div class="col-md-3 col-sm-6">
			<img src='../images/album/3.jpg'>
			<span class='musicname'>노래 이름</span>
			<span class='artist'>가수이름</span><span class='alname'>앨범이름</span>
		</div>
		<div class="col-md-3 col-sm-6">
			<img src='../images/album/4.jpg'>
			<span class='musicname'>노래 이름</span>
			<span class='artist'>가수이름</span><span class='alname'>앨범이름</span>
		</div>
		<div class="col-md-3 col-sm-6">
			<img src='../images/album/5.jpg'>
			<span class='musicname'>노래 이름</span>
			<span class='artist'>가수이름</span><span class='alname'>앨범이름</span>
		</div>
		<div class="col-md-3 col-sm-6">
			<img src='../images/album/6.jpg'>
			<span class='musicname'>노래 이름</span>
			<span class='artist'>가수이름</span><span class='alname'>앨범이름</span>
		</div>
		<div class="col-md-3 col-sm-6">
			<img src='../images/album/4.jpg'>
			<span class='musicname'>노래 이름</span>
			<span class='artist'>가수이름</span><span class='alname'>앨범이름</span>
		</div>
		<div class="col-md-3 col-sm-6">
			<img src='../images/album/5.jpg'>
			<span class='musicname'>노래 이름</span>
			<span class='artist'>가수이름</span><span class='alname'>앨범이름</span>
		</div>
		<div class="col-md-3 col-sm-6">
			<img src='../images/album/6.jpg'>
			<span class='musicname'>노래 이름</span>
			<span class='artist'>가수이름</span><span class='alname'>앨범이름</span>
		</div>
		<div class="col-md-3 col-sm-6">
			<img src='../images/album/4.jpg'>
			<span class='musicname'>노래 이름</span>
			<span class='artist'>가수이름</span><span class='alname'>앨범이름</span>
		</div>
		<div class="col-md-3 col-sm-6">
			<img src='../images/album/5.jpg'>
			<span class='musicname'>노래 이름</span>
			<span class='artist'>가수이름</span><span class='alname'>앨범이름</span>
		</div>
		<div class="col-md-3 col-sm-6">
			<img src='../images/album/6.jpg'>
			<span class='musicname'>노래 이름</span>
			<span class='artist'>가수이름</span><span class='alname'>앨범이름</span>
		</div>
	</div>
</body>
</html>