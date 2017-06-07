<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<header id="header">
	<div class="col-sm-12">
		<div id="logo">
			<h1>
				<a href="${pageContext.request.contextPath}/home.do"><img
					src="${pageContext.request.contextPath}/resources/images/logo.png" /></a>
			</h1>
		</div>
	</div>

	<!-- Navigation
    ================================================== -->

	<div class="navbar navbar-default navbar-static-top col-sm-12"
		role="navigation">
		<div id="my-navbar" class="navbar-collapse collapse col-sm-12">
			<ul class="nav navbar-nav" style="align: center">
				<li>　</li>
				<li><a href="${pageContext.request.contextPath}/noauth_home.do">
						HOME </a></li>
				<li>　</li>

				<li><a href="${pageContext.request.contextPath}/getBurnList.do">
						BURNING </a></li>
				<li>　</li>

				<li><a
					href="${pageContext.request.contextPath}/review/noauth_showList.do">
						REVIEW </a></li>
				<li>　</li>

				<li><a href="${pageContext.request.contextPath}/mypage.do?id=${mvo.id}">
						MYPAGE </a></li>
				<li>　</li>

				<li><a
					href="${pageContext.request.contextPath}/station/noauth_tourinfo.do">
						TourInfo </a></li>
				<li>　</li>
				<li><c:choose>
						<c:when test="${empty mvo}">
							<a href="${pageContext.request.contextPath}/member/noauth_login.do">
								LogIn </a>
						</c:when>
						<c:otherwise>
							<a href="${pageContext.request.contextPath}/logout.do">
								LogOut </a>
						</c:otherwise>
					</c:choose></li>
				<li>　</li>
			</ul>
		</div>
	</div>
</header>
