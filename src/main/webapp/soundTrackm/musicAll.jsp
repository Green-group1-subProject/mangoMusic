<%@page import="com.mangoMusic.soundtrack.model.SoundTrackVO"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.mangoMusic.soundtrack.model.SoundTrackDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>
<!DOCTYPE html>
<html lang="ko">
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
#musicMain {
    margin-left: 240px;
    margin-right: 240px;
}
.pagetitle {
    font-size: 2.6em;
    margin-top: 40px;
}
#alimg {
    width: 35px;
    height: 35px;
    border-radius: 5px;
}
.row{
	margin-left: 4px;
}
#ti, #ar, #al{
	margin: 5px;
	font-size: 0.95em;
}
hr{
	margin: 5px 0;
}
.pagetitle, #ti{
	color: #333333;
	font-weight: bold;
	font-family: 'Noto Sans KR';
}
#ar, #al{
	color: #5F5F5F;
	font-weight: 600;
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
    margin-left: 6px;
}
a:hover #iconImg{
	display: block;
	
}
</style>
<script type="text/javascript">
	$(function () {
		$('a').hover(function(){
	        $(this).find('#alimg').css('opacity',0.2);
	    }, function() {
	        $(this).find('#alimg').css('opacity',1);
	    });
	});
</script>
</head>
<body>
<%
	//1 가수음악 전체조회
	String arno=request.getParameter("arno");
	//2
	SoundTrackDAO dao=new SoundTrackDAO();
	List<SoundTrackVO> list=null;
	try{
		list=dao.selectSongAll(Integer.parseInt(arno));
	}catch(SQLException e){
		e.printStackTrace();
	}
%>
		<header>
		</header>
		<div id="musicMain">
		<h1 class="pagetitle">노래</h1><br>
 		<%for(int i=0;i<list.size();i++){ 
			SoundTrackVO vo=list.get(i);
%>			<a href="playList.jsp?sno=<%=vo.getsNo() %>">
			<div class="row" id="music">
				<div id="bottomImg">			
					<img src='../images/alimages/<%=vo.getAlNo() %>.jpg' id='alimg'>
					<img src="../icon/playIcon3.png" alt="IconImg" id="iconImg"
								width="35" height="35" style="border-radius: 5px">
				</div>	
					<div class="col-md-4" id="ti"><span><%=vo.getTitle() %></span></div>
					<div class="col-md-3" id="ar"><span><%=vo.getArName() %></span></div>
					<div class="col-md-4" id="al"><span><%=vo.getAlName() %></span></div>
			</div>
			</a>	
			<hr>
		<%} %>	
		</div>
</body>
</html>