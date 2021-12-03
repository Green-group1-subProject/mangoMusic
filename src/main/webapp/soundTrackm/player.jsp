<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(function () {
	});
</script>
<style type="text/css">
#audiodiv{
	background: #ffbc50; 
}
</style>
</head>
<body>

	<footer>
		<!-- 
오디오 태그 - 웹 브라우저에서 플러그인의 도움 없이 음악을 재생할 수 있게 만들어주는
HTML5 태그
 -->
		<audio src="../music/1.mp3" controls="controls"></audio>
		<div id='audiodiv'>
		<audio src="../music/1.mp3" controls="controls" preload="auto"
			autoplay="autoplay" loop="loop"></audio>
		</div>
		<audio controls="controls">
			<source src="../music/1.mp3" type="audio/mp3">
			<source src="../music/2.mp3" type="audio/ogg">
		</audio>
		<!-- 
	각 브라우저가 지원하는 음악 파일 확장자 형식이 다르다
	이러한 문제를 해결하고자 만들어진 태그-source 태그
	=> mp3파일과 ogg 파일을 제공하면 모든 브라우저 재생할 수 있음
 -->
	</footer>
</body>
</html>