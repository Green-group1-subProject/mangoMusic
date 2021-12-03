<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>
<!-- 왼쪽 사이드바 -->
<div class="row" style="margin-top:103px">
	<div class="col-2"><h2 style="text-align: center;">마이페이지</h2></div>
	<div class="col-3"></div><!-- 그리드 2칸 여백처리(중앙정렬용) -->
	<div class="col-2">
	  	<h1 style="font-weight:bold; color:#212529; text-align: center;">내 정보 수정</h1><br>
	</div>
</div>
<div class="row">
  <div class="col-2">
    <div class="list-group" id="list-tab" role="tablist">
      <a class="list-group-item list-group-item-action active" id="list-home-list" href="editMyInfo.jsp" role="tab">내 정보 수정</a>
      <a class="list-group-item list-group-item-action" id="list-profile-list" href="joinMembership.jsp" role="tab">멤버십 가입</a>
      <a class="list-group-item list-group-item-action" id="list-messages-list" href="deleteMember.jsp" role="tab">회원탈퇴</a>
    </div>
  </div>
  <!-- 왼쪽 사이드바 끝 -->
  
  <!-- 오른쪽 내용 부분 -->
  <div class="col-2">
  </div><!-- 그리드 2칸 여백처리(중앙정렬용) -->
  
  	<div class="col-4 bg-light" style="padding:15px;"><!-- 내용 -->
  		<form>
			<label for="name" class="form-label">이름</label>
			<input type="text" id="name" value="김망고" class="form-control" readonly>
			
			<label for="id" class="form-label">아이디</label>
			<input type="text" id="id" value="example_id" class="form-control" readonly>
			
		    <label for="pwd" class="form-label">비밀번호</label>
			<input type="password" id="pwd" class="form-control">
			<div id="passwordHelpBlock" class="form-text">
			  비밀번호는 8~16자 사이여야 합니다.
			</div>
			
		    <label for="check_pwd" class="form-label">비밀번호 확인</label>
			<input type="password" id="check_pwd" class="form-control" aria-describedby="passwordCheckHelpBlock">
			<div id="passwordCheckHelpBlock" class="form-text-pwck" style="visibility: visible;"> <!-- 비밀번호 확인 visibility 처리해야함 -->
				비밀번호가 일치하지 않습니다.
			</div>
			
			<label for="email" class="form-label">이메일</label>
			<input type="text" id="email" class="form-control">
			
			<label for="tel" class="form-label">휴대폰</label>
			<input type="text" id="tel" class="form-control">
			
			<label for="regdate" class="form-label">가입일</label>
			<input type="text" id="regdate" value="2021-12-01" class="form-control" readonly>
			
			<div style="width:100%; text-align: center;">
				<input type="submit" class="btn btn-mango btn-lg text-center"
				 style="width:200px;margin:30px auto;" value="수정하기">
			</div>
		</form>	
    </div><!-- 내용 끝 -->
  </div>
  <!-- 오른쪽 내용 부분 끝 -->
</body>
</html>