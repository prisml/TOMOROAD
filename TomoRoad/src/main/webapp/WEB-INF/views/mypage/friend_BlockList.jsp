<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
function FriendUnBlock(id){
	location.href = "${pageContext.request.contextPath}/FriendUnBlock.do?id=${sessionScope.mvo.id}&unBlockId="+id;
}
</script>
<c:forEach items="${friendList}" var="list">
	<img width = "125" height="100" src = "${list.PROFILE}">
	<div class="btn-group">
    <button type="button" class="btn btn-link dropdown-toggle" data-toggle="dropdown">
    <span style = "font-size:25px">${list.FRIEND}(${list.NAME})</span>
    </button>
    <ul class="dropdown-menu" role="menu">
      <li><a href="${pageContext.request.contextPath}/memberpage.do?selectId=${list.FRIEND}">회원페이지로 이동</a></li>
    </ul>
    </div>
	<input style = color:white; class="btn btn-danger" type = "button" value="차단해제" onclick="FriendUnBlock('${list.FRIEND}')"><br><br>
</c:forEach>