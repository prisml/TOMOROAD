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
		<div class="navbar-collapse collapse col-sm-12">
			<ul class="nav navbar-nav">
			<li>　</li>
				<li><a href="${pageContext.request.contextPath}/home.do">　HOME　</a>
				</li>
			<li>　</li>

				<li><a href="${pageContext.request.contextPath}/getBurnList.do">　BURNING　</a>
				</li>
			<li>　</li>

				<li><a
					href="${pageContext.request.contextPath}/review/showList.do">　REVIEW　</a>
				</li>
			<li>　</li>

				<li><a
					href="${pageContext.request.contextPath}/member/mypage.do">　MYPAGE　</a>
				</li>
			<li>　</li>

				<li><a
					href="${pageContext.request.contextPath}/station/getList.do">　STATION　</a>
				</li>
			<li>　</li>
				<li><c:choose>
						<c:when test="${empty mvo}">
							<a href="${pageContext.request.contextPath}/member/login.do">　LogIn　</a>
						</c:when>
						<c:otherwise>
							<a href="${pageContext.request.contextPath}/logout.do">　LogOut　</a>
						</c:otherwise>
					</c:choose></li>
			<li>　</li> 	
			</ul>
		</div>
	</div>
</header>
<section id="page_head" class="row">
	<div class="col-lg-12 col-md-12 col-sm-12">
		<div class="page_title">
			<h2>(to do : board name)</h2>
			<span class="sub_heading">We are here for you 24/7</span>
		</div>
		<nav id="breadcrumbs">
			<ul>
				<li>Explain : </li>
				<li><a href="${pageContext.request.contextPath}/home.do">(to
						do / board explain)</a></li>
			</ul>
		</nav>
	</div>
</section>
