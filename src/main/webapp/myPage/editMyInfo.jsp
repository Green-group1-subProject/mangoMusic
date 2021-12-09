<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.mangoMusic.member.model.MemberVO"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.mangoMusic.member.model.MemberService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>
<link href="../css/styles.css" rel="stylesheet" />
<%
	
	MemberService service=new MemberService();
	MemberVO vo=null;
	try{
		 vo=service.selectById(id);
	}catch(SQLException e){
		e.printStackTrace();
	}
	
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
%>
<script type="text/javascript">

$(function(){
	$("#password_suc").hide();
	$("#password_fail").hide();
	var id = $('#id').val().length;
	
	$(".inputPwd").change(function(){
		var pwd=$("#pwd").val();
		var pwd2=$("#pwdCheck").val();
		
		if(pwd!="" && pwd2!=""){
			if(pwd==pwd2){
				$("#password_suc").show();
				$("#password_fail").hide();
			}else{
				$("#password_suc").hide();
				$("#password_fail").show();
			}
		}
	});
	
	$('input[type=submit]').click(function(){
		if($('#pwd').val().length<1){
			alert('비밀번호는 필수 항목입니다');
			$('#pwd').focus();
			return false;
		}else if($('#pwdCheck').val().length<1){
			alert('비밀번호 체크는 필수 항목입니다');
			$('#pwdCheck').focus();
			return false;
		}else if($('#pwd').val()!=$('#pwdCheck').val()){
			alert('비밀번호가 일치하지 않습니다');
			$('#pwdCheck').focus();
			return false;
		}else if(!validate_pwd($('#pwd').val())){
			return false;
		}else if($('#email').val().length<1){
			alert('이메일은 필수 항목입니다');
			$('#email').focus();
			return false;
		}else if($('#tel').val().length<1){
			alert('전화번호는 필수 항목입니다');
			$('#tel').focus();
			return false;
		}else if (!validate_phone($('#tel').val())){
			alert('전화번호엔 번호만 입력할 수 있습니다');
			$('#tel').focus();
			return false;
		}
	});
	
	
	//숫자와 영문자 조합으로 8~16자리를 사용해야 합니다.
	function validate_pwd(pwd){
		var idRegExp = /^[a-zA-z0-9]{8,16}$/; 
		if(!idRegExp.test(pwd)){
			alert('숫자와 영문자 조합으로 8~16자리를 사용해야 합니다.');
			return false;
		}

		var checkNum = pwd.search(/[0-9]/g); // 숫자사용
		var checkEng = pwd.search(/[a-z]/ig); // 영문사용

		if(checkNum <0 || checkEng <0){
			alert("숫자와 영문자를 조합하여야 합니다.");
			return false;
		}
		return true;
		
	}
	
	function validate_phone(tel){
		var pattern = new RegExp(/^[0-9]*$/g);
		return pattern.test(tel);
		/* 0 에서 9사이의 숫자로 시작하거나 끝나야 한다는 의미 
		(^는 시작, $는 끝을 의미) 
		닫기 대괄호(]) 뒤의 * 기호는 0번 이상 반복 */
	}

});
</script>
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
  		<form action="editMyInfo_ok.jsp" id="editAccForm" method="post">
			<label for="name" class="form-label">이름</label>
			<input type="text" id="name" name="name" value="<%=vo.getName() %>" class="form-control" readonly>
			
			<label for="id" class="form-label">아이디</label>
			<input type="text" id="id" name="id" value="<%=id %>" class="form-control" readonly>
			
			<label for="pwd" class="form-label">비밀번호</label><br>
			<input type ="password" id ="pwd" name ="pwd" class="form-control inputPwd">
			<div id="passwordHelpBlock" class="form-text">
				숫자와 영문자 조합으로 8~16자리를 사용해야 합니다.
			</div>
			<label for="pwd_check" class="form-label">비밀번호 확인</label><br>
			<input type ="password" id ="pwdCheck" name ="pwdCheck" class="form-control inputPwd">
			<div id="password_suc" class="form-text" style="color:blue;">
				비밀번호가 일치합니다.
			</div>
			<div id="password_fail" class="form-text" style="color:red;">
				비밀번호가 일치하지 않습니다.
			</div>
			
			<label for="email" class="form-label">이메일</label>
			<input type="text" id="email" name="email" value="<%=vo.getEmail() %>" class="form-control">
			
			<label for="tel" class="form-label">휴대폰</label>
			<input type="text" id="tel" name="tel" value="<%=vo.getTel() %>" class="form-control">
			
			<label for="regdate" class="form-label">가입일</label>
			<input type="text" id="regdate" name="regdate" value="<%=sdf.format(vo.getRegdate()) %>" class="form-control" readonly>
			
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