<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
	var map;
	var paths=[];
	var names = [];
	var markers=[];
	var polys=[];
	var infoList= [];
	var windowNames = [];
	$(document).ready(function(){
		function doInfo(marker, windowName,windowNames) {
	        google.maps.event.addListener(marker, 'click', function() {
	        	for(var z=0;z<windowNames.length;z++){
	        		windowNames[z].close();
	        	}
	        	windowName.open(map, marker);
	        });
	    }
		<c:forEach items="${locationNames}" var="list">
		names.push("${list}");
		</c:forEach>
		$.ajax({
			type:"GET",
			url:"${pageContext.request.contextPath}/tomoroading/route.do",
			data: "names="+names,
			success:function(data){
				for(var i=0;i<data.length;i++){
					markers[i] = new google.maps.Marker({
						map: map,
						animation: google.maps.Animation.DROP,
						position: {lat: data[i].lat,lng: data[i].lng},
						title: data[i].name
					});
					infoList[i] += '<div>';
					infoList[i] +='<h1 class="firstHeading">'+data[i].name+'</h1>';
					infoList[i] +='<div class="bodyContent">';
					infoList[i] +='<p>'+data[i].detail+'</p>';
					infoList[i] +='<br>';
		            infoList[i] +='<a href='+"${pageContext.request.contextPath}/station/getDetailInfo.do?name="+data[i].name+'>'+data[i].name+'정보 보러가기'+'</a>';
		            infoList[i] +='<a href='+"${pageContext.request.contextPath}/getBurnListByStation.do?pageNo=1&stationName="+data[i].name+'> 번개시판가기</a>';
					infoList[i] +='</div>';
					infoList[i] +='</div>';
		            windowNames[i] = new google.maps.InfoWindow({
		            	content: infoList[i]
		            });	            
		            doInfo(markers[i],windowNames[i],windowNames);
		            paths.push({lat: data[i].lat,lng: data[i].lng});
				}
				 var flightPath = new google.maps.Polyline({
			          path: paths,
			          geodesic: true,
			          strokeColor: '#FF0000',
			          strokeOpacity: 1.0,
			          strokeWeight: 2
			        });

			        flightPath.setMap(map);
			}	
		});
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
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDpL8aL2d8fezUQNHEeiaIOaLo7yarXVk8&callback=initMap"
 async defer></script>
