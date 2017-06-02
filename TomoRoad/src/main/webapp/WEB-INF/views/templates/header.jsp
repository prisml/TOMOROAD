<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	<div class="navbar-collapse collapse">
		<ul class="nav navbar-nav">
			<li><a href="${pageContext.request.contextPath}/home.do">HOME</a>
			</li>

			<li><a href="${pageContext.request.contextPath}/getBurnList.do">BURNING</a>
			</li>

			<li><a
				href="${pageContext.request.contextPath}/review/showList.do">REVIEW</a>
			</li>

			<li><a
				href="${pageContext.request.contextPath}/member/mypage.do">MYPAGE</a>
			</li>

			<li><a href="${pageContext.request.contextPath}/station/getList.do">STATION</a>
			</li>
<li>
			<c:choose>
				<c:when test="${empty mvo}">
					<a href="${pageContext.request.contextPath}/member/login.do">LogIn</a>
				</c:when>
				<c:otherwise>
					<a href="${pageContext.request.contextPath}/logout.do">LogOut</a>
				</c:otherwise>
			</c:choose>
			</li>
		</ul>
	</div>
</div>
