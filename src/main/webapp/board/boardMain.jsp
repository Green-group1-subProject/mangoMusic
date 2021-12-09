<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>
<!DOCTYPE html>
<html>
<head>
  <title>Bootstrap Example</title>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

 
  <style>
	header{
		position: relative;
		width: 100%;
		height: 60px;
		background: #ffbc50;
	}
    
    .row.content {height: 450px}
    
    .sidenav {
      padding-top: 20px;
      background-color: #f1f1f1;
      height: 100%;
    }
    
    footer {
      background-color: #ffbc50;
      color: white;
      padding: 15px;
    }
    
    @media screen and (max-width: 767px) {
      .sidenav {
        height: auto;
        padding: 15px;
      }
      .row.content {height:auto;} 
    }
    
    div #myNavbar {
    	background-color: #ffbc50;
    }
    .active a{
    	background-color: #ffffff;
    }
    .navbar-inverse {
    background-color: #ffffff;
    border-color: #ffffff;
	}
	
	.navbar-inverse .navbar-nav>.active>a, .navbar-inverse .navbar-nav>.active>a:focus, .navbar-inverse .navbar-nav>.active>a:hover {
	    color: #333333;
	    background-color: #ffffff;
	}

	a{
		color: #999999;
	    text-decoration:none;
	    font-size: 15px;
	    decoration:none;
	}

	h2{
		font-size:27px;
	
	}
body {
/* 	width : 1500px;
    padding: 78px;
    margin: 6px;
/*     display: flex; */
/*     margin-left:50%;
    padding-left:20%; */ */
    height : auto;
    
}   
.row.content {
    height: 750px;
}
.h1, .h2, .h3, h1, h2, h3 {
    margin-top: 31px;
    margin-bottom: 65px;
    margin-left: 20px;
}
.btn-info {
    color: #333333;
    background-color: #e4e4e4;
    border-color: #e4e4e4; 
    width:50%;
/*     padding-left:0; */
     text-align:left; 
     margin-top:20px;

}

.collapse.in {
 
    margin-top:20px;
}


 .col-sm-8 {
    position: relative;
    min-height: 1px;
    padding-right: 15px;
    padding-left: 150px;
}
.h1, .h2, .h3, h1, h2, h3 {
    margin-top: 31px;
    margin-bottom: 33px;
    margin-left: 10px;
}
.divPage {
margin:30px 0px 20px 270px;

}

input[type=text]{
  width:470px;
  margin-bottom:20px;
}


.divBtn #btn2 {
	margin-left:190px;
	width:8%;
	height:20%;
	boder:none;
	background:#ffbc50;
	border-radius: 25px;
	color:#ffffff;
	font-weight: bold;
/* 	background-color:none;
	boder-color:none; */
	
}

.divBtn #btn3 {
	margin-left:0px;
	width:7%;
	height:20%;
	boder:solid 1px #ffbc50;
	background:#ffbc50;
	border-radius: 25px;
	font-weight: bold;
	color:#ffffff;
/* 	background-color:none;
	boder-color:none; */
}

  </style>
</head>
<body>
  
<div class="container-fluid text-center">    
  <div class="row content">
    <div class="col-sm-2 sidenav">
      <p><a href="#">자주묻는질문</a></p>
      <p><a href="#">음악자유게시판</a></p>
    </div>
<div class="col-sm-8 text-left"> 

	<%@include file="../board/list.jsp" %>
	<div class="divBtn">
		<button id="btn2" onclick="window.open('../board/write.jsp','window_name','width=1030,height=800,location=no,status=no,scrollbars=yes');">글쓰기</button>
		<button id="btn3" onclick="window.open('../board/delete.jsp','window_name','width=430,height=500,location=no,status=no,scrollbars=yes');">삭제</button>
	</div>
    </div>
  </div>
</div>
</body>
</html>