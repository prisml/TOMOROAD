<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<center>
<br><br><br>
<script type="text/javascript">
	$(document).ready(function(){
		$("#registerForm").submit(function(){
			var a = $("#st :selected").val();
			if(a==""){
				alert("역을 선택해주세요")
				return false;
			}
		});
	});
</script>

<form method="post" action="${pageContext.request.contextPath}/writeBurn.do" id="registerForm">
<table border="1" cellpadding="10">
  <tr>
    <td>제목</td> <td><input type="text" name="title" required></td>
    <td>작성자</td><td><input type="text" name="memberId" value="${mvo.id}" readonly></td>
    <td>역이름</td>
    <td><select name=stationName id="st"><option value="">---------</option><c:forEach items="${station}" var="sname"><option name="${name}">${sname}</option></c:forEach></select></td>
  </tr>
  <tr>
    <td colspan="6"><textarea name="content" placeholder="내용을 입력해주세요" required></textarea></td>
  </tr>
</table>
<input type="submit" value="작성하기">
</form>
</center>