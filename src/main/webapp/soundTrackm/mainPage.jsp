<%@page import="java.sql.SQLException"%>
<%@page import="com.mangoMusic.soundtrack.model.SoundTrackVO"%>
<%@page import="java.util.List"%>
<%@page import="com.mangoMusic.soundtrack.model.SoundTrackDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%

	SoundTrackDAO dao= new SoundTrackDAO();
	
	//artist page
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
<link rel="stylesheet" href="../css/bootstrap.css">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->
<script type="text/javascript" src="../css/bootstrap.css"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.6.0/slick.js"></script>
<script type="text/javascript" src="../js/">jquery-3.6.0.min.js</script>

<style type="text/css">
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap');

h2{
  text-align:left;
  padding: 20px;
  font-weight: bold;
  color: #333333;
}
/* Slider */

.slick-slide {
    margin: 0px 20px;
}

.slick-slide img {
    width: 220px;
    height: 220px;
}

.slick-slider
{
    position: relative;
    display: block;
    box-sizing: border-box;
    -webkit-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
            user-select: none;
    -webkit-touch-callout: none;
    -khtml-user-select: none;
    -ms-touch-action: pan-y;
        touch-action: pan-y;
    -webkit-tap-highlight-color: transparent;
}

.slick-list
{
    position: relative;
    display: block;
    overflow: hidden;
    margin: 0;
    padding: 0;
}
.slick-list:focus
{
    outline: none;
}
.slick-list.dragging
{
    cursor: pointer;
    cursor: hand;
}

.slick-slider .slick-track,
.slick-slider .slick-list
{
    -webkit-transform: translate3d(0, 0, 0);
       -moz-transform: translate3d(0, 0, 0);
        -ms-transform: translate3d(0, 0, 0);
         -o-transform: translate3d(0, 0, 0);
            transform: translate3d(0, 0, 0);
}

.slick-track
{
    position: relative;
    top: 0;
    left: 0;
    display: block;
}
.slick-track:before,
.slick-track:after
{
    display: table;
    content: '';
}
.slick-track:after
{
    clear: both;
}
.slick-loading .slick-track
{
    visibility: hidden;
}

.slick-slide
{
    display: none;
    float: left;
    height: 100%;
    min-height: 1px;
}
[dir='rtl'] .slick-slide
{
    float: right;
}
.slick-slide img
{
    display: block;
}
.slick-slide.slick-loading img
{
    display: none;
}
.slick-slide.dragging img
{
    pointer-events: none;
}
.slick-initialized .slick-slide
{
    display: block;
}
.slick-loading .slick-slide
{
    visibility: hidden;
}
.slick-vertical .slick-slide
{
    display: block;
    height: auto;
    border: 1px solid transparent;
}
.slick-arrow.slick-hidden {
    display: none;
}

#mainImg{
	width: 230px;
	height: 230px;
	border-radius: 5px
}

.container {
    max-width: 1540px;
    margin-left: -5px;
}

#customized{
	text-align: center;
}
#customized img{
	margin-left: 20px;
	margin-top:2px;
	width: 50px;
	height: 50px;
	border-radius: 5px
}
#customized div{
	height: 60px;
	text-align: left;
}
section#main {
    margin-left: 180px;
    margin-right: 180px;
}
.artist3{
	margin-top: 30px;
	position: absolute;
	margin-left: 15px;
}
.alname{
	margin-top: 30px;
	margin-left: 150px;
	position: absolute;
	width: 180px;
}
.musicname{
	margin-top: 2px;
	position: absolute;
	margin-left: 15px;
}
div#genre {
    margin-left: 10px;
    margin-right: 20px;
}
.row {
    margin-right: -5px;
    margin-left: -5px;
}
a:hover{
	color: #5F5F5F;
	font-weight: bold;
}
#black, .musicname, .artist2{
	font-weight: bold;
	color: #333333;
	font-family: 'Noto Sans KR'; 
}
.artist3, .alname, #gray{
	font-weight: 600;
	color: #5F5F5F;
	font-family: 'Noto Sans KR';
}
.artist3, .alname{
	font-size: 0.9em;
}

#mainsection{
	padding:-144px 0;
}
</style>
</script>
<script type="text/javascript">
$(document).ready(function(){
    $('.customer-logos').slick({
        slidesToShow: 6,
        slidesToScroll: 1,
        autoplay: true,
        autoplaySpeed: 1500,
        arrows: false,
        dots: false,
        pauseOnHover: false,
        responsive: [{
            breakpoint: 768,
            settings: {
                slidesToShow: 4
            }
        }, {
            breakpoint: 520,
            settings: {
                slidesToShow: 3
            }
        }]
    });
    
    $('img').hover(function(){
        $(this).css('opacity',0.5);
    }, function() {
        $(this).css('opacity',1);
    });
    
    $('a').hover(function(){
        $(this).find('.alUnderline').css("text-decoration","underline");
	}, function() {
        $(this).find('.alUnderline').css("text-decoration","none");
    });
    
});
</script>
</head>
<body>
<section id="main">
<div class="container">
  <h2>Artist</h2>
   <div class="customer-logos slider mainsection">
   		<% for(int i=0; i<alist.size(); i++){ 
							SoundTrackVO vo=alist.get(i);%>
							
      		<div class="slide">
      			<a href='artistPage.jsp?arno=<%=vo.getArNo() %>'>
					<img src='../images/aimages/<%=vo.getArNo() %>.jpg' id="mainImg">
					<span id="black"><%=vo.getArName() %></span>
				</a>
      		</div>
      	 <%} %>
   </div>
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
			<span class='musicname alUnderline'><%=vo.getTitle() %></span>
			<span class='artist3 alUnderline'><%=vo.getArName() %></span><span class='alname alUnderline'><%=vo.getAlName() %></span>
			</a>
		</div>
		<%} %>
	</div>
<br>
<div class="container">
  <h2>TOP 20</h2>
   <div class="customer-logos slider mainsection">
   		<% for(int i=0; i<top20.size(); i++){ 
   				SoundTrackVO vo=top20.get(i);%>
							
      		<div class="slide">
      			<a href="playList.jsp?sno=<%=vo.getsNo() %>">
					<img src='../images/alimages/<%=vo.getAlNo() %>.jpg' id="mainImg">
					<span class='artist2'><%=vo.getTitle() %></span><br>
					<span id="gray"><%=vo.getAlName() %> • </span><span id="gray"><%=vo.getArName() %></span>
				</a>
      		</div>
      	 <%} %>
   </div>
</div>   
<br>
<h2>장르별 선곡</h2>
	<div class='row' id='genre'>
		<% for(int i=0; i<6; i++){
			SoundTrackVO vo=genre.get(i);
			%>
			
			<div class="col-lg-2 col-sm-6" id='art1'>
				<a href='genrePage.jsp?geno=<%=vo.getGeNo() %>'>
				<img src='../images/gimages/<%=vo.getGeNo() %>.png' id="mainImg">
				<div>
				<span id="black"><%=vo.getGeName() %></span>&nbsp;&nbsp;
				</div>
				</a>
			</div>
		<%} %>
	</div>  
</section>

</body>
</html>