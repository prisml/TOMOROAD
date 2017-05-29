<%@page import="org.kosta.tomoroad.model.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:choose>
<c:when test="${sessionScope.mvo==null}">
	<script type="text/javascript">			
	alert("회원가입 실패!");
	location.href="${pageContext.request.contextPath}/member/register_form.do";
		</script>
</c:when>
<c:otherwise>
		<script type="text/javascript">
		alert("${sessionScope.memberVO.name}님 회원가입 고맙습니다!");
		location.href="${pageContext.request.contextPath}/home.do";
		</script>		
</c:otherwise>
</c:choose>