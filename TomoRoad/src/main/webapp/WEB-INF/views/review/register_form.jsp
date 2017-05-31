<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<form method="post" action="${pageContext.request.contextPath}/review/register.do">
	제목 : <input type="text" name="title"><br>
	장소 :
	<select name="placeNo">
		<c:forEach items="${placeList}" var="pvo">
			<option value="${pvo.no }">${pvo.name }</option>
		</c:forEach>
	</select><br>
	내용 : <textarea rows="10" cols="50" name="content"></textarea><br>
	<input type="submit" value="등록">
</form>