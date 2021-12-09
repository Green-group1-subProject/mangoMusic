<%@page import="java.util.List"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.mangoMusic.soundtrack.model.SoundTrackVO"%>
<%@page import="com.mangoMusic.soundtrack.model.SoundTrackDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/nice-select.css" rel="stylesheet">   
<link rel="stylesheet" href="../css/bootstrap.css">
<style type="text/css">
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap');
	body {
    	margin: 0px;
	}
	header{
		position: relative;
		width: 100%;
		height: 60px;
		background: #ffbc50;
	}
	.left {
	    font-size: 1.4em;
	    font-weight: bold;
	    padding: 10px;
	    color: #ffffff;
	}
	.title1, .title2{
		position: relative;
	}
	.first {
		margin: 75px;
	    margin-left: 240px;
	    margin-right: 240px;
	}
	.second {
	    margin-left: 240px;
	    margin-right: 240px;
	}
	
	#title1 {
	    font-size: 2.6em;
	    padding-left: 35px;
	    padding-top: 40px;
	}
	.title2 {
		padding-left: 290px; 
		padding-top: 20px;
	}
	.title3{
		padding-left: 290px;
		padding-top: 5px;
	}
	.boss {
		clear: both;
        width: 100%;
        font-size: 0.95em;
    }
    span {
        font-weight: bold;
        
    }
	#sel{
		margin-top: 50px;
	}
	.nice-select{
		border: 1px solid #ffbc50;
	}
	.row img{
		margin-left: 20px;
	}
	hr{
		margin: 5px 0;
	}
	#ti, #ar, #al {
	    margin: 5px 5px;
	}
	div#al {
	    margin-left: 40px;
	}
	#albumImg{
		float: left;
		position: relative;
	}
	#title1, #ti{
		color: #333333;
		font-weight: bold;
		font-family: 'Noto Sans KR';
	}
	.title2, .title3, #ar, #al{
		color: #5F5F5F;
		font-weight: 600;
		font-family: 'Noto Sans KR';
	}
	.nice-select option{
		color: #333333;
		font-family: 'Noto Sans KR';
	}
	a:hover{
		color: #5F5F5F;
		font-weight: bold;
	}
	#iconImg {
	    position: absolute;
	    display: none;
	    width: 25px;
	    height: 30px;
	    margin-top: -32px;
	    margin-left: 26px;
	}
	a:hover #iconImg{
		display: block;
		
	}
	
	
</style>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-nice-select/1.1.0/js/jquery.nice-select.min.js"></script>
<script type="text/javascript" src="../css/bootstrap.css"></script>
<script type="text/javascript" src="../js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){

		$('.nice-select').change(function(){
	    	location.href="genrePage.jsp?geno="+($(this).val());
	    });
		
		$('a').hover(function(){
	        $(this).find('#alImg').css('opacity',0.2);
	    }, function() {
	        $(this).find('#alImg').css('opacity',1);
	    }); 
	});
</script>
<%
	//1
	String geNo=request.getParameter("geno");
	
	//2
	SoundTrackDAO dao = new SoundTrackDAO();
	SoundTrackVO vo=null;
	try{
		vo=dao.genreByNo(Integer.parseInt(geNo));
	}catch(SQLException e){
		e.printStackTrace();
	}
	
	//2
	List<SoundTrackVO> list=null;
	try{
		list=dao.genreList(Integer.parseInt(geNo));
	}catch(SQLException e){
		e.printStackTrace();
	}
%>
</head>
<body>
	<div>
		<header>
		</header>
		<div class="first">
			<img src="../images/gimages/<%=geNo %>.png" alt="albumImg" id="albumImg" width="250" height="250" style="border-radius: 5px">
			<div class="row" id="top">
			<div class="col-md-8" id="title1"><%=vo.getGeName() %></div>
			<div class="col-md-4" id="sel">
				<select class="nice-select">
					<option data-display="Select"><%=vo.getGeName() %></option>
					<option value="1">발라드</option>
					<option value="2">pop</option>
					<option value="3">kpop</option>
					<option value="4">rock</option>
					<option value="5">Jazz</option>
					<option value="6">힙합</option>
				</select>
			</div>
			</div>
			<div class="title2">재생목록 • MangoMusic • 2021</div>
			<div class="title3">노래 <%=list.size() %>곡</div>
		</div>
		
		<div class="second">
			<div style="height: 100px"></div> 
			<div class="boss">
		<%	for(int i=0; i<list.size(); i++){ 
					SoundTrackVO vo2=list.get(i);%>
					<a href="playList.jsp?sno=<%=vo2.getsNo() %>">
						<div class="row">
							<div id="bottomImg">
								<img src="../images/<%=vo2.getAlNo() %>.jpg" alt="albumImg" id="alImg"
								width="35" height="35" style="border-radius: 5px">
								<img src="../icon/playIcon3.png" alt="IconImg" id="iconImg"
								width="35" height="35" style="border-radius: 5px">
							</div>	
								<div class="col-md-4" id="ti"><span><%=vo2.getTitle() %></span></div><!-- 노래제목 -->
								<div class="col-md-3" id="ar"><span><%=vo2.getArName() %></span></div><!-- 가수명 -->
								<div class="col-md-4" id="al"><span><%=vo2.getAlName() %></span></div><!-- 앨범명 -->
						</div> 
					</a>
				<hr>
		<%	} %>
			</div>
		</div>
	</div>
</body>
</html>