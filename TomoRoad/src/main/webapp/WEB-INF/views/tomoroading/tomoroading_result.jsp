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
	var zindex=0;
 	$(document).ready(function(){
 		function doInfo(marker, windowName,windowNames) {
	        google.maps.event.addListener(marker, 'click', function() {
	        	//markerClick
	        	for(var z=0;z<windowNames.length;z++){
	        		windowNames[z].close();
	        	}
	        	windowName.open(map, marker);
	        });
	    }
 		<c:forEach items="${station}" var = "waypoint" varStatus="index">
 			station.push("${waypoint}");//경유역을 미리 생성한 리스트에 jstl을 이용하여 넣어주었다.	
 		</c:forEach>
 		<c:forEach items="${names}" var = "list" varStatus="status">
 		names.push("${list.name}");//모든역들을 미리 생성한 리스트에 담아준다.
		if("${param.depart}" == "${list.name}" && "${param.destination}" == "${list.name}"){
			//url에 있는 파라미터의 출발역과 도착역의 정보를 읽어 컨트롤러에서 받아오는 이름과 비교하여
			//출발역과 도착역이 둘다 같은 마커의 아이콘을 변경하기위해 사용하는 조건문이다.
			icons[${status.index}] = "${pageContext.request.contextPath}/resources/img/marker/startend.png";
			zindex=1000;
		}else if("${param.destination}" == "${list.name}"){
			//도착역과 현재받아오는 역을 비교하여 도착역 마커를 변경하기 위해 사용하는조건문이다.
			icons[${status.index}] = "${pageContext.request.contextPath}/resources/img/marker/destination.png";			
			zindex=1000;
		}else if("${param.depart}"=="${list.name}"){
			//도착역과 현재받아오는 역을 비교하여 출발역 마커를 변경하기 위해 사용하는조건문이다.
			icons[${status.index}] = "${pageContext.request.contextPath}/resources/img/marker/start.png";
			zindex=1000;
		}else{
			for(var s=0;s<station.length;s++){
				if("${list.name}"==station[s]){
					//for문을 돌려면서 그안에서 조건을 걸어 경유지들의 아이콘을 변경해준다.
					icons[${status.index}] = "${pageContext.request.contextPath}/resources/img/marker/waypoint.png";
					zindex=1000;
					break;
				}else{
					//기본아이콘들의 이미지는 마지막에 세팅해준다.
					icons[${status.index}] = "${pageContext.request.contextPath}/resources/img/marker/marker.png";
					zindex=100;
				}					
			}
		}
				markers[${status.index}] = new google.maps.Marker({
						map: map,
						animation: google.maps.Animation.DROP,
						position: {lat: ${list.lat},lng: ${list.lng}},
						title: "${list.name}",
						icon: icons[${status.index}],
						zIndex:zindex
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
		            paths.push({lat: ${list.lat},lng: ${list.lng}}); //path 좌표정보들을 리스트에 담는다.
		</c:forEach>
				 var flightPath = new google.maps.Polyline({//path값들을 서로 이어준다.
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
 	$("#result").html("<h4>추천경로:"+names+"</h4>")
 }); 
$(document).on('click',"#travel",function(){
	if(confirm("이 경로로 여행을 시작하시겠습니까?")==true){
		$.ajax({
			type:"GET",
			url:"${pageContext.request.contextPath}/tomoroading/check.do?id=${mvo.id}",
			success:function(data){
				if(data>0){
					alert("하고계신 여행을 종료후 여행을 시작해주세요!");
					return false;
				}else{
					$("#travelForm").submit();
				}
			}
		});
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
</form>
		<input type="button" value="여행시작하기" id="travel">
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDpL8aL2d8fezUQNHEeiaIOaLo7yarXVk8&callback=initMap"
 async defer></script>
 
