<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html class="no-js">
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<title><tiles:insertAttribute name="title" ignore="true" /></title>
	<jsp:include page="/resources/boot.jsp"/>  
</head>
<body>
	<div id="container">		
		<div id="header">
			<tiles:insertAttribute name="header" />
		</div>
		<div class="row">
			<div class="col-sm-1"> 
			<div id="left">
				<tiles:insertAttribute name="left" />
			</div>
			</div>
			<div class="col-sm-9">
			<div id="main">
				<tiles:insertAttribute name="main" />
			</div>
			</div>
			<div class="col-sm-1">
			<div id="right">
				<tiles:insertAttribute name="right" />
			</div>
			</div>
		</div><%-- 	
		<div id="footer">
			<tiles:insertAttribute name="footer" />
		</div> --%>
		</div>
</body>
</html>

    <!--  -->