<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../js/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css">
<style type="text/css">
	* {
  margin: 0;
  padding: 0;
}

body {
  background-color: #fff;
}

.player {
 top: 93.8vh;
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
  text-align: center;
  border-radius: 4px;
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
}

.title {
  font-size: 14px;
  font-weight: bold;
  color: #333333;
}

.artist {
  font-size: 12px;
  color: #999999;
}

.trackDetails {
    float: left;
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
  height: 40px;
  width: 120px;
  margin: 0 auto;
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
	});
</script>

		
</head>
<body>
