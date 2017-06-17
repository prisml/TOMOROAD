<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div><img src = "${pageContext.request.contextPath}/resources/images/train.png"><strong style="font-size : 20px;">나의 여행 루트</strong></div>
<br>
<br>
<%-- <div id = "myStationInfo">
	<c:forEach items="${myStationInfoList}" var="stationList" varStatus="index">
		<span style = "position:relative;">
			<span style = "position:absolute;top:0px;left:20px;"><strong>${stationList.stationInfo}</strong></span>
			<img src = "${pageContext.request.contextPath}/resources/images/stationInfo.png">
		</span>
		<c:if test="${index.last}">
			<img src = "${pageContext.request.contextPath}/resources/images/arrow.png">
		</c:if>
	</c:forEach>
</div> --%>

<div id = "myStationInfo">
 <span style = "position:relative;">
<span style = "position:absolute;top:-2px;left:23px;"><strong>서울역</strong></span>
<img src = "${pageContext.request.contextPath}/resources/images/c.png">
</span>
<img src = "${pageContext.request.contextPath}/resources/images/arrow.png">
<span style = "position:relative;">
<span style = "position:absolute; top:-2px;left:17px;"><strong>여의도역</strong></span>
<img src = "${pageContext.request.contextPath}/resources/images/c.png">
</span>
<img src = "${pageContext.request.contextPath}/resources/images/arrow.png">
<span style = "position:relative;">
<span style = "position:absolute;top:-11px;left:24px;"><strong>&nbsp;여의<br>나무역</strong></span>
<img src = "${pageContext.request.contextPath}/resources/images/c.png">
</span>
<img src = "${pageContext.request.contextPath}/resources/images/arrow.png">
<span style = "position:relative;">
<span style = "position:absolute;top:-11px;left:16px;"><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;여수<br>엑스포역</strong></span>
<img src = "${pageContext.request.contextPath}/resources/images/c.png">
</span>
</div> 