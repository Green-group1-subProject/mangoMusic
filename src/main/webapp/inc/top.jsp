<%@page import="com.mangoMusic.member.model.MemberService"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.mangoMusic.member.model.MemberVO"%>
<%@page import="com.mangoMusic.member.model.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <title>망고뮤직:달달한 음악이 필요할 때</title>
        <link rel="icon" type="image/x-icon" href="../images/logos/망고로고2k.png" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script type="text/javascript" src="../css/bootstrap.css"></script>
	    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
        <script type="text/javascript" src="../js/jquery-3.6.0.min.js"></script>
        <link rel="stylesheet" type="text/css" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css">

<style type="text/css">
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap');

.badges{
	width:25px;
	margin-right:10px;
}
	
.container.px-2 {
	margin:0 auto;
}

.home-buttons{
	color : #495057;
}

</style>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.0/jquery-ui.min.js"></script>

<%
	String id=(String)session.getAttribute("id");
	boolean isLoggedOn=false;
	
	if(id!=null && !id.isEmpty()){
		isLoggedOn=true;
	}else{
		isLoggedOn=false;
	}
	
	MemberService service_top=new MemberService();
	MemberVO vo_top=null;
	
	try{
		vo_top=service_top.selectById(id);
	}catch(SQLException e){
		e.printStackTrace();
	}
	
	String membership_top=vo_top.getMembership();
%>
		
</head>
   
<body id="page-top">
       	<!-- 왼쪽로고 -->
        <nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top" id="mainNav" 
        style="border-top:5px solid #FFBC50; border-bottom:2px solid #FFBC50; height:75px;" >
        	<div class="container px-2">
                <a class="navbar-brand" href="../soundTrackm/index.jsp">
                <img id="mangologo" src="../images/logos/망고로고2k.png" style='height:40px; margin-left:50px;'></a>
                
                <!-- 가운데 네비게이션 -->
                <div class="collapse navbar-collapse">
                    <ul class="navbar-nav ms-auto text-center" style="float: none; margin:0 auto; 
                    font-weight: bold;">
                        <li class="nav-item"><a class="nav-link" href="../soundTrackm/index.jsp">Home</a></li>
                        <li class="nav-item"><a class="nav-link" href="">Chart</a></li>
                        <li class="nav-item"><a class="nav-link" href="../board/boardMain.jsp">Board</a></li>
                    </ul>
         		 </div>
                    
                 
                 <%if(isLoggedOn){%>
                    <!-- 로그인시 -->
                 	<%if(membership_top.equals("premium")){%>
                   	 <img src="../images/premium_badge.png" class="badges right-things">
                 	<%}else if(membership_top.equals("standard")){%>
                   	 <img src="../images/standard_badge.png" class="badges right-things">
                 	<%}%>
                    <div class="dropdown text-end right-things">
			          <a href="#" class="d-block link-dark text-decoration-none dropdown-toggle home-buttons" id="dropdownUser1" data-bs-toggle="dropdown" aria-expanded="false">
			            <span><%=id %>님</span>
			          </a>
			          <ul class="dropdown-menu text-small" style="">
			            <li><a class="dropdown-item" href="../myPage/editMyInfo.jsp">마이 페이지</a></li>
			            <li><a class="dropdown-item" href="../soundTrackm/playList.jsp">플레이리스트</a></li>
			            <li><hr class="dropdown-divider"></li>
			            <li><a class="dropdown-item" href="../login/logout.jsp">로그아웃</a></li>
			          </ul>
			        </div>
                <% }else{%>
                	<div class="dropdown text-end">
			          <a href="#" class="d-block link-dark text-decoration-none dropdown-toggle home-buttons" id="dropdownUser1" data-bs-toggle="dropdown" aria-expanded="false">
			            <span>로그인/회원가입</span>
			          </a>
			          <ul class="dropdown-menu text-small" style="">
			            <li><a class="dropdown-item" href="../login/Login.jsp">로그인</a></li>
			            <li><hr class="dropdown-divider"></li>
			            <li><a class="dropdown-item" href="../login/Agreement.jsp">회원가입</a></li>
			          </ul>
			        </div>
                <% }%>
     		</div>
 		</nav>
