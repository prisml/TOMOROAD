<%@page import="org.kosta.tomoroad.model.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:choose>
<c:when test="${sessionScope.mvo==null}">
	<script type="text/javascript">
			alert("탈퇴 고맙습니다!");
			location.href="${pageContext.request.contextPath}/home.do"; 
		</script>
</c:when>
<c:otherwise>
		<script type="text/javascript">
			alert("탈퇴 실패!");
			location.href="${pageContext.request.contextPath}/home.do"; 
		</script>		
</c:otherwise>
</c:choose>