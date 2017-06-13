<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>

  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


<script type="text/javascript">
function deleteFriend(id){
	location.href = "${pageContext.request.contextPath}/deleteFriend.do?id=${sessionScope.mvo.id}&deleteId="+id;
}
function blockFriend(id){
	location.href = "${pageContext.request.contextPath}/mypage/friendList_Block.do?id=${sessionScope.mvo.id}&blockId="+id;
}
</script>

<c:forEach items="${friendList}" var="list">
	<img width = "125" height="100" src = "${list.PROFILE}">
	<div class="btn-group">
    <button type="button" class="btn btn-link dropdown-toggle" data-toggle="dropdown">
    <span style = "font-size:25px">${list.FRIEND}(${list.NAME})</span>
    </button>
    <ul class="dropdown-menu" role="menu">
      <li><a href="${pageContext.request.contextPath}/member/memberpage.do?id=${mvo.id}&selectId=${list.FRIEND}">친구페이지로 이동</a></li>
    </ul>
    </div>
	<input style = color:white; class="btn btn-danger" type = "button" value="삭제" onclick="deleteFriend('${list.FRIEND}')">
	<input style = color:white; class="btn btn-danger" type = "button" value="차단" onclick="blockFriend('${list.FRIEND}')"><br><br>
</c:forEach>

