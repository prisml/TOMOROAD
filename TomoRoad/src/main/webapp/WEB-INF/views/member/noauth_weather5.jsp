<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html> 
<html>
<head>
<title>Weather API Test</title>
</head>
<body>
<script type="text/html" id="weather_tmpl">
    <div class="weather_wrapper">
        <div class="top_wrapper top_wrapper_e">
            {{=day0}}
            <div class="bt_control" id="meteo_controller">
                <a href="javascript://">
                    <img src="arrow_open.png" id="meteo_trigger_img" width="27" height="17" alt="Arrow" />
                </a>
            </div>
        </div>
        <div class="bottom_wrapper" id="meteo_future_days">
            <div class="next_days_wrapper">
                <div class="day first">
                    {{=day1}}
                    <div class="clear"></div>
                </div>
                <div class="day">
                    {{=day2}}
                    <div class="clear"></div>
                </div>
                <div class="day last">
                    {{=day3}}
                    <div class="clear"></div>
                </div>
            </div>
            <div class="bottom"></div>
        </div>
    </div>
</script>

<script type="text/html" id="detail_tmpl">
    <div class="date">{{=date.weekday}},
        <br />{{=date.day}} {{=monthname_short}}.</div>
    <div class="temp">{{=high.celsius}}</div>
    <div class="icon">
        <img src="{{=icon_url}}" width="34" height="34" alt="icone" />
    </div>
</script>

<script src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
<script src="t.min.js"></script>
<script src="https://github.com/jasonmoo/t.js/blob/master/t.min.js" ></script>
<script type="https://github.com/jasonmoo/t.js/blob/master/template" id="test">
(function(){
        var mainTpl = new t($('#weather_tmpl').html()),
            detailTpl = new t($('#detail_tmpl').html());

 $.getJSON('http://api.wunderground.com/api/a876e7a78280d5b6/forecast/q/CA/San_Francisco.json')
            .done(function(data){
                var tplData = {};
                $.each(data.forecast.simpleforecast.forecastday, function(index, day){
                    tplData['day'+index] = detailTpl.render(day);
                });
                $('body').append(mainTpl.render(tplData));
            });
    })();
          var meteostatus = 0; // closed
          $('#meteo_controller').click(function() {
          if (meteostatus === 0) {
          meteostatus = 1;
          $('#meteo_future_days').fadeIn('slow');
          $('#meteo_trigger_img').attr('src', $('#meteo_trigger_img').attr('src').replace('open', 'close'));
          } else {
          meteostatus = 0;
          $('#meteo_future_days').fadeOut('slow');
          $('#meteo_trigger_img').attr('src', $('#meteo_trigger_img').attr('src').replace('close', 'open'));
          }
          });

</script>
</body>
</html>