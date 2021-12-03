<%@page import="com.mangomusic.soundtrack.model.SoundTrackVO"%>
<%@page import="com.mangomusic.soundtrack.model.SoundTrackDAO"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
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
	img {
    	float: left;
	}
	.title1, .title2{
		position: relative;
	}
	.first {
		margin: 75px;
	    margin-left: 250px;
	    margin-right: 250px;
	}
	.second {
	    margin-left: 250px;
	    margin-right: 250px;
	}
	
	.title1 {
	    font-size: 2.6em;
	    padding-left: 290px;
	    font-weight: bold;
	    padding-top: 40px;
	}
	.title2 {
	    padding-left: 290px;
	    font-size: 1.1em;
	    padding-top: 10px;
	}
	table {
		clear: both;
        width: 100%;
        border-top: 1px solid #ffffff;
        border-collapse: collapse;
        font-size: 0.95em;
    }
    td {
        border-bottom: 1px solid #e4e4e4;
        padding: 15px;
        font-weight: bold;
        
    }
    #1{
    	text-align: left;
    }
    #2{
    	text-align: center;
    }
</style>

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
	
	//3
	
%>
</head>
<body>
	<div>
		<header>
			<div class="left">MUSIC</div>
		</header>
		<div class="first">
			<img src="../images/<%=alno %>.jpg" alt="wonderlust" width="250" height="250" style="border-radius: 5px">
			<div class="title1"><%=vo.getAlName() %></div>
			<div class="title2"><%=vo.getRelDate() %></div>
		</div>
		<div class="second">
			<div style="height: 120px"></div>
			<table>
		<%	for(int i=0; i<list.size(); i++){ 
					SoundTrackVO vo2=list.get(i);%>
				<tr>
					<td id="1" width="600px"><%=i+1 %></td>
					<td><%=vo2.getTitle() %></td>
				</tr>
		<%	} %>
			</table>
		</div>
	</div>
</body>
</html>