<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<form method="post" action="registReview.do">
	<input type="text" name="title"> <input type="text"
		name="content"> <select>
		<c:forEach items="${stationList}" var="svo">
			<option>${svo.name }</option>
		</c:forEach>
	</select>
	<input type="submit" value="전송">
</form>