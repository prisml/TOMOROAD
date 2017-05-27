<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<br><br><br><br>

<center>

<table border="1" cellpadding="15" width="600">
	<tr>
		<td>No</td><td>${bvo.no}</td>  <td>제목</td><td colspan="3">${bvo.title}</td>		
	</tr>
	<tr>
		<td>역이름</td><td>${bvo.stationName}</td>  <td>작성시간</td><td>${bvo.postedTime}</td>
		<td>작성자</td><td>${bvo.memberId}</td>  
	</tr>
	<tr>
		<td colspan="6">${bvo.content}</td>
	</tr>
</table>
<br>

<c:if test="${mvo.id==bvo.memberId}">
<input type="button" value="수정" id="update">
<input type="button" value="삭제" id="delete">
</c:if>
<input type="button" value="목록으로" id="list">

</center>
