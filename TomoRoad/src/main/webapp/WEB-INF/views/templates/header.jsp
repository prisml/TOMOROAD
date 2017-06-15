<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script type="text/javascript">
function reqeustList(){
	location.href = "${pageContext.request.contextPath}/mypage/friend_RequestList.do";
}

$(document).ready(function(){
	$.ajax({
		type:"get",
		url:"${pageContext.request.contextPath}/friend_RequestInfo.do",
		success:function(date){
				if(date != 0){
					$("#requestFriend").html("<input height = 35 width = 35 type = image src = ${pageContext.request.contextPath}/resources/images/99-1.png onclick = reqeustList()> ");
				}else{
					$("#requestFriend").html("<img height = 35 width = 35  src = ${pageContext.request.contextPath}/resources/images/99.png>");
				}
			}
	})
})
</script>
<header id="header">
	<%-- <div class="col-sm-12">
		<div id="logo">
			<h1>
				<a href="${pageContext.request.contextPath}/home.do"><img
					src="${pageContext.request.contextPath}/resources/images/logo.png" /></a>
			</h1>
		</div>
	</div> --%>

	<!-- Navigation
    ================================================== -->

	<div style="border-bottom-color : #fff; background-color:#fff;" class="navbar navbar-default navbar-static-top col-sm-12"
		role="navigation">
		<div id="my-navbar" class="navbar-collapse collapse col-sm-12">
			<ul class="nav navbar-nav" style="background-color:#fff; align: center">
				<li>　</li>
				<li><a href="${pageContext.request.contextPath}/home.do">
				<img src="${pageContext.request.contextPath}/resources/images/logo.png" 
					style="height:40px; margin-top:-10px;"/>
				</a></li>
				<li>　</li>

				<li><a href="${pageContext.request.contextPath}/getBurnListByStation.do?stationName=all">
						BURNING </a></li>
				<li>　</li>

				<li><a
					href="${pageContext.request.contextPath}/review/noauth_showList.do">
						REVIEW </a></li>
				<li>　</li>

				<li><a href="${pageContext.request.contextPath}/mypage/mypage.do">
						MYPAGE </a></li>
				<li>　</li>

				<li><a
					href="${pageContext.request.contextPath}/station/getTourInfoData.do">
						TourInfo </a></li>
				<li>　</li>
				<li><c:choose>
						<c:when test="${empty mvo}">
							<a href="${pageContext.request.contextPath}/member/noauth_login.do">
								LogIn </a>
						</c:when>
						<c:otherwise>
							<a href="${pageContext.request.contextPath}/logout.do">
								${mvo.name}님╹◡╹)ﾉ LogOut </a>
						</c:otherwise>
					</c:choose></li>
				<li>　</li>
				<c:if test="${mvo != null }">
				<span id = "requestFriend"></span>
				</c:if>
<%-- 				<li><a href="${pageContext.request.contextPath }/hotplace/noauth_hotplace.do">HotPlace</a> </li>
				<li> </li>
 --%>				
			</ul>
		</div>
	</div>
</header>
