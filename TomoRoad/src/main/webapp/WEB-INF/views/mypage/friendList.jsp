<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<script type="text/javascript">
	function deleteFriend(id){
		location.href = "${pageContext.request.contextPath}/deleteFriend.do?id=${sessionScope.mvo.id}&deleteId="+id;
	}
	function blockFriend(id){
		location.href = "${pageContext.request.contextPath}/mypage/friendList_Block.do?id=${sessionScope.mvo.id}&blockId="+id;
	}
</script>
<table style = "border-spacing: 10px; border-collapse: separate;">
	<c:forEach items="${friendList}" var="list">
		<tr>
			<td>
				<img style="width: 100px; border: 1px solid #dddddd; border-radius: 5px; line-height: 1.428571429; padding: 4px;" width = "125" height="100" src = "${list.PROFILE}">
			</td>
			<td>
    				<a href = "${pageContext.request.contextPath}/memberpage.do?selectId=${list.FRIEND}" style = "font-size:25px">${list.FRIEND}(${list.NAME})</a>
   			</td>
			<td>
				<button style = color:white; class = "btn btn-danger" onclick = "deleteFriend('${list.FRIEND}')">
					<i class = "fa fa-user-times">삭제</i>
				</button>
			</td>
			<td>
				<button style = color:white; class = "btn btn-danger" onclick = "blockFriend('${list.FRIEND}')">
					<i class = "fa fa-times-circle-o">차단</i>
				</button>
			</td>
		</tr>
	</c:forEach>
</table>