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
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<!-- jQuery ui style sheet -->
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
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/mypage.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js">
</script>
	
<title><tiles:insertAttribute name="title" ignore="true" /></title>
</head>
<body>
	<section class="wrapper container">
		<tiles:insertAttribute name="header" />
		<section id="page_head" class="row">
			<div class="col-lg-12 col-md-12 col-sm-12">
				<div class="page_title">
					<h2>
						<tiles:insertAttribute name="subtitle" ignore="true" />
					</h2>
					<span class="sub_heading">TOMOROAD always support your trip.</span>
				</div>
			</div>
		</section>
		<section id="mainSection" class="content">
			<div class="row">
				<div class="col-xs-1 col-sm-1 col-md-1 col-lg-1"></div>
				<div class="col-xs-10 col-sm-10 col-md-10 col-lg-10">
					<tiles:insertAttribute name="main" />
				</div>
				<div class="col-xs-1 col-sm-1 col-md-1 col-lg-1"></div>
			</div>
		</section>
		<tiles:insertAttribute name="footer" />
	</section>
	<!--start footer-->
	<script type="text/javascript">
		function funLoad() {
			var Cheight = $(window).height() - 326;
			$('#mainSection').css({
				'min-height' : Cheight + 'px'
			});
		}
		window.onload = funLoad;
		window.onresize = funLoad;
	</script>

	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/jquery-1.10.2.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.easing.1.3.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/retina-1.1.0.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/jquery.cookie.js"></script>
	<!-- jQuery cookie -->
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/styleswitch.js"></script>
	<!-- Style Colors Switcher -->
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.fractionslider.js"
		type="text/javascript" charset="utf-8"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/jquery.smartmenus.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/jquery.smartmenus.bootstrap.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/owl.carousel.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/jflickrfeed.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/jquery.magnific-popup.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/jquery.isotope.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/jquery.easypiechart.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/swipe.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/jquery-scrolltofixed-min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/jquery.matchHeight-min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/wow.min.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<!-- jQuery ui library -->
	<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>

	<!-- 사진 화살표 버튼 클릭 시 발생하는 이벤트 -->
	<script
		src="${pageContext.request.contextPath}/resources/js/carousel.js"></script>

	<!-- Start Style Switcher -->
	<!-- <div class="switcher"></div> -->
	<!-- End Style Switcher -->


</body>
</html>

<!--  -->