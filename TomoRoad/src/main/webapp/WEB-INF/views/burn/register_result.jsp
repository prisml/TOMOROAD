<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script>
	$(document).ready(function(){
		$("#list").click(function(){
			location.href="${pageContext.request.contextPath}/getBurnList.do";
		});
	});

</script>
<center>
<br><br><br>

${bvo}

<br>
<input type="button" value="리스트로 가기" id="list">
</center>