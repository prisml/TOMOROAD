<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>

<script type="text/javascript">
	function FriendUnBlock(id){
		location.href = "${pageContext.request.contextPath}/friendUnBlock.do?unBlockId="+id;
	}
</script>
		<div class="dividerHeading">
			<h4>
				<span> 차단 목록 </span>
			</h4>
		</div>
<table style = "border-spacing: 10px; border-collapse: separate;">
	<c:forEach items="${friendList}" var="list">
		<tr>
			<td>	
				<img style="width: 100px; border: 1px solid #dddddd; border-radius: 5px; line-height: 1.428571429; padding: 4px;" width = "125" height="100" width = "125" height="100" src = "${list.PROFILE}">
			</td>
			<td>
    				<a href = "${pageContext.request.contextPath}/memberpage.do?selectId=${list.FRIEND}" style = "font-size:25px">${list.FRIEND}(${list.NAME})</a>
   			 </td>
			<td>
				<input style = color:white; class="btn btn-danger" type = "button" value="차단해제" onclick="FriendUnBlock('${list.FRIEND}')">
			</td>
		</tr>
	</c:forEach>
</table>