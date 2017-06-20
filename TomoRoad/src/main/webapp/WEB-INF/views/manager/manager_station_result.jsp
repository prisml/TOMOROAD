<%@page import="org.kosta.tomoroad.model.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
		<script type="text/javascript">
			/*  alert("${mmvo.id} ${mmvo.password} ${mmvo.name} ${mmvo.sex} ${mmvo.tel} ");  */
			location.href="${pageContext.request.contextPath}/getStationListManager.do";
		</script>		
