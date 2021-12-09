<%@page import="com.mangoMusic.member.model.MemberService"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.mangoMusic.member.model.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>
<%
	request.setCharacterEncoding("utf-8");
	String pwd=request.getParameter("pwd");
	
	MemberService service=new MemberService();
	
	try{
		int cnt=service.deleteMem(id, pwd);
		
		if(cnt>0){ %>
		<script type="text/javascript">
			alert('탈퇴되었습니다.');
			location.href="../login/logout.jsp";
		</script>
	<%}else{%>
		<script type="text/javascript">
			alert('탈퇴실패했습니다.');
			history.back();
		</script>
	<%}
	}catch(SQLException e){
		e.printStackTrace();
	}
%>
</body>
</html>