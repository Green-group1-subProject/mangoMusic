<%@page import="java.sql.Timestamp"%>
<%@page import="com.mango.board.model.BoardDAO"%>
<%@page import="com.mango.board.model.BoardVO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.util.List"%>
<%@page import="com.mango.board.model.BoardDAO"%>
<%@page import="com.mango.board.model.BoardVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
//edit.jsp에서 post방식으로 서브밋됨
request.setCharacterEncoding("utf-8");

//1
String btitle = request.getParameter("btitle");
String content = request.getParameter("content");
String bno = request.getParameter("bno");

//2
BoardDAO dao = new BoardDAO();

try {
	BoardVO vo = new BoardVO();
	vo.setContent(content);
	vo.setBno(Integer.parseInt(bno));
	vo.setBtitle(btitle);

	int cnt = dao.updateBoard(vo);

	//3
	if (cnt > 0) {
%>
<script type="text/javascript">
				alert("글 수정되었습니다.");
				location.href="detail.jsp?bno=<%=bno%>
	";
</script>
<%
} else {
%>
<script type="text/javascript">
	alert("글 수정 실패!");
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
