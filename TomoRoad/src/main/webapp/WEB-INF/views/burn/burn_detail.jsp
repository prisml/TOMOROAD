<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<br><br><br><br>
 <script>
	$(document).ready(function(){
		$("#list").click(function(){
			location.href="${pageContext.request.contextPath}/getBurnList.do";
		});
		
		$("#update").click(function(){
			if(confirm("게시물을 수정하시겠습니까?"))
			location.href="${pageContext.request.contextPath}/updateBurnView.do?no=${bvo.no}";
		});
		
		$("#delete").click(function(){
			if(confirm("게시물을 삭제하시겠습니까?"))
			location.href="${pageContext.request.contextPath}/deleteBurn.do?no=${bvo.no}";
		});		
		
	});
</script>

<center>

<table border="1" cellpadding="15" width="600">
	<tr>
		<td>No</td><td>${bvo.no}</td>  <td>제목</td><td colspan="2">${bvo.title}</td> <td>조회수</td><td>${bvo.hits}</td>		
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
