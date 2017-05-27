<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<center>
<br><br><br><br>
<table border="1" cellpadding="15">
  <tr>
    <th>번호</th>
    <th>제목</th>
    <th>역이름</th>
    <th>작성자</th>
    <th>작성시간</th>
  </tr>
  <c:forEach items="${lvo.list}" var="burn">
  	<tr align="center">
	<td>${burn.no}</td>
	<td>${burn.title}</td>
	<td>${burn.stationName}</td>
	<td>${burn.memberId}</td>
	<td>${burn.postedTime}</td>
	</tr>
	</c:forEach>  
</table>


<c:set value="${lvo.pagingBean}" var="pb"/>

<c:if test="${pb.previousPageGroup}">
	<a href="${pageContext.request.contextPath}/getBurnList.do?pageNo=${pb.startPageOfPageGroup-1}">
	◀
	</a>
</c:if>

<c:forEach begin="${pb.startPageOfPageGroup}" end="${pb.endPageOfPageGroup}" var="page">
	<c:choose>
		<c:when test="${pb.nowPage!=page}">
			<a href="${pageContext.request.contextPath}/getBurnList.do?pageNo=${page}">${page}</a> 
		</c:when>
		<c:otherwise>
			${page}
		</c:otherwise>
	</c:choose>
</c:forEach>

<c:if test="${pb.nextPageGroup}">
	<a href="${pageContext.request.contextPath}/getBurnList.do?pageNo=${pb.endPageOfPageGroup+1}">
	▶
	</a>
</c:if>


</center>

