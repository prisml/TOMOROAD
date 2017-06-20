<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
				<b class = "timer" data-to="100" data-speed = "10000"><a style = "color:white;" href = "#">100</a></b>%</p>
			<span class = "title">여행지</span>
		</div>
	</div>
</section>

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
<span style = "position:absolute;top:-2px;left:23px;"><strong>용산역</strong></span>
<img src = "${pageContext.request.contextPath}/resources/images/c.png">
</span>
<img src = "${pageContext.request.contextPath}/resources/images/arrow.png">
 <span style = "position:relative;">
<span style = "position:absolute;top:-2px;left:23px;"><strong>천안역</strong></span>
<img src = "${pageContext.request.contextPath}/resources/images/c.png">
</span>
<img src = "${pageContext.request.contextPath}/resources/images/arrow.png">
<span style = "position:relative;">
<span style = "position:absolute;top:-11px;left:16px;"><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;여수<br>엑스포역</strong></span>
<img src = "${pageContext.request.contextPath}/resources/images/c.png">
</span>
<img src = "${pageContext.request.contextPath}/resources/images/arrow.png">
<span style = "position:relative;">
<span style = "position:absolute;top:-2px;left:23px;"><strong>서울역</strong></span>
<img src = "${pageContext.request.contextPath}/resources/images/c.png">
</span>
<%-- <span style = "position:relative;">
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
</span> --%>
</div> 