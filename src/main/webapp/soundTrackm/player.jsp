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
<link rel="stylesheet" type="text/css" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css">
<style type="text/css">
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap');

	* {
  margin: 0;
  padding: 0;
}

body {
  background-color: #fff;
}


.player {
 position: relative;
 margin: 0 auto;
 width: 98.91%;
 padding: 10px;
 overflow: hidden;
 background-color: #ffbc50;
}

.icons {
  color: #ffffff;
}

.trackDetails {
    border-radius: 4px;
    margin-left: 830px;
    height: 45px;
}

.title,
.artist {
  -moz-user-select: none;
  left: 167px;
      display: block;
    width: 200px;
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
    font-weight: bold;
    text-align: left;
    padding-left: 15px;
}

.title {
	font-size: 14.5px;
	color: #5F5F5F;
	font-family: 'Noto Sans KR';
}

.artist {
  	font-size: 14.5px;
	color: #333333;
	font-family: 'Noto Sans KR';
}

.playlistIcon,
.volumeIcon {
  position: absolute;
  right: 0;
  cursor: pointer;
  width: 32px;
}

.volumeIcon {
  bottom: 6px;
  display: block;
}

.controls {
    cursor: pointer;
    width: 180px;
    height: 0px;
    margin: 0 auto;
    float: left;
    margin-top: 3px;
}

.controls .play,
.controls .pause,
.controls .rew,
.controls .fwd {
  float: left;
  height: 40px;
  width: 40px;
  line-height: 40px;
  text-align: center;
}

.controls .play,
.controls .pause,
.plIcon,
.volumeIcon {
  font-size: 1em;
}

.controls .pause {
  display: none;
}

.hidden {
  display: none;
}

.controls .visible {
  display: block;
}

.tracker span { 
    display: none !important;
}

.ui-slider .ui-slider-handle {
  display: block;
  height: 14px;
  border-radius: 14px;
  width: 14px;
  -webkit-transition: all ease-in-out .3s;
  transition: all ease-in-out .3s;
}

.tracker .ui-slider-range {
  background: #000;
  -webkit-transition: all ease-in-out .3s;
  transition: all ease-in-out .3s;
  height: 100%;
  top: 0;
}

.volume .ui-slider-range {
  background: #333333;
  -webkit-transition: all ease-in-out .3s;
  transition: all ease-in-out .3s;
}

.volume.ui-widget-content {
  background: #00dbde;
}

.ui-slider-handle {
  cursor: pointer;
  height: 10px;
  margin-left: -5px;
  top: 2px;
  width: 10px;
  z-index: 2;
}

.volume {
  display: none;
  right: 12px;
  position: absolute;
  top: 35px;
  height: 100px;
  width: 20px;
  box-shadow: 0px 0px 10px #000;
}

.volume .ui-slider-handle {
  display: none;
}
.ui-slider-handle {
  display: none;
}
.playlist {
  list-style-type: none;
  padding-bottom: 10px;
  padding: 15px;
  position: relative;
  width: 100%;
  z-index: 1;
  display: none;
  -webkit-transition: all ease-in-out .1s;
  transition: all ease-in-out .1s;
    max-width: 200px;
    margin: 0 auto;
}

.playlist li {
  color: #000;
  cursor: pointer;
  margin-bottom: 4px;
  padding: 6px 12px;
  -webkit-transition: all ease-in-out .1s;
  transition: all ease-in-out .1s;
}

.playlist li:hover {
  background: #ccc;
}

.playlist li.active {
  font-weight: bold;
  background: #ccc;
}

.show {
  display: block;
}

.ui-state-default,
.ui-widget-content .ui-state-default,
.ui-widget-header .ui-state-default,
.ui-button,
html .ui-button.ui-state-disabled:hover,
html .ui-button.ui-state-disabled:active {
  border: 0;
}

.cr {
  color: #f9f9f9;
  text-align: center;
}
img#alimg {
    width: 45px;
    border-radius: 5px;
    float: left;
}
.rew {
    margin-right: 30px;
}
.fwd {
    margin-left: 30px;
}
#like {
    width: 34px;
    border-radius: 5px;
    float: right;
    margin-top: 5px;
}


<%
	String sno=request.getParameter("sno");

	//앨범 이미지
	
