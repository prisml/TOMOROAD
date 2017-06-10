<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script type="text/javascript">
function requestAccept(id){
	location.href = "${pageContext.request.contextPath}/mypage/friend_Accept.do?senderID="+id+"&receiverID=${mvo.id}";
}
function requestRefuse(id){
	location.href = "${pageContext.request.contextPath}/mypage/friend_Refuse.do?senderID="+id+"&receiverID=${mvo.id}";
}
</script>

<c:forEach items="${friend_RequestList }" var="requestList">
	<img width = "100" height="100" src = "${requestList.PROFILE}"> 	
	<div class="btn-group">
    <button type="button" class="btn btn-link dropdown-toggle" data-toggle="dropdown">
    <span style = "font-size:25px">${requestList.SENDER_ID}(${requestList.NAME})</span>
    </button>
    <ul class="dropdown-menu" role="menu">
      <li><a href="#">친구페이지로 이동</a></li>
    </ul>
    </div>
	<input style = color:white; class="btn btn-danger" type = "button" value = "수락" onclick = "requestAccept('${requestList.SENDER_ID}')">
	<input style = color:white; class="btn btn-danger" type = "button" value = "거절" onclick = "requestRefuse('${requestList.SENDER_ID}')">
	<br><br>
</c:forEach>