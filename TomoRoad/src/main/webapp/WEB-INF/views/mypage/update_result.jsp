<%@page import="org.kosta.tomoroad.model.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
		<script type="text/javascript">
			alert("${mvo.name}님 수정 고맙습니다!╹◡╹)ﾉ ${mvo.id} ${mvo.sex} ${mvo.tel} 입니다");
			location.href="${pageContext.request.contextPath}/mypage/mypage.do?id=${mvo.id}";
		</script>		
