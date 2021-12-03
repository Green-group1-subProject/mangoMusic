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
h1{
	font-weight: bold;
}
body{
	color: #333333;
}
#artistMain{
	margin:0 300px;"
}
#artistMainimg{
	width: 300px;
	height: 300px;
}
#alimg{
	width:30px;
	height:30px;
}
a{
	text-decoration: none;
	color: :#333333;
}

#music{
	margin-left: 50px;
}
.artist2{
	font-size: 10pt;
}
.alname2{
	font-size: 10pt;
}
.musicname2{
	font-weight: bold;
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
#artist span{
	float: left;
	margin-left: 10px;
}
#foot{
	height: 170px;
}
#mList{
	margin-top: 10px;
	margin-left: 50px;
}
#aList{
	margin-left: 50px;
}
.pagetitle{
	font-weight: bold;
	font-size: 24pt;
	color: #333333;
}
hr{
	margin: 6px 0;
}
.artext{
	margin-left:10px;
	margin-right: 300px;
}
</style>
<script type="text/javascript">
	$(function () {
		$('#album').click(function () {
			
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
<h1>artistBoard</h1>
	<div id="artistMain">
		<div>
			<img src="../images/aimages/<%=arno %>.jpg" id="artistMainimg">
			<h1><%=arName %></h1><br>
			
			<span class="pagetitle">노래</span><br>
			<%for(int i=0;i<6;i++){ 
				SoundTrackVO vo=sList.get(i);
			%>
			
			<div id="music">
					<img src='../images/<%=arno %>.jpg' id='alimg'>
					<span class="artext"><%=vo.getTitle() %></span>
					<span class="artext"><%=vo.getArName() %></span>
					<span class="artext"><%=vo.getAlName() %></span>
			</div><%if(i!=5){ %><hr>
					<%} %>
			<%} %>
		<div  id="mList">
		<a href="musicList.jsp">전체보기</a></div><br><br>
		</div>
		<span class="pagetitle">앨범</span><a href="albumList.jsp" id="aList">모두보기</a><br>
		<div class='row' id='artist'>
			<% for(int i=0; i<alList.size(); i++){ 
					SoundTrackVO vo=alList.get(i);
			%>
				<div class="col-lg-2 col-sm-6" >
					<a href="albumPage.jsp?alno=<%=vo.getAlNo() %>">
						<img src='../images/alimages/<%=vo.getAlNo() %>.jpg'>
						<span class='musicname2'><%=vo.getAlName() %></span>&nbsp;
						<span><%=vo.getRelDate() %></span>
					</a>
				</div>
			<%} %>
		</div>
		<div id="foot"></div>
	</div>
</body>
</html>