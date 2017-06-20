<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!--   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> -->

<script type="text/javascript">
	function requestAccept(id){
		location.href = "${pageContext.request.contextPath}/mypage/friend_Accept.do?senderID="+id+"&receiverID=${mvo.id}";
	}
	function requestRefuse(id){
		location.href = "${pageContext.request.contextPath}/mypage/friend_Refuse.do?senderID="+id+"&receiverID=${mvo.id}";
	}
	function requestBlock(id){
		location.href = "${pageContext.request.contextPath}/mypage/friend_RequestList_Block.do?id=${mvo.id}&blockId="+id;
	}
</script>
		<div class="dividerHeading">
			<h4>
				<span> 친구요청 목록 </span>
			</h4>
		</div>
<table style = "border-spacing: 10px; border-collapse: separate;">
	<c:forEach items="${friend_RequestList }" var="requestList">
		<tr>
			<td>
				<img style="width: 100px; border: 1px solid #dddddd; border-radius: 5px; line-height: 1.428571429; padding: 4px;" width = "125" height="100" width = "100" height="100" src = "${requestList.PROFILE}"> 	
			</td>
			<td>
    					<a href ="${pageContext.request.contextPath}/memberpage.do?selectId=${requestList.SENDER_ID}"  style = "font-size:25px">${requestList.SENDER_ID}(${requestList.NAME})</a>
    		</td>
			<td>
				<button style = color:white; class = "btn btn-danger" onclick="requestAccept('${requestList.SENDER_ID}')">
					<i class = "fa fa-user-plus">수락</i>
				</button> 
			</td>
			<td>
				<button style = color:white; class = "btn btn-danger" onclick = "requestRefuse('${requestList.SENDER_ID}')">
					<i class = "fa fa-user-times">거절</i>
				</button>
			</td>
			<td>
				<button style = color:white; class = "btn btn-danger" onclick = "requestBlock('${requestList.SENDER_ID}')">
					<i class = "fa fa-times-circle-o">차단</i>
				</button>
			</td>
		</tr>
	</c:forEach>
</table>