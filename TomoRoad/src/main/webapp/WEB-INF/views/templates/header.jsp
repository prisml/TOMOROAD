<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<header class="header dark-bg">
	<div class="toggle-nav">
		<div class="icon-reorder tooltips"
			data-original-title="Toggle Navigation" data-placement="bottom">
			<i class="icon_menu"></i>
		</div>
	</div>

	<!--logo start-->
	<a href="index.html" class="logo">Nice <span class="lite">Admin</span></a>
	<!--logo end-->

	<div class="top-nav notification-row">
		<!-- notificatoin dropdown start-->

		<!-- user login dropdown start-->
		<ul class="nav pull-right top-menu">
			<li class="dropdown"><a data-toggle="dropdown"
				class="dropdown-toggle" href="#"> <span class="profile-ava">
						<img alt=""
						src="${pageContext.request.contextPath}/resources/img/avatar1_small.jpg">
				</span> <span class="username">Jenifer Smith</span> <b class="caret"></b>
			</a>
				<ul class="dropdown-menu extended logout">
					<li>
						<div class="log-arrow-up"></div>
					</li>
					<li class="eborder-top"><a href="#"><i
							class="icon_profile"></i> My Profile</a></li>
					<li><a href="#"><i class="icon_mail_alt"></i> My Inbox</a></li>
					<li><a href="#"><i class="icon_clock_alt"></i> Timeline</a></li>
					<li><a href="#"><i class="icon_chat_alt"></i> Chats</a></li>
					<li><a href="login.html"><i class="icon_key_alt"></i> Log
							Out</a></li>
					<li><a href="documentation.html"><i class="icon_key_alt"></i>
							Documentation</a></li>
					<li><a href="documentation.html"><i class="icon_key_alt"></i>
							Documentation</a></li>
				</ul></li>
			<!-- user login dropdown end -->
		</ul>
		<!-- notificatoin dropdown end-->
	</div>



</header>
<!--header end-->
