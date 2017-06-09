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
	 $("input[name='weather']").one("click",function() {
		 var urlAddress = $(this).val();
	    $.ajax({
	        url: "http://api.wunderground.com/api/a876e7a78280d5b6/forecast/lang:KR/q/"+urlAddress,
	        dataType : "jsonp",
	        success : function(parsed_json) {
	            var forecast = parsed_json['forecast']['txt_forecast']['forecastday'];
	            
	            for (index in forecast) {
	               var newForecastString = forecast[index]['title'];
	               var newForecastParagraph = $('<td/>').text(newForecastString);
	                $("#titles").append(newForecastParagraph);
	                
	               var newForecastImages = forecast[index]['icon_url'];
	               $("#images").append("<img src="+newForecastImages+">");
   
	            } 
	        }
	    }); 
	}); 
 }); 
	</script>
</head> 
<body> 

<div >

	<div >	
		<div id="titles"></div>
		    <div id="images"></div>
		<div >
			<input type="image" src="${pageContext.request.contextPath}/resources/img/1.png"  id="제천" 
			name="weather" value="seoul.json">
		</div>
		<div >
			<input type="image" src="${pageContext.request.contextPath}/resources/img/1.png"  id="논산" 
			name="weather" value="gwangju.json">
		</div>

		
	</div><!-- /content -->

</div><!-- /page -->

</body>
</html>