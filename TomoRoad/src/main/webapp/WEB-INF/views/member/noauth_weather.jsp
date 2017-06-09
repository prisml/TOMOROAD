<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html> 
<html> 
<head> 
	<title>서울시 날씨정보-wunderground API이용</title> 

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
	<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
 <script type="text/javascript">
 $(document).ready(function($){
	    $.ajax({
	        url: "http://api.wunderground.com/api/a876e7a78280d5b6/forecast/lang:KR/q/seoul.json",
	        dataType : "jsonp",
	        success : function(parsed_json) {
	            var forecast = parsed_json['forecast']['txt_forecast']['forecastday'];
	            
	            for (index in forecast) {
	                var newForecastString = forecast[index]['title'];
	               /*  var newForecastImages = forecast[index]['icon_url']; */
	               var newImages="";
	               var newForecastImages = forecast[index]['icon_url'];
	               $("#images").append("<img src="+newForecastImages+">");
	               
	                var newForecastParagraph = $('<td/>').text(newForecastString);
	                $("#three").append(newForecastParagraph);
	               /*  var newForecastImagesParagraph = $('<td/>').text(newForecastImages); */
	                /* $("#images").html("img src("l+forecast['icon_url']+".svg)"); */
	                
	            } 
	        }
	    }); 
	}); 
	</script>
</head> 
<body> 

<div >

	<div >	
		<div id="three"></div>
		    <div id="images"></div>


		
	</div><!-- /content -->

</div><!-- /page -->

</body>
</html>