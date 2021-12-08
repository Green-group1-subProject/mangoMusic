<%@page import="java.sql.SQLException"%>
<%@page import="com.mangoMusic.member.model.MemberVO"%>
<%@page import="org.eclipse.jdt.internal.compiler.ast.MemberValuePair"%>
<%@page import="com.mangoMusic.member.model.MemberService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>
<%
//CreateAnAccount.jsp에서 post
	request.setCharacterEncoding("utf-8");
	String pwd=request.getParameter("pwd");
	String email=request.getParameter("email");
	String tel=request.getParameter("tel");
	
	MemberService service=new MemberService();
	MemberVO vo=new MemberVO();
	vo.setPwd(pwd);
	vo.setId(id);
	vo.setEmail(email);
	vo.setTel(tel);
	
	try{
			int cnt=service.updateMem(vo);
		if(cnt>0){ %>
			<script type="text/javascript">
				alert('수정되었습니다.');
				location.href="editMyInfo.jsp";
			</script>
		<%}else{%>
			<script type="text/javascript">
				alert('수정실패했습니다.');
				history.back();
			</script>
		<%}
		
	}catch(SQLException e){
		e.printStackTrace();
	}
%>
</body>
</html>