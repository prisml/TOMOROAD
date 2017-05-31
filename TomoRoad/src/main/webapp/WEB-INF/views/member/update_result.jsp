<%@page import="org.kosta.tomoroad.model.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
		<script type="text/javascript">
			alert("${sessionScope.mvo.name}님 수정 고맙습니다! ${sessionScope.mvo.id} ${sessionScope.mvo.sex} ${sessionScope.mvo.tel}");
			location.href="${pageContext.request.contextPath}/home.do";
		</script>		
