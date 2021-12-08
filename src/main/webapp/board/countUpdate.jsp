<%@page import="java.sql.SQLException"%>
<%@page import="com.mango.board.model.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>countUpdate.jsp</title>
</head>
<body>
	<%
	//list.jsp에서 [제목]클릭하면 get방식으로 이동
	//=> http://localhost:9090/herbmall/board/countUpdate.jsp?no=5
	//1
	String bno = request.getParameter("bno");

	//2
	BoardDAO dao = new BoardDAO();
	try {
		int cnt = dao.updateReadCount(Integer.parseInt(bno));

		//3
		if (cnt > 0) {
			response.sendRedirect("detail.jsp?bno=" + bno);
		} else {
	%>
	<script type="text/javascript">
		alert('조회수 증가 실패!');
		history.back();
	</script>
	<%
	}
	} catch (SQLException e) {
	e.printStackTrace();
	}
	%>
</body>
</html>






