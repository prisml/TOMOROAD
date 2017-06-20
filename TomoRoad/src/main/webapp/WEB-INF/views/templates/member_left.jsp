<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
	function friendRequest(id){
		location.href = "${pageContext.request.contextPath}/friend_Request.do?senderId=${mvo.id}&receiverId="+id;
	}
</script>

<img style="border: 1px solid #dddddd; border-radius: 5px; line-height: 1.428571429; padding: 4px;" width="200" height="200" src = "${memberInfo.profile}"><br>
<p align="center" style = "font-size:25px">${memberInfo.id}(${memberInfo.name})</p>
<!-- 친구면 친구버튼, 아니면 친구신청 버튼 -->
<c:choose>
	<c:when test="${friend eq '수락'}">
		<!-- <input style = color:white; class="btn btn-danger"  type = "text" value = "친구"> -->
		<button style = color:white; class="btn btn-danger">
			<i style = "width:165px" class = "fa fa-user">친구</i>
		</button>
		<button style = "margin-top: 10px; color:white;" class = "btn btn-warning" >
			<i style = "width:165px" class = "fa fa-envelope-o">메세지 보내기</i>
		</button>
	</c:when>
	<c:when test="${friend eq '차단' }">
		<button style = color:white; class="btn btn-danger">
			<i style = "width:165px" class = "fa fa-user">비활성화 계정</i>
		</button>
	</c:when>
	<c:otherwise>
		<button style = color:white; class = "btn btn-danger" onclick="friendRequest('${memberInfo.id}')">
			<i style = "width:165px"class = "fa fa-user-plus">친구신청</i>
		</button> 
		<button style = "margin-top: 10px; color:white;" class = "btn btn-warning" >
			<i style = "width:165px" class = "fa fa-envelope-o">메세지 보내기</i>
		</button>
	</c:otherwise>
</c:choose>
<br>
