<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
	if(confirm("여행이 시작되었습니다! 마이페이지로 이동하시겠습니까?")==true){
		location.href="${pageContext.request.contextPath}/mypage/mypage.do";
	}else{
		alert("홈으로 이동합니다!");
		location.href="${pageContext.request.contextPath}/home.do";
	}
</script>