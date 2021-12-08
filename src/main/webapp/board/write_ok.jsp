<%@page import="com.mango.board.model.BoardVO"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.mango.board.model.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>write_ok.jsp</title>
</head>
<body>
	<%
	//write.jsp에서 post방식으로 서브밋됨
	//post- 요청 파라미터에 대한 한글 인코딩 처리
	request.setCharacterEncoding("utf-8");

	//1. 요청 파라미터 읽어오기
	String Btitle = request.getParameter("btitle");
	String mNo = request.getParameter("mNo");
	/*	String bNo=request.getParameter("bno"); */
	/* String bCount=request.getParameter("bCount"); */
	String content = request.getParameter("content");

	//ip 읽어오기
	String ip = request.getRemoteAddr();
	String ip2 = request.getRemoteHost();
	System.out.println("ip=" + ip + ", ip2=" + ip2);

	//2. db작업
	BoardDAO dao = new BoardDAO();

	try {
		BoardVO vo = new BoardVO();
		vo.setContent(content);
		/* 	vo.setBno(Integer.parseInt(bNo)); */
		/* 	 	vo.setMno(Integer.parseInt(mNo));  */
		vo.setBtitle(Btitle);
		int cnt = dao.insertBoard(vo);

		//3. 결과 처리  
		if (cnt > 0) {
	%>
	<script type="text/javascript">
		alert("글쓰기 처리되었습니다.");
		window.close();
	</script>
	<%
	} else {
	%>
	<script type="text/javascript">
		alert("글쓰기 실패!");
		history.back();
	</script>
	<%
	} //if
	} catch (SQLException e) {
	e.printStackTrace();
	}
	%>

</body>
</html>




