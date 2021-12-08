<%@page import="com.mangoMusic.soundtrack.model.SoundTrackVO"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.mangoMusic.soundtrack.model.SoundTrackDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/bootstrap.css">
<script type="text/javascript" src="../css/bootstrap.css"></script>
<script type="text/javascript" src="../js/jquery-3.6.0.min.js"></script>

<style type="text/css">
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap');

header{
	position: relative;
	width: 100%;
	height: 60px;
	background: #ffbc50;
}
/* #artistMain{
	margin:0 300px;"
} */
#artistMainimg {
    width: 100%;
    height: 500px;
}
#alimg {
    width: 35px;
    height: 35px;
}
a{
	text-decoration: none;
	color: :#333333;
}

#music {
    margin-left: 5px;
}
.artist2{
	font-size: 10pt;
}
.alname2{
	font-size: 10pt;
}
#artist{
	text-align: center;
}
#artist img{
	width: 180px;
	height: 180px;
	margin-left:5px;
}
#artist p{
	text-align: left;
	margin-left: 10px;
}
#artist span {
    float: left;
    margin-left: 15px;
}
#foot{
	height: 170px;
}
#mList {
    margin-top: 15px;
    margin-left: 15px;
}
#aList {
    margin-left: 35px;
}
.pagetitle{
	font-weight: bold;
	font-size: 24pt;
}
hr {
    margin: 5px 0;
}
.artext{
	margin-left:10px;
	padding-right: 250px;
}
#song {
    margin-left: 240px;
    margin-right: 240px;
    margin-top: 160px;
}
div#album {
    margin-left: 240px;
    margin-right: 220px;
}
#songT, #songR, #songL{
	margin: 5px 5px;
	font-size: 0.95em;
}
.col-md-3 {
    margin: 5px 5px;
}
div#sing {
    margin-bottom: 20px;
    margin-top: 40px;
}
.col-md-4 {
    padding-top: 5px;
    margin-right: 5px;
}
#alimg, #bigAlimg{
	border-radius: 5px
}
h1, .pagetitle, #songT, .musicname2{
	color: #333333;
	font-weight: bold;
	font-family: 'Noto Sans KR';
}
.musicname2{
	font-size: 0.95em;
	text-align: left;
}
#songR, #songL, #MList, #aList, .rel{
	color: #5F5F5F;
	font-weight: 600;
	font-family: 'Noto Sans KR';
}
a:hover{
	color: #5F5F5F;
	font-weight: bold;
}
.col-lg-2.col-sm-6 {
    margin-left: -13px;
    margin-right: 13px;
}
#MList, #aList {
    font-size: 0.93em;
}
h1{
    font-size: 3.5rem;
    margin-left: 240px;
    margin-top: -40px;
}
#iconImg {
    position: absolute;
    display: none;
    width: 25px;
    height: 30px;
    margin-top: -32px;
    margin-left: 6px;
}
a:hover #iconImg{
	display: block;
}



</style>

<script type="text/javascript">
	$(function () {
		$('#album').click(function () {
			
		});
		
		$('a').hover(function(){
	        $(this).find('#alimg').css('opacity',0.2);
	        $(this).find('.alUnderline').css("text-decoration","underline");
		}, function() {
	        $(this).find('#alimg').css('opacity',1);
	        $(this).find('.alUnderline').css("text-decoration","none");
	    });
		
	}); 
	
</script>
</head>

<body>
<%
	//1
	String arno=request.getParameter("arno");
	//2
	SoundTrackDAO dao=new SoundTrackDAO();
	
	//메인가수이름
	String arName=null;
	try{
		arName=dao.selectArName(Integer.parseInt(arno));
	}catch(SQLException e){
		e.printStackTrace();
	}
	
	//해당 가수의 TOP6
	List<SoundTrackVO> sList=null;
	try{
		sList=dao.selectArTOP(Integer.parseInt(arno));
	}catch(SQLException e){
		e.printStackTrace();
	}
	
	
	//해당 가수의 앨범목록
	List<SoundTrackVO> alList=null;
	try{
		alList=dao.selectArAl(Integer.parseInt(arno));
	}catch(SQLException e){
		e.printStackTrace();
	}
	//3
	
%>
	<header>
	</header>
	<div id="topImg">
		<img src="../images/arimages/<%=arno %>.jpg" id="artistMainimg">
		<h1><%=arName %></h1>
	</div>
	<div id="song">
			<div id="sing"><span class="pagetitle">노래</span></div>
			<%for(int i=0;i<sList.size();i++){ 
				SoundTrackVO vo=sList.get(i);
			%>
			<a href="playList.jsp?sno=<%=vo.getsNo() %>">
			<div class="row" id="music">
				<div id="bottomImg">
					<img src='../images/alimages/<%=vo.getAlNo() %>.jpg' id='alimg'>
					<img src="../icon/playIcon3.png" alt="IconImg" id="iconImg"
								width="35" height="35" style="border-radius: 5px">
				</div>	
					<div class="col-md-4" ><span id="songT"><%=vo.getTitle() %></span></div>
					<div class="col-md-3"><span id="songR"><%=vo.getArName() %></span></div>
					<div class="col-md-4"><span id="songL"><%=vo.getAlName() %></span></div>
			</div><%if(i!=5){ %><hr>
					<%} %>
			</a>
			<%} %>
		<div  id="mList">
		<a href="musicAll.jsp?arno=<%=arno %>" id="MList">전체보기</a></div><br><br>
	</div>	
	<div id="album">
		<span class="pagetitle">앨범</span><a href="albumList.jsp" id="aList">모두보기</a><br>
		<div class='row' id='artist'>
			<% for(int i=0; i<alList.size(); i++){ 
					SoundTrackVO vo=alList.get(i);
			%>
				<div class="col-lg-2 col-sm-6" >
					<a href="albumPage.jsp?alno=<%=vo.getAlNo() %>" style="text-decoration: none">
						<img src='../images/alimages/<%=vo.getAlNo() %>.jpg' id="bigAlimg">
						<span class='musicname2 alUnderline'><%=vo.getAlName() %></span>&nbsp;
						<span class="rel alUnderline"><%=vo.getRelDate() %></span>
					</a>
				</div>
			<%} %>
		</div>
	</div>
	<div id="foot"></div>
</body>
</html>