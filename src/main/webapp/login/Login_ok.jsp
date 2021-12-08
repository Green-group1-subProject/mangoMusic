<%@page import="com.mangoMusic.member.model.MemberVO"%>
<%@page import="com.mangoMusic.member.model.MemberService"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="memServie" class ="com.mangoMusic.member.model.MemberService"
scope ="session"></jsp:useBean>
<%
	//login.jsp에서 post방식으로 서브밋 
	//1
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	
	String msg ="로그인 처리 실패", url ="Login.jsp";
	try{
		int result = memServie.loginCheck(id, pwd);
		if(result==MemberService.LOGIN_OK){
			MemberVO vo = memServie.selectById(id);
			
			session.setAttribute("id", id);
			session.setAttribute("name", vo.getName());
			
			msg = vo.getName()+"님 환영합니다";
			url ="../soundTrackm/index.jsp";
			// Main페이지 jsp *************테스트임 수정해야함
		}else if(result ==MemberService.DISAGREE_PWD){
			msg ="비밀번호가 일치하지 않습니다";
		}else if (result == MemberService.USERID_NONE ){
			msg ="아이디가 존재하지 않습니다";
		}
		
		
	}catch(SQLException e){
		e.printStackTrace();
	}
	
	request.setAttribute("msg", msg);
	request.setAttribute("url", url);
%>
<jsp:forward page="../common/message.jsp"></jsp:forward>

</body>
</html>