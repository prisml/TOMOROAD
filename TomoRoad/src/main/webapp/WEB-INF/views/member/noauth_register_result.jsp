<%@page import="org.kosta.tomoroad.model.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
		<script type="text/javascript">
		alert("${mvo.name}님 회원가입 고맙습니다!");
		location.href="${pageContext.request.contextPath}/home.do";
		</script>		