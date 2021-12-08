<%@page import="com.mangoMusic.soundtrack.model.SoundTrackDAO"%>
<%@page import="com.mangoMusic.soundtrack.model.SoundTrackVO"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/bootstrap.css">
<title>Insert title here</title>
<style type="text/css" >
body{
	background: #fffaf2;
}
#artist, #genre, #top50{
	text-align: center;
}
#artist img,#genre img,#top50 img{
	width: 250px;
	height: 250px;
	margin-left: 10px;
}
#artist p,#genre p,#top50 p{
	text-align: left;
	margin-left: 10px;
}
#artist span,#genre span,#top50 span{
	float: left;
	margin-left: 10px;
}
#customized{
	text-align: center;
}
#customized img{
	margin-left: 40px;
	margin-top:2px;
	width: 50px;
	height: 50px;
}
#customized div{
	height: 60px;
	text-align: left;
}
.musicname{
	margin-top: 2px;
	position: absolute;
	font-weight: bold;
}
.musicname2{
	font-weight: bold;
}
.artist{
	margin-top: 30px;
	position: absolute;
}
.alname{
	margin-top: 30px;
	margin-left: 150px;
	position: absolute;
	width: 180px;
}
.artist2{
	font-size: 10pt;
}
.alname2{
	font-size: 10pt;
}
#record{
	text-align: center;
	margin: 0 200px;
	color: #333333;
}
h2{
	color: #333333;
}
</style>
<%

	SoundTrackDAO dao= new SoundTrackDAO();
//장르별 선곡
	
	//artist top6
	//1
	//2
	List<SoundTrackVO> alist=null;
	try{
		alist=dao.selectArtist();
	}catch(SQLException e){
		e.printStackTrace();
	}
	
	//맞춤선곡
	List<SoundTrackVO> sel12=null;
	try{
		sel12=dao.select12();
	}catch(SQLException e){
		e.printStackTrace();
	}
	
	//top20
	List<SoundTrackVO> top20=null;
	try{
		top20=dao.selectTop20();
	}catch(SQLException e){
		e.printStackTrace();
	}
	
	
	
	//장르
	List<SoundTrackVO> genre=null;
	try{
		genre=dao.genre();
	}catch(SQLException e){
		e.printStackTrace();
	}
	
%>
<script type="text/javascript" src="../css/bootstrap.css"></script>
<script type="text/javascript" src="../js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(function () {
		$('#top50 img, #top50 span').css('cursor','pointer').click(function () {
			location.href='top50Board.jsp';
		});
		$('#oldMusic img, #oldMusic span').css('cursor','pointer').click(function () {
			location.href='genreBoard.jsp';
		});
	});
</script>
</head>
<body>

	<div id='record'>
	<h2>artist record</h2>
		<div class='row' id='artist'>
			<% for(int i=0; i<alist.size(); i++){ 
				SoundTrackVO vo=alist.get(i);
				 
			%>
				<div class="col-lg-2 col-sm-6" class="">
					<a href='artistBoard.jsp?arno=<%=vo.getArNo() %>'>
					<img src='../images/aimages/<%=vo.getArNo() %>.jpg'>
					<div style='float:left'>
					<span class='artist2'><%=vo.getArName() %></span>
					</div>
					</a>
				</div>
			<%} %>
		</div>
	<br>
	<h2>맞춤 선곡</h2>
		
		<div class='row' id='customized' >
			<% for(int i=0; i<12; i++){ 
					SoundTrackVO vo=sel12.get(i);
			%>
			<div class="col-md-4 col-sm-6">
				<a href="playList.jsp?sno=<%=vo.getsNo() %>">
				<img src='../images/<%=vo.getAlNo() %>.jpg'>
				<span class='musicname'><%=vo.getTitle() %></span>
				<span class='artist'><%=vo.getArName() %></span><span class='alname'><%=vo.getAlName() %></span>
				</a>
			</div>
			<%} %>
		</div>
		<br>
		<h2>TOP 20</h2>
		<div class='row' id='top50'>
			<% for(int i=0; i<top20.size(); i++){ 
					SoundTrackVO vo=top20.get(i);	
			%>
				<div class="col-lg-2 col-sm-6" id='art1'>
					<a href="playList.jsp?sno=<%=vo.getsNo() %>">
					<img src='../images/alimages/<%=vo.getAlNo() %>.jpg'>
					<div style='float:left'>
					<span class='musicname2'><%=vo.getTitle() %></span><br>
					<span class='artist2'><%=vo.getArName() %></span>&nbsp;&nbsp;<span class='alname2'><%=vo.getAlName() %></span>
					</div>
					</a>
				</div>
			<%} %>
		</div>
		<br>
		<h2>장르별 선곡</h2>
		<div class='row' id='genre'>
			<% for(int i=0; i<6; i++){
				SoundTrackVO vo=genre.get(i);
				%>
				
				<div class="col-lg-2 col-sm-6" id='art1'>
					<a href='genrePage.jsp?geno=<%=vo.getGeNo() %>'>
					<img src='../images/gimages/<%=vo.getGeNo() %>.png'>
					<div style='float:left'>
					<span class='artist2'><%=vo.getGeName() %></span>&nbsp;&nbsp;
					</div>
					</a>
				</div>
			<%} %>
		</div>
	</div>
</body>
</html>