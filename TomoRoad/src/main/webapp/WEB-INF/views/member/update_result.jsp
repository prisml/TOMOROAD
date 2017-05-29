<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:choose>
<c:when test="${sessionScope.mvo==null}">
	<script type="text/javascript">
			alert("수정 실패!");
			location.href="${pageContext.request.contextPath}/updateMember.do";
		</script>
</c:when>
<c:otherwise>
		<script type="text/javascript">
			alert("${sessionScope.mvo.id}님 수정 고맙습니다! ${sessionScope.mvo.name} ${sessionScope.mvo.sex} ${sessionScope.mvo.tel}");
			location.href="${pageContext.request.contextPath}/home.do";
		</script>		
</c:otherwise>
</c:choose>