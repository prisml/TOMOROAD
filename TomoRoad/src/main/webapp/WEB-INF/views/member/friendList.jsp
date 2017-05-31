<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<c:forEach items="${friendList }" var="list">
	${list} <input type = "button" value="삭제"><br>
</c:forEach>