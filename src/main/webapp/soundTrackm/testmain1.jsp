<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>

<script type="text/javascript">
	$(function () {
		$('#bt').click(function () {
			location.href='testmain2.jsp';
		});
	});
</script>




<article>
	<h1>main1</h1>
	<input type='button' id='bt' value='이동'>

</article>


<%@ include file="../inc/bottom.jsp" %>