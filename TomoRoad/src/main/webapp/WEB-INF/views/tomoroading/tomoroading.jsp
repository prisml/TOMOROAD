<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
	$(document).ready(function(){
		$("#deleteStation").click(function(){
			$.ajax({
				type : "POST",
				url : "tomoroading/delete.do",
				data : { list : $('input:checkbox:checked').val()},
				success : function(data) {
					$("#stationList").remove();
					for(var i=0;i<data.length;i++){
						var text="<intput type='checkbox' name='station' value='";
						text+=data[i].name;
						text+="'>"+data[i].name+"<br>"
						$("#stationList").append(text);
					}
				}
			});
		});
	});
</script>
<form action="tomoroad/makeRoute.do">
	출발역 <input name="depart" type="text">
	<div id="stationList">
	<c:forEach items="${cart}" var="svo">
		<input type="checkbox" name="station" value="${svo.name }">${svo.name }<br>
	</c:forEach>
	</div>
	<input type="submit" value="투모로딩"> <input id="deleteStation"
		type="button" value="선택삭제">
</form>