<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
	var station = [];
	var map;
	var paths=[];
	var names = [];
	var markers=[];
	var infoList= [];
	var windowNames = [];
	var icons = [];
 	$(document).ready(function(){
 		function doInfo(marker, windowName,windowNames) {
	        google.maps.event.addListener(marker, 'click', function() {
	        	for(var z=0;z<windowNames.length;z++){
	        		windowNames[z].close();
	        	}
	        	windowName.open(map, marker);
	        });
	    }
 		<c:forEach items="${station}" var = "waypoint" varStatus="index">
 			station.push("${waypoint}");//경유역
 		</c:forEach>
 		<c:forEach items="${names}" var = "list" varStatus="status">
 		names.push("${list.name}");
		if("${param.depart}" == "${list.name}" && "${param.destination}" == "${list.name}"){
			icons[${status.index}] = "${pageContext.request.contextPath}/resources/img/marker/startend.png";
		}else if("${param.destination}" == "${list.name}"){
			icons[${status.index}] = "${pageContext.request.contextPath}/resources/img/marker/destination.png";			
		}else if("${param.depart}"=="${list.name}"){
			icons[${status.index}] = "${pageContext.request.contextPath}/resources/img/marker/start.png";
		}else{
			for(var s=0;s<station.length;s++){
				if("${list.name}"==station[s]){
					icons[${status.index}] = "${pageContext.request.contextPath}/resources/img/marker/waypoint.png";
					break;
				}else{
					icons[${status.index}] = "${pageContext.request.contextPath}/resources/img/marker/marker.png";
				}					
			}
		}
				markers[${status.index}] = new google.maps.Marker({
						map: map,
						animation: google.maps.Animation.DROP,
						position: {lat: ${list.lat},lng: ${list.lng}},
						title: "${list.name}",
						icon: icons[${status.index}]
					});
					infoList[${status.index}] += '<div>';
					infoList[${status.index}] += '<div id="siteNotice"></div>'
					infoList[${status.index}] +='<h3 class="firstHeading">'+"${list.name}"+'</h3>';
					infoList[${status.index}] +='<div class="bodyContent">';
					infoList[${status.index}] +='<br>';
					infoList[${status.index}] +='</div>';
					infoList[${status.index}] +='</div>';
		            windowNames[${status.index}] = new google.maps.InfoWindow({
		            	content: infoList[${status.index}]
		            });	             
		            doInfo(markers[${status.index}],windowNames[${status.index}],windowNames);
		            paths.push({lat: ${list.lat},lng: ${list.lng}});
		</c:forEach>
				 var flightPath = new google.maps.Polyline({
			          path: paths,
			          geodesic: true,
			          strokeColor: '#FF0000',
			          strokeOpacity: 1.0,
			          strokeWeight: 2
			        });

			        flightPath.setMap(map);
					
/*  alert("${param.destination}");
 alert("${param.depart}");
 alert("${param.station}"); */
 	$("#result").html("<h1>추천경로:"+names+"</h1>")
 }); 
$(document).on('submit',"#travel",function(){
	if(confirm("이 경로로 여행을 시작하시겠습니까?")==true){
		$("#travelForm").submit();
	}else{
		return false;
	}
});
</script>

<!-- map띄우기 -->
<script>
function initMap() {
	   var directionsDisplay = new google.maps.DirectionsRenderer;
		var directionsService = new google.maps.DirectionsService;
	  map = new google.maps.Map(document.getElementById('map'), { 
		center: {lat:36.752540, lng:127.909502}, //사용자가 위치정보 전송을 원하지않을때는 이 좌표 (유스페이스)로 이동함.
	    zoom: 8
	  }); 	
	}
</script>

<div id=map style="width:100%;height:600px"></div>
<div id="result">
</div>
<form method="POST" action="${pageContext.request.contextPath}/tomoroading/travel.do" id="travelForm">
		<c:forEach items="${station }" var="waypoint">
		<input type="hidden" name="waypoint" value=${waypoint }>
		</c:forEach>
		<c:forEach items="${names }" var="list">
		<input type="hidden" name="names" value="${list.name}">
		</c:forEach>
		<input type="hidden" name="depart" value="${param.depart}">
		<input type="hidden" name="destination" value="${param.destination}">
		<input type="hidden" name="id" value="${mvo.id }">
		<input type="submit" value="여행시작하기" id="travel">
</form>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDpL8aL2d8fezUQNHEeiaIOaLo7yarXVk8&callback=initMap"
 async defer></script>