%>
</style>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.0/jquery-ui.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {

	  var song;
	  var tracker = $('.tracker');

	  function initAudio(elem) {
	    var url = elem.attr('audiourl');

	    var title = elem.text();
	    var artist = elem.attr('artist');

	    $('.player .title').text(title);
	    $('.player .artist').text(artist);

	    // song = new Audio('media/'+url);
	    song = new Audio(url);

	    // timeupdate event listener
	    song.addEventListener('timeupdate', function() {
	      var curtime = parseInt(song.currentTime, 10);
	      tracker.slider('value', curtime);
	    });

	    $('.playlist li').removeClass('active');
	    elem.addClass('active');
	  }

	  function playAudio() {
	    song.play();

	    tracker.slider("option", "max", song.duration);

	    $('.play').addClass('hidden');
	    $('.pause').addClass('visible');
	  }

	  function stopAudio() {
	    song.pause();

	    $('.play').removeClass('hidden');
	    $('.pause').removeClass('visible');
	  }

	  // play click
	  $('.play').click(function(e) {
	    e.preventDefault();
	    // playAudio();

	    song.addEventListener('ended', function() {
	      var next = $('.playlist li.active').next();
	      if (next.length == 0) {
	        next = $('.playlist li:first-child');
	      }
	      initAudio(next);

	      song.addEventListener('loadedmetadata', function() {
	        playAudio();
	      });

	    }, false);

	    tracker.slider("option", "max", song.duration);
	    song.play();
	    $('.play').addClass('hidden');
	    $('.pause').addClass('visible');

	  });

	  // pause click
	  $('.pause').click(function(e) {
	    e.preventDefault();
	    stopAudio();
	  });

	  // next track
	  $('.fwd').click(function(e) {
	    e.preventDefault();

	    stopAudio();

	    var next = $('.playlist li.active').next();
	    if (next.length === 0) {
	      next = $('.playlist li:first-child');
	    }
	    initAudio(next);
	    song.addEventListener('loadedmetadata', function() {
	      playAudio();
	    });
	  });

	  // prev track
	  $('.rew').click(function(e) {
	    e.preventDefault();

	    stopAudio();

	    var prev = $('.playlist li.active').prev();
	    if (prev.length === 0) {
	      prev = $('.playlist li:last-child');
	    }
	    initAudio(prev);

	    song.addEventListener('loadedmetadata', function() {
	      playAudio();
	    });
	  });

	  // show playlist
	  $('.playlistIcon').click(function(e) {
	    e.preventDefault();
	    $('.playlist').toggleClass('show');
	  });

	  // playlist elements - click
	  $('.playlist li').click(function() {
	    stopAudio();
	    initAudio($(this));
	  });

	  // initialization - first element in playlist
	  initAudio($('.playlist li:first-child'));



	 

	  // empty tracker slider
	  tracker.slider({

	    range: 'min',
	    min: 0,
	    max: 10,
	    start: function(event, ui) {},
	    slide: function(event, ui) {
	      song.currentTime = ui.value;
	    },
	    stop: function(event, ui) {}
	  });
	  
	  
	  	$('#like').click(function () {
			location.reload();
		});
	});
</script>
</head>
<%

	//플레이 리스트가 널이아니면(로그인되면 메인페이지로 이동후 해당 계정의 번호로 playList컬럼의 스트링을 가져옴)
	SoundTrackDAO dao= new SoundTrackDAO();
	
	int	mNo=0;
	String ltitle="";
	try{
		mNo=(int)session.getAttribute("mNo");
		ltitle=dao.getPL(mNo);
	}catch(SQLException e){
		e.printStackTrace();
	}catch(NullPointerException e){
		e.printStackTrace();
	}
	
	String pList=ltitle;//사용자의 플레이리스트
    String[] pListArr = pList.split("/");
	List<SoundTrackVO> list=null;
	try{
		list=dao.selectBySNo(pListArr);
	}catch(SQLException e){
		e.printStackTrace();
	}
	
%>
<body  style="overflow:hidden;">
<div class="player">
    <img src='../icon/heart.png' alt="playerlike" id='like'>
    <div class="clearfix"></div>
   
   
<div class="controls">
      <div class="rew">
        <i class="fas fa-backward"></i>
      </div>
      <div class="play">
        <svg viewBox="0 0 25 25" xml:space="preserve" style="visibility: visible;">
           <defs><rect x="-49.5" y="-132.9" width="446.4" height="366.4"></rect></defs>
          <g><circle fill="none" cx="12.5" cy="12.5" r="10.8"></circle>
               <path fill-rule="evenodd" clip-rule="evenodd" d="M8.7,6.9V18c0,0,0.2,1.4,1.8,0l8.1-4.8c0,0,1.2-1.1-1-2L9.8,6.5 C9.8,6.5,9.1,6,8.7,6.9z"></path>
          </g>
       </svg>
      </div>
      <div class="pause">
          <svg  viewBox="0 0 25 25" xml:space="preserve" style="visibility: visible;">
            <g>
              <rect x="6" y="4.6" width="2.8" height="13.7"></rect>
              <rect x="12" y="4.6" width="2.8" height="13.7"></rect>
            </g>
          </svg>
      </div>

      <div class="fwd">
        <i class="fas fa-forward"></i>
      </div>
    </div>

	<div class="trackDetails ">
    	<img src='../images/logos/mango_square.jpg' alt="albumImg" id='alimg'>
      <span class="title"></span>
     
      <span class="artist"></span>
    </div>
  </div>
</div>

<ul class="playlist" id="playlist">
 <%for(int i=0;i<list.size();i++){
	SoundTrackVO vo=list.get(i);
	%>
  <li audioURL="../music/<%=vo.getsNo() %>.mp3" artist="<%=vo.getArName() %>"><%=vo.getTitle() %></li>
  <%=vo.getAlNo()%>
<%}%>
</ul>
<!-- <h1>ㅎㅎㅎ</h1> -->
</body>
</html>