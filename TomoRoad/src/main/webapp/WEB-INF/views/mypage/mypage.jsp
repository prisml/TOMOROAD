<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>
/* $(document).ready(function(){
	$.ajax({
		type:"get",
		url:"${pageContext.request.contextPath}/mypage/myStationInfo.do",
		dataType:"json",
		success:function(data){
			
			for(var i = 0;i<data.length;i++){
				$("#myStationInfo").append("<span style = position:relative;><span style = position:absolute;top:0px;left:20px;><strong>"+data[i]+"</strong></span>");
				if(i<data.length-1){
					$("#myStationInfo").append("<img src = ${pageContext.request.contextPath}/resources/images/stationInfo.png>");
				}else{
					$("#myStationInfo").append("</span>");
				}
			}
		}
	})
}) */

$(document).ready(function(){
 	$("#myStationInfo").append("<span style = position:relative><span style = position:absolute;top:0px;left:20px;><strong>메롱역</strong></span>");
	$("#myStationInfo").append("<img src = ${pageContext.request.contextPath}/resources/images/stationInfo.png>");
	$("#myStationInfo").append("</span>");
})



</script>

<div id = "myStationInfo">
<span style = "position:relative;">
	<span style = "position:absolute;top:0px;left:20px;"><strong>서울역</strong></span>
	<img src = "${pageContext.request.contextPath}/resources/images/stationInfo.png">
</span>
<img src = "${pageContext.request.contextPath}/resources/images/train2.png">
<span style = "position:relative;">
	<span style = "position:absolute; top:0px;left:15px;"><strong>여의도역</strong></span>
	<img src = "${pageContext.request.contextPath}/resources/images/stationInfo.png">
</span>
<img src = "${pageContext.request.contextPath}/resources/images/train2.png">
<span style = "position:relative;">
	<span style = "position:absolute;top:-9px;left:20px;"><strong>&nbsp;여의<br>나무역</strong></span>
	<img src = "${pageContext.request.contextPath}/resources/images/stationInfo.png">
</span>
<img src = "${pageContext.request.contextPath}/resources/images/train2.png">
<span style = "position:relative;">
	<span style = "position:absolute;top:-9px;left:14px;"><strong>&nbsp;&nbsp;&nbsp;&nbsp;여수<br>엑스포역</strong></span>
	<img src = "${pageContext.request.contextPath}/resources/images/stationInfo.png">
</span>
<img src = "${pageContext.request.contextPath}/resources/images/train2.png">
<span style = "position:relative;">
	<span style = "position:absolute;top:-9px;left:14px;"><strong>&nbsp;&nbsp;&nbsp;&nbsp;여수<br>엑스포역</strong></span>
	<img src = "${pageContext.request.contextPath}/resources/images/stationInfo.png">
</span>
<img src = "${pageContext.request.contextPath}/resources/images/train2.png">
</div>