<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<div class="dividerHeading">
	<h4><span>다녀온 여행지</span></h4>
</div><br>
<c:forEach items="${travelRoute}" var="parent_list">
	<div id = "myStationInfo">
		<c:forEach items="${parent_list}" var="route" varStatus="index">
			<span style = "position:relative;">
				<c:choose>
					<c:when test="${fn:length(route) == 4}">
						<span style = "position:absolute; top:-2px;left:9px;"><strong>${route}</strong></span>
						<img src = "${pageContext.request.contextPath}/resources/images/stationInfo.png">
					</c:when>
					<c:when test="${fn:length(route) == 5}">
						<span style = "position:absolute;top:-15px;left:18px;"><strong style = "font-size: 15px;">&nbsp;&nbsp;${fn:substring(route,0,2)}<br>${fn:substring(route,2,5)}</strong></span>
						<img src = "${pageContext.request.contextPath}/resources/images/stationInfo.png">
					</c:when>
					<c:when test="${fn:length(route) == 6}">
						<span style = "position:absolute;top:-17px;left:12px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong style = "font-size: 14px;">${fn:substring(route,0,2)}<br>${fn:substring(route,2,6)}</strong></span>
						<img src = "${pageContext.request.contextPath}/resources/images/stationInfo.png">
					</c:when>		
					<c:otherwise>
						<span style = "position:absolute;top:0px;left:19px;"><strong>${route}</strong></span>
						<img src = "${pageContext.request.contextPath}/resources/images/stationInfo.png">
					</c:otherwise>
				</c:choose>
			</span>
				<c:if test="${!index.last}">
					<img src = "${pageContext.request.contextPath}/resources/images/arrow.png">
				</c:if>
		</c:forEach>
	</div>
	<hr>
</c:forEach>