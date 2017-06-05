<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>
  $(document).ready(function() {
  var lat;
  var long;
  var country;
  $.getJSON("http://ip-api.com/json", function(geoData) {

    lat = geoData.lat;
    long = geoData.lon;
    country = geoData.country + ", " + geoData.countryCode;
    console.log(lat, long, country);
  
    var api = "http://api.apixu.com/v1/current.json?q=" + lat + "," + long + "&key=bdcea7ec663d4e3088d25742161606";
    console.log(api);

    $.getJSON(api, function(weatherInfo) {

      var cTemp = weatherInfo.current.temp_c;
      var fTemp = weatherInfo.current.temp_f;
      var tempSwap = true;

      var localDateTime = weatherInfo.location.localtime;
      var description = weatherInfo.current.condition.text;
      var icon = weatherInfo.current.condition.icon;
      var humidity = weatherInfo.current.humidity;
      var cloud = weatherInfo.current.cloud;
      //var cloud = 1;
      var precip = weatherInfo.current.precip_mm;

      $("#country").html(country);
      $("#description").html(description);
      $("#humidity").html(humidity + " %");
      $("#fTemp").html(fTemp + " &#8457;");
      $("#cTemp").html(cTemp + " &#8451;");

      $("#fTemp").click(function() {
        if (tempSwap === false) {
          $("#fTemp").html(fTemp + " &#8457;");
          tempSwap = true;
        } else {
          $("#fTemp").html(cTemp + " &#8451;");
          tempSwap = false;
        }
      }); // end click function
           if (cloud >= 80)
        $("#climaticon").css("content", "url(data:image/jpeg;base64,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)");
      if (cloud < 15) {
        $("#climaticon").css("content", "url(https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRD5mZgKKYM7t9FQrCUklInidXBf1zQtl_t1v5kiBUvb-dYhQJC)");
        $("#climaticon").css("border-radius", "50%");
      }
      if (precip > 5)
        $("#climaticon").css("content", "url((https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRD5mZgKKYM7t9FQrCUklInidXBf1zQtl_t1v5kiBUvb-dYhQJC))");

    }); // end JSON call on weather info

  }); // end JSON call on geolocation

}); // end doc
</script>


<div class = "text-center">
  <h1>Local Weather App</h1>
  <ul class="list-unstyled">
  <li class= "btn btn-default" id= "city"></li>
  <li class= "btn btn-default" id= "weatherType"></li>
  <li class= "btn btn-default" id= "fTemp"></li>
  <li class= "btn btn-default" id= "windSpeed"></li>
  </ul>
  </div>