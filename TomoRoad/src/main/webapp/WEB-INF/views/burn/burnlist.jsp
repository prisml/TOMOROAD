<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
번리스트
<c:forEach items="${lvo.list}" var="burn">
	${burn.title}
</c:forEach>