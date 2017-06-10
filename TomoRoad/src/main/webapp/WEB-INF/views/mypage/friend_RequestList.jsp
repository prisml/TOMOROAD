<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
function requestAccept(id){
	location.href = "${pageContext.request.contextPath}/mypage/friend_Accept.do?senderID="+id+"&receiverID=${mvo.id}";
}
function requestRefuse(id){
	location.href = "${pageContext.request.contextPath}/mypage/friend_Refuse.do?senderID="+id+"&receiverID=${mvo.id}";
}
</script>

<c:forEach items="${friend_RequestList }" var="requestList">
	<img width = "100" height="100" src = "${requestList.PROFILE}"> <span style = "font-size:25px">${requestList.SENDER_ID}(${requestList.NAME})</span>
	<input style = color:white; class="btn btn-danger" type = "button" value = "수락" onclick = "requestAccept('${requestList.SENDER_ID}')">
	<input style = color:white; class="btn btn-danger" type = "button" value = "거절" onclick = "requestRefuse('${requestList.SENDER_ID}')">
	<br><br>
</c:forEach>