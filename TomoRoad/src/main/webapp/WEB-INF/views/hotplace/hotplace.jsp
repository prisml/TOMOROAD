<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div id="map"  style="width:100%;height:600px"></div><div id="termsranking"><table id="termsrankingtable"></table></div>
<script>
 var map;
 var marker;
 var info;
 var locationList = new Array();
 var rankingInfoList = new Array();
 var infoList = [];
 var markers = [];
 var windowNames= [];
 $(document).ready(function(){
	 $.ajax({
		 type:"GET",
		 url:"${pageContext.request.contextPath}/noauth_rankingLocation.do",
		 success:function(data){
			 for(var i=0;i<data.length;i++){
				 locationList.push(data[i]);
			 }
		 }
	 });
	$.ajax({
		type:"GET",
		url:"${pageContext.request.contextPath}/noauth_rankingInfo.do",
		success:function(data){
			var ranking = "";
			for(var i=0;i<data.length;i++){
				rankingInfoList.push(data[i]);
				ranking += "<tr>";
				ranking += "<td>"+i+"위 </td>";
				ranking += "<td>"+"  "+"검색어:"+data[i].name+"</td>";
				ranking += "<td>"+"  "+"검색수:"+data[i].hit+"</td>";
				ranking += "</tr>";
			}
			$("#termsrankingtable").html(ranking);
		}
	});
 });
$(document).on("click","#searchRankingLocation",function(){
	map = new google.maps.Map(document.getElementById('map'), { 
  	    center: {lat:37.402040, lng:127.107296} , //usepace
		zoom: 7
  	  	});
	function doInfo(marker, windowName) {
        google.maps.event.addListener(marker, 'click', function() {
            windowName.open(map, marker);
        });
    }
	for(var i=0;i<locationList.length;i++){
			markers[i] = new google.maps.Marker({
		          map: map,
		          draggable: true,
		          animation: google.maps.Animation.DROP,
		          position: locationList[i],
		          title: rankingInfoList[i].name
		  });
			infoList[i] = '<div id="content">'+
            '<div id="siteNotice">'+
            '</div>'+
            '<h1 id="firstHeading" class="firstHeading">'+rankingInfoList[i].name+'</h1>'+
            '<div id="bodyContent">'+
            '<p>'+rankingInfoList[i].detail+'</p>'+
            '</div>'+
            '</div>';
            
			windowNames[i] = new google.maps.InfoWindow({
		          content: infoList[i]
	        });
			
			 doInfo(markers[i], windowNames[i]);
			
	}
});

function initMap() {
   var directionsDisplay = new google.maps.DirectionsRenderer;
	var directionsService = new google.maps.DirectionsService;
  map = new google.maps.Map(document.getElementById('map'), { 
	center: {lat:37.402040, lng:127.107296}, //사용자가 위치정보 전송을 원하지않을때는 이 좌표 (유스페이스)로 이동함.
    zoom: 7
  });
  
  var infoWindow = new google.maps.InfoWindow({map: map});
  
  
  if (navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(function(position){
      var pos = {
        lat: position.coords.latitude,
        lng: position.coords.longitude
      };
      map.setCenter(pos); //위치정보를 허가했을때는 위치가 여기로 바뀜ㅋ
      //버튼2 눌렀을 때 현재 위치로 이동.
  	document.getElementById('clientLocation').addEventListener('click',function(){
  	  	map = new google.maps.Map(document.getElementById('map'), { 
  		center: pos,
  	    zoom: 13
  	  	});
  	  	marker = new google.maps.Marker({
          map: map,
          draggable: true,
          animation: google.maps.Animation.DROP,
          position: pos
        });
  	  	
 	});
  		infoWindow.setPosition(pos);
	  	infoWindow.setContent('현재위치');
    }, function() {
      handleLocationError(true, infoWindow, map.getCenter());
    });
  } else {
    // Browser doesn't support Geolocation
    handleLocationError(false, infoWindow, map.getCenter());
  }
}

function handleLocationError(browserHasGeolocation, infoWindow, pos) {
    infoWindow.setPosition(pos);
    infoWindow.setContent(browserHasGeolocation ?
                          'Error: 현재위치 불러오기에 실패했습니다. 현재위치 정보 받아오기에 동의하지않으신 경우, 현재위치관련 서비스를  제공받을 수 없습니다.' :
                          'Error: Your browser doesn\'t support geolocation.');
  }
</script>
<br><br><br><br>
내 현재위치가 궁금하다면 ? <input type="button" value="현재위치로" id="clientLocation">
<input type="button" value="검색어 랭킹5 여행지 보기!" id="searchRankingLocation">
 <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDpL8aL2d8fezUQNHEeiaIOaLo7yarXVk8&callback=initMap"
    async defer></script>
