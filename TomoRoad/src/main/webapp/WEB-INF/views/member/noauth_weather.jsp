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
 $(document).ready(function(){
	 $("input[name='weather']").click(function() {
		 $("#test").stop(true).fadeToggle();
	 
		 var urlAddress = $(this).val();
	    $.ajax({
	        url: "http://api.wunderground.com/api/a876e7a78280d5b6/forecast/lang:KR/q/"+urlAddress,
	        dataType : "jsonp",
	        success : function(parsed_json) {
	            var forecast = parsed_json['forecast']['txt_forecast']['forecastday'];
	             $("#titles").empty();
	             $("#images").empty();
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

<div id="test">
		<div id="titles"></div>
		    <div id="images"></div>
	</div>

		<div >
			<input type="image" src="${pageContext.request.contextPath}/resources/img/1.png"  id="제천" 
			name="weather" value="seoul.json">서울
		</div>
		<div >
			<input type="image" src="${pageContext.request.contextPath}/resources/img/1.png"  id="논산" 
			name="weather" value="gwangju.json">광주
		</div>
				<div >
			<input type="image" src="${pageContext.request.contextPath}/resources/img/1.png"  id="제천" 
			name="weather" value="daegu.json">대구
		</div>
		<div >
			<input type="image" src="${pageContext.request.contextPath}/resources/img/1.png"  id="논산" 
			name="weather" value="miryang.json">밀양
		</div>
				<div >
			<input type="image" src="${pageContext.request.contextPath}/resources/img/1.png"  id="제천" 
			name="weather" value="gunsan.json">군산
		</div>
		<div >
			<input type="image" src="${pageContext.request.contextPath}/resources/img/1.png"  id="논산" 
			name="weather" value="busan.json">부산
		</div>
				<div >
			<input type="image" src="${pageContext.request.contextPath}/resources/img/1.png"  id="논산" 
			name="weather" value="gangneung.json">강릉
		</div>



</body>
</html>