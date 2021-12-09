<%@page import="com.mangoMusic.member.model.MemberVO"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.mangoMusic.member.model.MemberService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	//CreateAnAccount.jsp에서 post
	request.setCharacterEncoding("utf-8");
	String name=request.getParameter("name");
	String pwd=request.getParameter("pwd");
	String id=request.getParameter("id");
	String email1=request.getParameter("email1");
	String email2=request.getParameter("email2");
	String email3=request.getParameter("email3");
	String tel=request.getParameter("tel");
	
	String email=email1+"@";
	
	if(email2.equals("etc")){
		email+=email3;
	}else{
		email+=email2;
	}
	
	MemberService service=new MemberService();
	MemberVO vo=new MemberVO();
	vo.setName(name);
	vo.setPwd(pwd);
	vo.setId(id);
	vo.setEmail(email);
	vo.setTel(tel);
	
	try{
		int cnt=service.insertMem(vo);
		System.out.println("계정만듦");
		MemberVO vo2=service.selectById(id);
		System.out.println("mNo:"+vo2.getmNo());
		int cnt2=service.createPL(vo2.getmNo());
		System.out.println("플리만듦");
		
		
	if(cnt>0){ %>
		<script type="text/javascript">
			alert('회원가입되었습니다.');
			location.href="../main.jsp";
		</script>
	<%}else{%>
		<script type="text/javascript">
			alert('회원가입에 실패했습니다.');
			history.back();
		</script>
	<%}
	
	}catch(SQLException e){
		e.printStackTrace();
	}
	
%>
</body>
</html>