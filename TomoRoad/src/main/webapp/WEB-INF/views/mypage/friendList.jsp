<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
function deleteFriend(id){
	location.href = "${pageContext.request.contextPath}/deleteFriend.do?id=${sessionScope.mvo.id}&deleteId="+id;
}
</script>
<c:forEach items="${friendList}" var="list">
	<img width = "50" height="50" src = "${list.PROFILE}"> ${list.FRIEND} 
	<input type = "button" value="삭제" onclick="deleteFriend('${list.FRIEND}')"><br><br>
</c:forEach>