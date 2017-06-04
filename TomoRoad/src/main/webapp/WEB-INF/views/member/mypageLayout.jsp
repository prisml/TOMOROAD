<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><tiles:insertAttribute name = "title" ignore="true"/></title>
<style type="text/css">
	#left{
		padding: 5px;
		height:500px;
		width:200px;
		float: left; /* left로 부유위치를 지정해 left와 main이 수평 배치하도록 한다    */
	}
	#main{
		padding: 5px;
		width:600px;
		height: 500px;		
		float: left; /* left로 부유위치를 지정해 left와 main이 수평 배치하도록 한다    */
		border-left: 1px solid black;
	}
</style>
</head>
<body>
<div id = "container">
	<div id = "left"><tiles:insertAttribute name = "left"/></div>
	<div id = "main"><tiles:insertAttribute name = "main"/></div>
</div>
</body>
</html>