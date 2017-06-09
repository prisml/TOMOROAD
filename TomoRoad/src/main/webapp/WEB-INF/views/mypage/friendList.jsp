<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
function deleteFriend(id){
	location.href = "${pageContext.request.contextPath}/deleteFriend.do?id=${sessionScope.mvo.id}&deleteId="+id;
}
</script>
<c:forEach items="${friendList}" var="list">
	<img width = "125" height="100" src = "${list.PROFILE}"> <span style = "font-size:25px">${list.FRIEND}(${list.NAME})</span>
	<input style = color:white; class="btn btn-small btn-default"  type = "button" value="삭제" onclick="deleteFriend('${list.FRIEND}')"><br><br>
</c:forEach>