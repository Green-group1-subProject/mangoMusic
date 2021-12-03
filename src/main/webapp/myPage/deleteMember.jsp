<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>
<div class="row" style="margin-top:103px">
	<div class="col-2"><h2 style="text-align: center;">마이페이지</h2></div>
	<div class="col-3"></div><!-- 그리드 2칸 여백처리(중앙정렬용) -->
	<div class="col-2">
	  	<h1 style="font-weight:bold; color:#212529; text-align: center;">회원탈퇴</h1><br>
	</div>
</div>
<div class="row">
	  <div class="col-2">
	    <div class="list-group" id="list-tab" role="tablist">
      <a class="list-group-item list-group-item-action" id="list-home-list" href="editMyInfo.jsp" role="tab">내 정보 수정</a>
      <a class="list-group-item list-group-item-action" id="list-profile-list" href="joinMembership.jsp" role="tab">멤버십 가입</a>
      <a class="list-group-item list-group-item-action active" id="list-messages-list" href="deleteMember.jsp" role="tab">회원탈퇴</a>
	    </div>
	  </div>
	  <div class="col-10">
	  
	  	
	  </div>
</div>
</body>
</html>