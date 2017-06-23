<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<script type="text/javascript">
function end(){
	location.href = "${pageContext.request.contextPath}/end.do";
}
</script>

<section class = "row counter-parallax sub_content" style="height:180px;">
	<div class = "col-lg-4 col-md-4 col-sm-6 text-center">
		<div class = "count-box">
			<span class = "icon">
				<i class = "fa fa-users "></i>
			</span>
			<p>
				<b class = "timer" data-to="100" data-speed = "10000"><a style = "color:white;" href = "${pageContext.request.contextPath}/mypage/friendList.do">${totalfriend}</a></b>
			</p>
			<span class = "title">나의 친구</span>
		</div>
	</div>
	<div class = "col-lg-4 col-md-4 col-sm-6 text-center">
		<div class = "count-box">
			<span class = "icon">
				<i class = "fa fa-pencil "></i>
			</span>
			<p>
				<b class = "timer" data-to="100" data-speed = "10000"><a style = "color:white;" href = "${pageContext.request.contextPath}/mypage/showListByMember2.do">${totalContents}</a></b>
			</p>
			<span class = "title">내가 작성한 리뷰</span>
		</div>
	</div>
		<div class = "col-lg-4 col-md-4 col-sm-6 text-center">
		<div class = "count-box">
			<span class = "icon">
				<i class = "fa fa-briefcase "></i>
			</span>
			<p>
				<b class = "timer" data-to="100" data-speed = "10000"><a style = "color:white;" href = "${pageContext.request.contextPath}/mypage/myTravelRoute.do">${totalTravel}%</a></b></p>
			<span class = "title">여행지</span>
		</div>
	</div>
</section>
<%-- <c:forEach items="${travelRoute}" var="route">
${route}
</c:forEach> --%>

<div><img src = "${pageContext.request.contextPath}/resources/images/train.png"><strong style="font-size : 20px;">나의 여행 루트</strong></div>
<br>
<div id = "myStationInfo">
	<c:forEach items="${travelRoute}" var="route" varStatus="index">
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
		<c:choose>
			<c:when test="${!index.last}">
				<img src = "${pageContext.request.contextPath}/resources/images/arrow.png">
			</c:when>
			<c:otherwise>
				<br><br>
				<input class = "btn btn-danger" style = "color:white; float:right;" type = "button" value = "여행종료" onclick = "end()">
			</c:otherwise>
		</c:choose>
	</c:forEach>
</div>