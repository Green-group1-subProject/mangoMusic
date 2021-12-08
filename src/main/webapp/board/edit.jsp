<%@page import="java.sql.SQLException"%>
<%@page import="com.mango.board.model.BoardVO"%>
<%@page import="com.mango.board.model.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>음악자유게시판</title>
<meta charset="utf-8">
<link rel="stylesheet" type="text/css" href="../css/mainstyle.css" />
<link rel="stylesheet" type="text/css" href="../css/clear.css" />
<link rel="stylesheet" type="text/css" href="../css/formLayout.css" />
<link rel="stylesheet" type="text/css" href="../css/mystyle.css" />
<%
//detail.jsp에서 [수정]링크 클릭하면 get방식으로 이동
//1
String bno = request.getParameter("bno");

if (bno == null || bno.isEmpty()) {
%>
<script type="text/javascript">
	alert("잘못된 url입니다.");
	location.href = "list.jsp";
</script>

<%
return;
}

//2
BoardDAO dao = new BoardDAO();

BoardVO vo = null;
try {
vo = dao.selectByNo(Integer.parseInt(bno));
} catch (SQLException e) {
e.printStackTrace();
}

String btitle = vo.getBtitle();
String content = vo.getContent();

if (btitle == null)
btitle = "";
if (content == null)
content = "";
%>

<script type="text/javascript">
	
</script>

</head>
<body>
	<div class="divForm">
		<form name="frmEdit" method="post" action="edit_ok.jsp">
			<!-- 수정시 no가 필요하므로 히든 필드에 담아서 넘겨준다 -->
			<input type="hidden" name="bno" value="<%=bno%>">
			<fieldset>
				<legend>글수정</legend>
				<div class="firstDiv">
					<label for="btitle">제목</label> <input type="text" id="btitle"
						name="btitle" value="<%=vo.getBtitle()%>" />
				</div>
				<div>
					<label for="content">내용</label>
					<textarea id="content" name="content" rows="12" cols="40"><%=content%></textarea>
				</div>
				<div class="center">
					<input type="submit" value="수정" /> <input type="Button"
						value="글목록" onclick="location.href	='list.jsp'" />
				</div>
			</fieldset>
		</form>
	</div>

</body>
</html>