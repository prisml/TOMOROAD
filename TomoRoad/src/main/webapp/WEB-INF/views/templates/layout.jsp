<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Creative - Bootstrap 3 Responsive Admin Template">
    <meta name="author" content="GeeksLabs">
    <meta name="keyword" content="Creative, Dashboard, Admin, Template, Theme, Bootstrap, Responsive, Retina, Minimal">

<title><tiles:insertAttribute name="title" ignore="true" /></title>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> 	
	<jsp:include page="/resources/boot.jsp"/>  
</head>
<body>
	<div id="container">
		
		<div id="header">
			<tiles:insertAttribute name="header" />
		</div>
		<div id="left">
			<tiles:insertAttribute name="left" />
		</div>
		<section id="main-content">
		<section class="wrapper">
		<div id="main">
			<tiles:insertAttribute name="main" />
		</div>
		</section>
		<div id="footer">
			<tiles:insertAttribute name="footer" />
		</div>
		</section>
	</div>
</body>
</html>