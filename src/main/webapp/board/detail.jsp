<%@page import="java.sql.SQLException"%>
<%@page import="com.mango.board.model.BoardVO"%>
<%@page import="com.mango.board.model.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
	//countUpdate.jsp에서 조회수 증가 성공하면 get방식으로 이동
	//=> http://localhost:9090/herbmall/board/detail.jsp?no=3
	//1
	String bno=request.getParameter("bno");
	if(bno==null || bno.isEmpty()){ %>
<script type="text/javascript">
			alert("잘못된 url입니다.");
			location.href="list.jsp";
		</script>
<%	return;
	}
	
	//2
	BoardDAO dao = new BoardDAO();
	
	BoardVO vo=null;
	try{
		vo=dao.selectByNo(Integer.parseInt(bno));
	}catch(SQLException e){
		e.printStackTrace();
	}
	
	//3
	String content=vo.getContent();
	if(content!=null){  
		content=content.replace("\r\n", "<br>");
	}else{
		content="";
	}
%>


<!DOCTYPE HTML>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>질문게시판 상세보기</title>

<script>
   $(function (){
      $('#editemail').hide();
      $('#email_edit').click(function(){
         $('#editemail').slideToggle('slow');
      });
   });
   
</script>
<style type="text/css">
body {
	padding: 5px;
	margin: 5px;
}

.divForm {
	width: 500px;
}
</style>
</head>
<body>
	<h2>글 상세보기</h2>
	<div class="divForm">
		<div class="p_input">
			<span class="sp1">제목</span> <span><%=vo.getBtitle() %></span>
		</div>
		<div>
			<span class="sp1">제목</span> <span><%=vo.getMno() %></span>
		</div>
		<div>
			<span class="sp1">등록일</span> <span><%=vo.getBdate() %></span>

		</div>
		<div>
			<span class="sp1">조회수</span> <span><%=vo.getBcount() %></span>
		</div>

		<div class="lastDiv">
			<p class="content"><%=content %></p>
		</div>
		<div class="center">
			<a href='edit.jsp?bno=<%=bno%>'>수정</a> | <a
				href='delete.jsp?bno=<%=bno%>'>삭제</a> | <a href='list.jsp'>목록</a>
		</div>
	</div>

	<!-- 

 <div class="p_input">
      <input id="email" type="email" name="email" 
               id="" class="t_input" placeholder="<%-- <%=vo.getEmail() %> --%>" required="required">
                      <span class="invalidText"></span>
                      <button type="button" class="mint_btn hover" 
                      id="email_edit" >이메일 변경</button>
                  </div>
              </div>
              <div class="input_area" id="editemail"><div class="p_title">
                      <label>이메일 변경</label>
                  </div>
                  <div class="p_input">
                      <input id="email" type="email" name="email" class="t_input" placeholder="<%-- <%=vo.getEmail() %> --%>" required="required">
                      <button type="button" class="mint_btn hover" >확인</button>
                  </div>
              </div>
 -->


</body>


</html>