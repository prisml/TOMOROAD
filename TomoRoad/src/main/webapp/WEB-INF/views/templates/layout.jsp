<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html class="no-js">
<head>
<meta charset="UTF-8">


<!-- CSS FILES -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/style.css"
	media="screen" data-name="skins">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/switcher.css"
	media="screen" />

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/fractionslider.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style-fraction.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/animate.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<title><tiles:insertAttribute name="title" ignore="true" /></title>


</head>
<body>
	<section class="wrapper container">
		<header id="header">
			<tiles:insertAttribute name="header" />
		</header>
	</section>
	<tiles:insertAttribute name="main" />
	<tiles:insertAttribute name="footer" />
	<!--start footer-->

	<script type="text/javascript" src="js/jquery-1.10.2.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.easing.1.3.js"></script>
	<script src="js/retina-1.1.0.min.js"></script>
	<script type="text/javascript" src="js/jquery.cookie.js"></script>
	<!-- jQuery cookie -->
	<script type="text/javascript" src="js/styleswitch.js"></script>
	<!-- Style Colors Switcher -->
	<script src="js/jquery.fractionslider.js" type="text/javascript"
		charset="utf-8"></script>
	<script type="text/javascript" src="js/jquery.smartmenus.min.js"></script>
	<script type="text/javascript"
		src="js/jquery.smartmenus.bootstrap.min.js"></script>
	<script type="text/javascript" src="js/owl.carousel.min.js"></script>
	<script type="text/javascript" src="js/jflickrfeed.js"></script>
	<script type="text/javascript" src="js/jquery.magnific-popup.min.js"></script>
	<script type="text/javascript" src="js/jquery.isotope.min.js"></script>
	<script type="text/javascript" src="js/jquery.easypiechart.min.js"></script>
	<script type="text/javascript" src="js/swipe.js"></script>
	<script type="text/javascript" src="js/jquery-scrolltofixed-min.js"></script>
	<script type="text/javascript" src="js/jquery.matchHeight-min.js"></script>
	<script type="text/javascript" src="js/wow.min.js"></script>

	<script src="js/main.js"></script>

	<!-- Start Style Switcher -->
	<div class="switcher"></div>
	<!-- End Style Switcher -->
	<script>
		// WOW Animation
		new WOW().init();
	</script>
</body>
</html>

<!--  -->