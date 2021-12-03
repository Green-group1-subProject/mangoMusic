<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <a href="<%=request.getContextPath()%>/soundTrackm/testmain1.jsp">클릭</a>
	<footer>
		<div class="player">
  <div class="title-wrap">
    <div class="playlistIcon">
      <i class="fa fa-list"></i>
    </div>
    <div class="clearfix"></div>
    <div class="trackDetails ">
      <span class="artist"></span>
     
      <span class="title"></span>
    </div>
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
  </div>
</div>

<ul class="playlist" id="playlist">
  <li audioURL="../music/1.mp3" artist="오브제(Obze)">내가 좋아하는 지구는</li>
  <li audioURL="http://picdn.net/shutterstock/audio/429215/preview/preview.mp3" artist="김두원">바뀌니까 환경이다</li>
  <li audioURL="http://picdn.net/shutterstock/audio/397292/preview/preview.mp3" artist="최강석기시대">지구야 미안해</li>
  <li audioURL="http://picdn.net/shutterstock/audio/423269/preview/preview.mp3" artist="그리니(Greeny)">지구에게 환심사기</li>
  <li audioURL="http://picdn.net/shutterstock/audio/423269/preview/preview.mp3" artist="Project Twenty">초록지구를</li>
  <li audioURL="http://picdn.net/shutterstock/audio/423269/preview/preview.mp3" artist="이효주">green switch</li>
</ul>
	</footer>
</body>
</html>