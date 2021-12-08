<%@page import="java.sql.SQLException"%>
<%@page import="com.mangoMusic.member.model.MemberService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/styles.css" rel="stylesheet" />
<script type="text/javascript" src="../js/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css">
<%
	//[1] register.jsp에서 [중복확인] 클릭하면 open()으로 새창열기 => get방식으로 이동
	//[2] checkid.jsp 에서 [아이디확인] 클릭하면 post방식 서브밋
	
	request.setCharacterEncoding("utf-8");
	String id=request.getParameter("id");
	MemberService service=new MemberService();
	int result=0;
	if(id!=null && !id.isEmpty()){
		try{
			result=service.checkId(id);
		}catch(SQLException e){
			e.printStackTrace();
		}
	}else{
		id="";
	}
%>

<script type="text/javascript">
	$(function(){
		$('#id_usable').hide();
		$('#id_unusable').hide();
		
		 var new_id="";
		 var paraId="<%=id%>";
		 
		<% if(id!=null && !id.isEmpty()){ %>
			new_id=paraId;
		<% }else{ %>
			new_id=$(opener.document).find("#id").val();
		<% } %>
			
		$('#id').val(new_id); 
		
		if(<%=result%>==1){
			$('#id_usable').show();
			$('#id_unusable').hide();
		}else if(<%=result %>==2){
			$('#id_usable').hide();
			$('#id_unusable').show();
		}
		
		$('#btnChkId').click(function(){
			if($('#id').val().length<1){
				alert('아이디를 입력하세요');
				$('#id').focus();
				event.preventDefault();
			}
		});
		
		$('#useId').click(function(){
			if(<%=result%>==1){
				$(opener.document).find('#id').val("<%=id%>");
				$(opener.document).find('#chkId').val('Y');
				self.close();
			}else{
				alert('사용할 수 없는 아이디입니다.');
				event.preventDefault();
			}	 
		});
	});
</script>
</head>
<body style="background: #F7F4ED;">
	<div style="width:300px; margin:10px auto;">
		<form id="checkId" method="post">
			<label for="id" class="form-label">아이디</label><br>
			<input type ="text" id ="id" name ="id" class="form-control" value="<%=id %>"
			style="width:70%; display: inline;" >
			<input type="submit" value="중복확인" id="btnChkId" class="btn btn-mango btn-sm text-center">
			<div id="idHelpBlock" class="form-text">
				4~12자/영문 소문자(숫자 조합 가능)
			</div>
		</form>
		
		<div id="id_usable" class="form-text" style="color:blue;">
			사용할 수 있는 아이디입니다.
		</div>
		<div id="id_unusable" class="form-text" style="color:red;">
			이미 존재하는 아이디입니다.
		</div>
		<br>
		<div style="text-align: center;">
		<input type="button" value="사용하기" id="useId" class="btn btn-mango btn-sm text-center" title="사용하기">
		<input type="button" value="닫기" id="exit" class="btn btn-light btn-sm text-center" style="border:1px solid #e4e4e4;" 
			onclick=window.close()>
		</div>
	</div>
</body>
</html>