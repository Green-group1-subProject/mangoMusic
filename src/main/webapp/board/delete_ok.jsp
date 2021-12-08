<%@page import="java.sql.SQLException"%>
<%@page import="com.mango.board.model.BoardDAO"%>
<%@page import="com.mango.board.model.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>delete_ok.jsp</title>
</head>
<body>
	<%
	//delete.jsp에서 post방식으로 서브밋됨
	request.setCharacterEncoding("utf-8");

	//1
	String Bno = request.getParameter("bno");

	//2
	BoardDAO dao = new BoardDAO();

	try {
		BoardVO vo = new BoardVO();
		vo.setBno(Integer.parseInt(Bno));

		int cnt = dao.deleteBoard(vo);

		//3
		if (cnt > 0) {
	%>
	<script type="text/javascript">
		alert("글 삭제되었습니다.");
		window.close();
	</script>
	<%
	} else {
	%>
	<script type="text/javascript">
		alert("글 삭제 실패!");
		history.go(-1);
	</script>
	<%
	}
	} catch (SQLException e) {
	e.printStackTrace();
	}
	%>
</body>
</html>