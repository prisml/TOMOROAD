<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<br><br>
<h3>수정하기</h3><br>

<form method="post" action="${pageContext.request.contextPath}/updateBurn.do">
<table border="1">
<tr>
	<td>번호 </td><td><input type="text" name="no" value="${bvo.no}" readonly></td>
	<td>제목</td><td><input type="text" name="title" value="${bvo.title}"></td> 
	<td>역이름</td><td><input type="text" name="stationName" value="${bvo.stationName}"></td>
</tr>
<tr>
	<td colspan="5"><textarea name="content">${bvo.content}</textarea></td>
</tr>
</table>
<%-- <input type="hidden" name="memberId" value="${bvo.memberId}">
<input type="hidden" name="postedTime" value="${bvo.postedTime}">
<input type="hidden" name="hits" value="${bvo.hits}"> --%>
<input type="submit" value="수정하기">
</form>