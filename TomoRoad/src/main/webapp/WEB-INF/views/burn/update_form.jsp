<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<br><br>
<script type="text/javascript">
	$(document).ready(function(){
		$("#updateForm").submit(function(){
			var a = $("#st :selected").val();
			if(a==""){
				alert("역을 선택해주세요")
				return false;
			}
		});
	});
</script>
<h3>수정하기</h3><br>

<form method="post" action="${pageContext.request.contextPath}/updateBurn.do" id="updateForm">
<table border="1">
<tr>
	<td>번호 </td><td><input type="text" name="no" value="${bvo.no}" readonly></td>
	<td>제목</td><td><input type="text" name="title" value="${bvo.title}" required></td> 
	<td>역이름</td><td><select name=stationName id="st"><option value="">---------</option><c:forEach items="${station}" var="sname"><option name="${name}">${sname}</option></c:forEach></select></td>
</tr>
<tr>
	<td colspan="5"><textarea name="content" required>${bvo.content}</textarea></td>
</tr>
</table>
<%-- <input type="hidden" name="memberId" value="${bvo.memberId}">
<input type="hidden" name="postedTime" value="${bvo.postedTime}">
<input type="hidden" name="hits" value="${bvo.hits}"> --%>
<input type="submit" value="수정하기">
</form>