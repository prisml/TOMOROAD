<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	alert("변경할 프로필사진을 클릭하시길 바랍니다.");
	location.href = "${pageContext.request.contextPath}/mypage/mypage.do?id=${mvo.id}"
</script>
</head>
<body>

</body>
</html>