<%@page import="com.mangoMusic.soundtrack.model.SoundTrackVO"%>
<%@page import="com.mangoMusic.soundtrack.model.SoundTrackDAO"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/bootstrap.css">
<script type="text/javascript" src="../css/bootstrap.css"></script>
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
	#alImg {
    	float: left;
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
	
	.title1 {
	    font-size: 2.6em;
	    padding-left: 290px;
	    padding-top: 40px;
	}
	.title2 {
	    padding-left: 290px;
	    font-size: 1.05em;
	    padding-top: 10px;
	}
	.title3 {
	    padding-left: 290px;
	    font-size: 1.05em;
	    padding-top: 1px;
	}
	.boss {
        width: 100%;
        font-size: 0.95em;
    }
    #1{
    	text-align: left;
    }
    #2{
    	text-align: center;
    }
    
    div#num {
	    margin-left: 15px;
	}
	#num, .title2, .title3, .title4{
		font-weight: 600;
		color: #5F5F5F;
		font-family: 'Noto Sans KR';
	}
	.title1, #ti{
		font-weight: bold;
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
	    margin-top: -25px;
	    margin-left: 23px;
	}
	a:hover #iconImg{
		display: block;
		
	}
</style>
<script type="text/javascript">
	$(function () {
		$('a').hover(function(){
	        $(this).find('#alImg').css('opacity',0.2);
	    }, function() {
	        $(this).find('#alImg').css('opacity',1);
	    });
	});
</script>

<%
	//1
	String alno=request.getParameter("alno");

	//2
	SoundTrackDAO dao = new SoundTrackDAO();
	SoundTrackVO vo=null;
	try{
		vo=dao.albumByNo(Integer.parseInt(alno));
	}catch(SQLException e){
		e.printStackTrace();
	}

	//2
	
	List<SoundTrackVO> list=null;
	try{
		list=dao.albumList(Integer.parseInt(alno)); 
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
			<img src="../images/<%=alno %>.jpg" alt="albumImg" id="alImg" width="250" height="250" style="border-radius: 5px">
				
			<div class="title1"><%=vo.getAlName() %></div>
			<div class="title2"><%=vo.getRelDate() %> • 
				<a href='artistPage.jsp?arno=<%=vo.getArNo() %>'><span class="title4"><%=vo.getArName() %></span></a></div>
			<div class="title3">노래 <%=list.size() %>곡</div>
		</div>
		<div class="second">
			<div style="height: 120px"></div>
			<div class="boss">
		<%	for(int i=0; i<list.size(); i++){ 
					SoundTrackVO vo2=list.get(i);%>
				<a href="playList.jsp?sno=<%=vo2.getsNo() %>">
				<div class="row">
					<div id="bottomImg">
						<div class="col-md-5" id="num"><span><%=i+1 %></span></div>
						<img src="../icon/playIcon3.png" alt="IconImg" id="iconImg"
								width="35" height="35" style="border-radius: 5px">
					</div>	
						<div class="col-md-6" id="ti"><span><%=vo2.getTitle() %></span></div>
				</div>
				</a>
				<hr>
				
		<%	} %>
			</div>
		</div>
	</div>
</body>
</html>