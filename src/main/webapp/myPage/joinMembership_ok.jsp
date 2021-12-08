<%@page import="com.mangoMusic.member.model.MemberService"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.mangoMusic.member.model.MemberVO"%>
<%@page import="com.mangoMusic.member.model.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>
<%
	String membership=request.getParameter("membership");
	MemberService service=new MemberService();
	MemberVO vo=new MemberVO();
	vo.setId(id);
	vo.setMembership(membership);
	
	try{
		int cnt=service.getMembership(vo);
		
		if(cnt>0){ %>
		<script type="text/javascript">
			alert('<%=membership.toUpperCase()%>회원이 되었습니다.');
			location.href="editMyInfo.jsp";
		</script>
	<%}else{%>
		<script type="text/javascript">
			alert('멤버십 가입에 실패했습니다.');
			history.back();
		</script>
	<%}
	
	}catch(SQLException e){
		e.printStackTrace();
	}
	
%>
</body>
</html>