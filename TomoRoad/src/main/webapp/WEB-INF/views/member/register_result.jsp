<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
	alert("회원가입 ok!  가입정보 ${requestScope.memberVO }");
	location.href="${pageContext.request.contextPath}/home.do"; // 메인화면으로 이동 
</script>