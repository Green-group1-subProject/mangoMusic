<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>
<link href="../css/styles.css" rel="stylesheet" />
<div class="row" style="margin-top:103px">
	<div class="col-2"><h2 style="text-align: center;">마이페이지</h2></div>
	<div class="col-3"></div><!-- 그리드 2칸 여백처리(중앙정렬용) -->
	<div class="col-2">
	  	<h1 style="font-weight:bold; color:#212529; text-align: center;">멤버십 가입</h1><br>
	</div>
</div>
<div class="row">
  <div class="col-2">
    <div class="list-group" id="list-tab" role="tablist">
      <a class="list-group-item list-group-item-action" id="list-home-list" href="editMyInfo.jsp" role="tab">내 정보 수정</a>
      <a class="list-group-item list-group-item-action active" id="list-profile-list" href="joinMembership.jsp" role="tab">멤버십 가입</a>
      <a class="list-group-item list-group-item-action" id="list-messages-list" href="deleteMember.jsp" role="tab">회원탈퇴</a>
    </div>
  </div>
  <!-- 왼쪽 사이드바 끝 -->
  
  <!-- 오른쪽 내용 부분 -->	
  <div class="col-10">
	<section class="pricing py-5">
	  <div class="container">
	    <div class="row">
	      <!-- 스탠다드 Tier -->
	      <div class="col-lg-4">
	        <div class="card mb-5 mb-lg-0">
	          <div class="card-body">
	            <h5 class="card-title text-muted text-uppercase text-center">Standard</h5>
	            <h6 class="card-price text-center">₩5,000원<span class="period">/월</span></h6>
	            <hr>
	            <ul class="fa-ul">
	              <li><span class="fa-li"><i class="fas fa-check"></i></span>월 100회 듣기</li>
	              <li><span class="fa-li"><i class="fas fa-check"></i></span>속기사 강동한과 함께하는 1:1 타자배틀 (대결권) </li>
	              <li><span class="fa-li"><i class="fas fa-check"></i></span>김회중과 함께하는 배틀그라운드 '입벌려라 치킨들어간다' (치킨 이용권) </li>
	            </ul>
	            <div class="d-grid">
	              <a href="joinMembership_ok.jsp?membership=standard" class="btn btn-mango text-uppercase">선택</a>
	            </div>
	          </div>
	        </div>
	      </div>
	      
	      <!-- 프리미엄 Tier -->
	      <div class="col-lg-4">
	        <div class="card mb-5 mb-lg-0">
	          <div class="card-body">
	            <h5 class="card-title text-muted text-uppercase text-center">Premium</h5>
	            <h6 class="card-price text-center">₩12,000원<span class="period">/월</span></h6>
	            <hr>
	            <ul class="fa-ul">
	              <li><span class="fa-li"><i class="fas fa-check"></i></span><strong>무제한 듣기</strong></li>
	              <li><span class="fa-li"><i class="fas fa-check"></i></span>AI(같은 1조 조장의) 음악추천</li>
	              <li><span class="fa-li"><i class="fas fa-check"></i></span>연체인간 김효은과 함께하는 파리푸르나 나바아사나 (요가 체험권)</li>
	              <li><span class="fa-li"><i class="fas fa-check"></i></span>조류독감 박영선과 함께하는 우리나라에는 어느 새들이 살까?(캠핑권) </li>
	              <li><span class="fa-li"><i class="fas fa-check"></i></span>돼지 김명식과 함께하는 오늘점심은 뭐먹지? (점심식사 지명권) </li>
	            </ul>
	            <div class="d-grid">
	              <a href="joinMembership_ok.jsp?membership=premium" class="btn btn-mango text-uppercase">선택</a>
	            </div>
	          </div>
	        </div>
	      </div>
	      </div>
	      </div>
	</section>
	</div>
  </div> 
	<!--container end.//-->
	
</body>
</html>