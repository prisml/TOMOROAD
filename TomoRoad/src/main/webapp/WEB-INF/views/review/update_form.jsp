<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	
<form method="post" action="${pageContext.request.contextPath}/review/update.do">
	<input type="hidden" value="${rvo.no }" name="no">
	<input type="hidden" value="${rvo.place.no }" name="placeNo">
	제목 : <input type="text" name="title" value="${rvo.title }"><br>
	장소 : ${rvo.place.name }<br>
	내용 : <textarea rows="10" cols="50" name="content">${rvo.content }</textarea><br>
	<input type="submit" value="수정">
</form>