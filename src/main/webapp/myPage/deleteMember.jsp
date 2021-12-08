<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>
<div class="row" style="margin-top:103px; height:80px">
	<div class="col-2"><h2 style="text-align: center;">마이페이지</h2></div>
	<div class="col-3"></div><!-- 그리드 2칸 여백처리(중앙정렬용) -->
	<div class="col-2">
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
	  <div class="col-3"></div>
	  <div class="col-2 bg-light" style="padding:15px;">
	  	<form action="deleteMember_ok.jsp" id="deleteAccForm" method="post">
	  		<div class="mb-3">
	  			<div style="text-align: center; margin-top:10px;">
		  			<b >정말 탈퇴하시겠습니까?</b><br>
	  			</div>
			  <label for="formGroupExampleInput" class="form-label">아이디</label>
			  <input type="text" class="form-control" name="id" id="formGroupExampleInput" value="<%=id %>" readonly>
			  <label for="formGroupExampleInput" class="form-label">비밀번호 입력</label>
			  <input type="password" class="form-control" name="pwd" id="formGroupExampleInput" >
			</div>
			
			<div style="width:100%; text-align: center;">
				<input type="submit" class="btn btn-mango btn-lg text-center"
					 style="width:150px;margin:30px auto;" value="탈퇴하기">
			</div>
	  	</form>
	  </div>
</div>
</body>
</html>