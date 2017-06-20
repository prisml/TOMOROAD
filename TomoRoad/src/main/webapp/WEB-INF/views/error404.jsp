<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

<title>404</title>
</head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script>
	$(document).ready(function() {
		$("#gobackBtn").click(function() {
			history.back();
		});
	});
</script>
</head>
<body>
	<section class="wrapper container">
		<section id="mainSection" class="content">
			<div class="row">
				<div class="col-sm-12 col-lg-12 col-md-12">
					<div class="page_404">
						<h1>404</h1>
						<p>Sorry, Page you're looking for is not found</p>
						<a id="gobackBtn" href="#"
							class="btn btn-default btn-lg back_home"> <i
							class="fa fa-arrow-circle-o-left"></i> Go to Back
						</a>
					</div>
				</div>
			</div>
		</section>
	</section>
</body>
</html>
