<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
function friendRequest(id){
	location.href = "${pageContext.request.contextPath}/friend_Request.do?senderId=${mvo.id}&receiverId="+id;
}
</script>
아이디 : ${memberInfo.id}<br>
이   름 : ${memberInfo.name}<br>
<img width="200" height="200" src = "${memberInfo.profile}"><br><br>

<!-- 친구면은 친구버튼, 아니면 친구신청 버튼 -->
<c:choose>
	<c:when test="${friend != null}">
		<input style = color:white; class="btn btn-danger"  type = "text" value = "친구">
	</c:when>
	<c:otherwise>
		<input style = color:white; class="btn btn-danger" type = "button" value="친구신청" onclick="friendRequest('${memberInfo.id}')">
	</c:otherwise>
</c:choose>