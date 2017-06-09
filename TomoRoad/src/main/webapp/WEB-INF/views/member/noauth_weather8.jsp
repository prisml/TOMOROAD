<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type='text/javascript'> 
(function(){ 
var meteostatus = 0; // closed 
var mainTpl = new t($('#weather_tmpl').html()), 
detailTpl = new t($('#detail_tmpl').html()); 

$.getJSON('http://api.wunderground.com/api/a876e7a78280d5b6/forecast/q/CA/San_Francisco.json?callback=?') 
.done(function(data){ 
var tplData = {}; 
$.each(data.forecast.simpleforecast.forecastday, function(index, day){ 
tplData['day'+index] = detailTpl.render(day); 
}); 
$('body').append(mainTpl.render(tplData)); 

$('#meteo_controller').click(function() { 
if (meteostatus == 0) { 
meteostatus = 1; 
$('#meteo_future_days').fadeIn('slow'); 
$('#meteo_trigger_img').attr('src', $('#meteo_trigger_img').attr('src').replace('open', 'close')); 
} else { 
meteostatus = 0; 
$('#meteo_future_days').fadeOut('slow'); 
$('#meteo_trigger_img').attr('src', $('#meteo_trigger_img').attr('src').replace('close', 'open')); 
} 
}); 
}); 
})(); 
</script>
</head>
<body>
<div class="weather_wrapper"> 
<div class="top_wrapper top_wrapper_e"> 
<div class="date">Monday, 
<br />23 Dec.</div> 
<div class="temp">-7</div> 
<div class="icon"> 
<img src="http://img11.hostingpics.net/pics/8703383328.png" width="34" height="34" alt="icone" /> 
</div> 
<div class="bt_control" id="meteo_controller"> 
<a href="javascript://"> 
<img src="/themes/made_by_ola/images/meteo_widget/arrow_open.png" id="meteo_trigger_img" width="27" height="17" alt="Arrow" /> 
</a> 
</div> 
</div> 
<div class="bottom_wrapper" id="meteo_future_days"> 
<div class="next_days_wrapper"> 
<div class="day first"> 
<div class="date">Tuesday, 
<br />24 Dec.</div> 
<div class="temp">-16</div> 
<div class="icon"> 
<img src="/themes/made_by_ola/images/meteo_widget/icons/34.png" width="34" height="34" alt="icone" /> 
</div> 
<div class="clear"></div> 
</div> 
<div class="day"> 
<div class="date">Wednesday, 
<br />25 Dec.</div> 
<div class="temp">-14</div> 
<div class="icon"> 
<img src="/themes/made_by_ola/images/meteo_widget/icons/26.png" width="34" height="34" alt="icone" /> 
</div> 
<div class="clear"></div> 
</div> 
<div class="day last"> 
<div class="date">Thursday, 
<br />26 Dec.</div> 
<div class="temp">-2</div> 
<div class="icon"> 
<img src="/themes/made_by_ola/images/meteo_widget/icons/14.png" width="34" height="34" alt="icone" /> 
</div> 
<div class="clear"></div> 
</div> 
</div> 
<div class="bottom"></div> 
</div> 
</div> 
</body>
</html>