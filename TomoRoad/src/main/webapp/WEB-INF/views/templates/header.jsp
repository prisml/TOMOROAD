<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script type="text/javascript">
	function reqeustList() {
		location.href = "${pageContext.request.contextPath}/mypage/friend_RequestList.do";
	}

	$(document)
			.ready(
					function() {
						$
								.ajax({
									type : "get",
									url : "${pageContext.request.contextPath}/noauth_friend_RequestInfo.do",
									success : function(data) {
										if (data != 0) {
											$("#requestFriend")
													.html(
															"<input height = 35 width = 35 type = image src = ${pageContext.request.contextPath}/resources/images/99-1.png onclick = reqeustList()> ");
											$("#bubble").append(
													"<span id = requestCount style = 'position: absolute; top:5px; left:13px;'>"
															+ data + "</span>");
											$("#bubble")
													.append(
															"<img height = 35 width = 35  src = ${pageContext.request.contextPath}/resources/images/bubble.png>");
										}
									}
								})
					})
</script>
<style>
</style>
<header id="header">

	<div class="navbar navbar-default navbar-static-top">
		<ul class="nav navbar-nav">
			<li></li>

			<li><a href="${pageContext.request.contextPath}/home.do"> <img
					src="${pageContext.request.contextPath}/resources/images/logo.png"
					style="height: 40px; margin-top: -10px;" />
			</a></li>
			<li><a
				href="${pageContext.request.contextPath}/bucket/bucketList.do?id=${mvo.id}">여행바구니</a>
			</li>

			<li><a
				href="${pageContext.request.contextPath}/getBurnListByStation.do?stationName=all">
					번개시판 </a></li>

			<li><a
				href="${pageContext.request.contextPath}/review/noauth_showList.do">
<<<<<<< HEAD
					여행일기 </a></li>
=======
					REVIEW </a></li>

			<li>
			<c:choose>
				<c:when test="${sessionScope.mvo != null }">
					<a href="${pageContext.request.contextPath}/mypage/mypage.do">
					MYPAGE </a>
				</c:when>
				<c:otherwise>
					<a href="${pageContext.request.contextPath}/getMemberList.do">
					MYPAGE </a>
				</c:otherwise>
			</c:choose>
			</li>
>>>>>>> branch 'master' of https://github.com/prisml/TOMOROAD.git

			<li><a
				href="${pageContext.request.contextPath}/station/getTourInfoData.do">
					여행정보 </a></li>
			<c:choose>
				<c:when test="${!empty sessionScope.mvo}">
					<li><a
						href="${pageContext.request.contextPath}/mypage/mypage.do">
							MYPAGE </a></li>
				</c:when>
			</c:choose>

			<li><c:choose>
					<c:when test="${!empty sessionScope.mvo}">
						<a href="${pageContext.request.contextPath}/logout.do">
							${sessionScope.mvo.name}님 LogOut </a>
					</c:when>
					<c:when test="${not empty manager}">
						<!-- <script>alert("테스트2");</script> -->
						<a href="${pageContext.request.contextPath}/logout.do"> 관리자님
							LogOut </a>
					</c:when>
					<c:otherwise>
						<!-- <script>alert("테스트3");</script> -->
						<a
							href="${pageContext.request.contextPath}/member/noauth_login.do">
							LogIn </a>
					</c:otherwise>
				</c:choose></li>

			<c:if test="${sessionScope.mvo != null }">

				<li><jsp:include page="messagetap.jsp" /></li>
				
				&nbsp;&nbsp;&nbsp;&nbsp;
								
				<li><span id="requestFriend"><img height=35 width=35
						src=${pageContext.request.contextPath}/resources/images/99.png></span></li>
				<div id="bubble"
					style="position: absolute; top: -25px; left: 1060px;">
				</div>
			</c:if>
		</ul>
	</div>
</header>
