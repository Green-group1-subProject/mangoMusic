<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>

<script type="text/javascript">
	$(function () {
		$('#bt').click(function () {
			location.href='testmain1.jsp';
		});
	});
</script>




<article>
	<h1>main2</h1>
	<input type='button' id='bt'>

</article>


<%@ include file="../inc/bottom.jsp" %>