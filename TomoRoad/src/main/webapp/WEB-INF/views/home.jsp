<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<!-- map -->
<script>
var map;
var markers=new Array(${size});
var infoList= new Array(${size});
var windowNames = new Array(${size});
var icons = [];
var names = [];

function buttonClick(id,marker,windowName){
	$(document).on("click","#"+id,function(){
		$.ajax({
			type:"GET",
			url:"${pageContext.request.contextPath}/bucket/addBucket.do",
			data:"id=${mvo.id}&name="+id,
			success:function(data){
				if(data=="fail"){
					alert(id+" 이미 버킷리스트에 추가한 역입니다");
				}else{
					alert(id+" 추가완료!");
					if(confirm("장바구니 목록으로 이동하시겠습니까?")==true)
					location.href="${pageContext.request.contextPath}/bucket/bucketList.do?id=${mvo.id}";
				}
				windowName.close(map,marker);
			}
		});
		
	});
	
}
function weaterDetail(id,lat,lng){
	$(document).on("click","#"+id+"weather",function(){
		$.ajax({
			type:"GET",
			url:"http://api.wunderground.com/api/5e1e5a83789f94e3/forecast/lang:KR/q/"+lat+","+lng+".json",
			dataType:"jsonp",
			success:function(data){
				alert(1);
			}
		});
	});	
}
function initMap() {
	    var directionsDisplay = new google.maps.DirectionsRenderer;
		var directionsService = new google.maps.DirectionsService;
	  map = new google.maps.Map(document.getElementById('map'), { 
		center: {lat:37.402040, lng:127.107296}, //사용자가 위치정보 전송을 원하지않을때는 이 좌표 (유스페이스)로 이동함.
	    zoom: 9
	  });
	  var infoWindow = new google.maps.InfoWindow({map: map});
	  	<c:forEach items = "${station}" var = "station" varStatus="status">
		if(${station.member_id==null}){
		 	icons[${status.index}] = "resources/img/marker/marker.png";
		}else{
			icons[${status.index}] = "resources/img/marker/visited.png";
		}
	  	markers[${status.index}] = new google.maps.Marker({
			map: map,
			animation: google.maps.Animation.DROP,
			position: {lat: ${station.lat},lng: ${station.lng}},
			title: "${station.name}",
			icon : icons[${status.index}]
		});
		google.maps.event.addListener(markers[${status.index}],'click',function(){
			for(var z=0;z<windowNames.length;z++){
				if(windowNames[z]!=null){
					windowNames[z].close();
				}
			}
			infoList[${status.index}] = "";
			$.ajax({
				type:"GET",
				url:"noauth_weatherInfo.do",
				data: "lat=${station.lat}&lng=${station.lng}&id=${mvo.id}&name=${station.name}",
				success:function(data){
					infoList[${status.index}] += '<div>';
					infoList[${status.index}] += '<div id="siteNotice"></div>'
					if(data.cityurl=="http://icons.wxug.com/i/c/k/.gif" || data.cityurl =="http://icons.wxug.com/i/c/k/nt_.gif"){
					infoList[${status.index}] +='<h1>${station.name}</h1>'+'This area does not provide weather information.';			
					}else{//if
					infoList[${status.index}] +='<h1>${station.name}<img src="'+data.cityurl+'">'+'</h1>';			
					}//else
					infoList[${status.index}] +='<div>';
					infoList[${status.index}] +='<br>';
			     	if("${mvo.id}"==""){//if
			     	}else{
				    infoList[${status.index}] +='<a href='+'"${pageContext.request.contextPath}/station/getDetailInfo.do?name=${station.name}"'+'>${station.name}정보 보러가기</a><br>';
				    infoList[${status.index}] +='<a href='+"${pageContext.request.contextPath}/getBurnListByStation.do?pageNo=1&stationName=${station.name}"+'>${station.name} 번개시판가기</a><br>';
			  		if(data.result!=0){
			  		infoList[${status.index}] +='<a href='+"${pageContext.request.contextPath}/bucket/bucketList.do?id=${mvo.id}"+'>버킷리스트 보러가기</a><br>';
			  		infoList[${status.index}] +='<a href='+"${pageContext.request.contextPath}/bucket/deleteBucket.do?id=${mvo.id}&name=${station.name}"+'>버킷리스트에서 삭제하기</a><br>';//버튼으로 수정하자 이거는.
			  		}else{
					infoList[${status.index}] +='<input type="button" value="담기" id="${station.name}">';			  			
			  		}
			     	}//else
					infoList[${status.index}] +='</div>';
					infoList[${status.index}] +='</div>';
					windowNames[${status.index}] = new google.maps.InfoWindow({
			       	content: infoList[${status.index}],
			       	maxWidth:200
					});//windowNames
					//windowNames.close();
					windowNames[${status.index}].open(map,markers[${status.index}]);				
				    buttonClick("${station.name}" , markers[${status.index}] ,windowNames[${status.index}]);
				    weaterDetail("${station.name}",${station.lat},${station.lng});
				}//success
			});//ajax
				
		});//marker click
		
		//doInfo(markers[${status.index}],windowNames[${status.index}],windowNames);
	    </c:forEach>
			
	    if (navigator.geolocation) {
	    navigator.geolocation.getCurrentPosition(function(position){
	      var pos = {
	        lat: position.coords.latitude,
	        lng: position.coords.longitude
	      };
	      map.setCenter(pos); //위치정보를 허가했을때는 위치가 여기로 바뀜ㅋ
	      //버튼2 눌렀을 때 현재 위치로 이동.
	  	
	  		infoWindow.close();
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

<!-- 2차로 해야지.
검색 자동완성 //
<script>
  $( function() {
    var criterion=""; //검색 기준
    var keyword=""; //검색 키워드
    
    $("#form").hide(); //검색기준이 리뷰가 아닐 땐 숨겨놓음.
    
	if(${sessionScope.mvo==null}){ //세션이 없을 때는 검색기능 사용 불가
		$("#searchkeyword").val("로그인 후 가능합니다.");
	}else{
		var reviewFilter="제목만"; //리뷰검색 기준-제목이냐 제목+내용이냐
		$("#searchkeyword").removeAttr("readonly");
	    
		 //리뷰 선택 시 나타나는 검색기준 셀렉트박스
		 $(":input[name=reviewForm]").change(function(){
		 	reviewFilter=$(":input[name=reviewForm] option:selected").val();
		  });
		  
	    //자동완성
	     $( "#searchkeyword" ).autocomplete({
	    	source : function( request, response){
	    		//alert(reviewFilter);
	    		$.ajax({
	    			url: criterion+"/getKeyword.do",
	    			dataType:"json",
	    			data:"keyword="+request.term+"&reviewFilter="+reviewFilter, //사용자가 최근 입력한 단어를 보냄
	    			success: function(data){
	    				response(data);
	    			}//success
	    		});//ajax
	    	}//source:function
	    }); //autocomplete
	    
	    $(":input[name=searchForm]").change(function(){ //선택상자 폼에서 변했을 때,
			 criterion=$(this).val();  // 검색기준을 정하고
			 keyword=$("#searchkeyword").val(); // 키워드를 담음. 어쨌든 내가 선택을 해도 어쨌뜬 최종 검색어가 정해지는거니까
			
			//리뷰 선택 시 나타나게만 함.
			if(criterion=="review"){
				$("#form").show();
			}else{
				$("#form").hide();
			}
		});//form change
	}//else
		
  }); //function 
</script>
-->

<!-- //검색자동완성//
<select name="searchForm">
	<option id="all">전체</option>
	<option id="hash">해시태그</option>
	<option id="local">station</option>
	<option id="place">place</option>
	<option id="review">review</option>
</select>
<div class="ui-widget">
		<label for="searchkeyword"><img src="${pageContext.request.contextPath}/resources/images/SearchIcon.png" style="width:20px; height:20px;"></label>
		<!-- 리뷰 선택 시에만 나타나는 폼. //
		<span id="form">
			<select name=reviewForm style="width:101px; height: 30px;">
				<option id="title">제목만</option>
				<option id="idAndContent">제목+내용</option>
			</select>
		</span>
		<input id="searchkeyword" type="text" readonly="readonly">
</div>
-->
</div>
<div id="forecastInfo"></div>
<!-- 지도 -->
<div class='map' id='map' style="width: 100%; height: 600px"></div>
<!-- google map API KEY -->
<script
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDpL8aL2d8fezUQNHEeiaIOaLo7yarXVk8&callback=initMap"
	async defer></script>
	<div class="dividerHeading">
		<h4>
			<span>투모로딩</span>
		</h4>
	</div>
<div>