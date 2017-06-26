<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<!-- map -->
<c:if test="${sessionScope.mvo != null }">
<img src="resources/img/marker/visited.png"> 내가 리뷰한역
<img src="resources/img/marker/marker.png"> 일반역들
</c:if>
<script>
var map;
var markers=new Array(${size});
var infoList= new Array(${size});
var windowNames = new Array(${size});
//미리 사이즈를 만들어 놓은 배열을 사용하기 위해 사이즈를 주었다.
var icons = [];//각각의 아이콘들을 배열로관리.
var zindex = 0;//zindex값을 동적으로 만들기위해 변수선언


function closeInfo(){
	for(var z=0;z<windowNames.length;z++){
		if(windowNames[z]!=null){//아직 인덱스 z번째에 세팅된 값이 없다면 넘어가고
			windowNames[z].close();//있을시 close 시켜준다.
		}
	}
}

$(document).ready(function(){
	$("#closeInfo").click(function(){
		closeInfo();
	});
});

function buttonClick(id,marker,windowName){
	$(document).on("click","#"+id,function(){
		//jQuey on을 사용해, 모든 정보가 로딩된 뒤 작동을 하게 만든다.
		$.ajax({
			type:"GET",
			url:"${pageContext.request.contextPath}/bucket/addBucket.do",
			data:"id=${mvo.id}&name="+id,
			success:function(data){
				if(data=="fail"){
					alert(id+" 이미 버킷리스트에 추가한 역입니다");
				}else{
					if(confirm(id+" 추가완료!\n"+"장바구니 목록으로 이동하시겠습니까?")==true)
					location.href="${pageContext.request.contextPath}/bucket/bucketList.do?id=${mvo.id}";
				}
				windowName.close(map,marker);
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
		if(${station.member_id==null}){//역에관한 아이디 존재여부를 체크하여, 마커를다르게준다.
		 	icons[${status.index}] = "resources/img/marker/marker.png";
		 	zindex=100;
		}else{
			icons[${status.index}] = "resources/img/marker/visited.png";
			zindex=1000;
			
		}
	  	markers[${status.index}] = new google.maps.Marker({
			map: map,
			animation: google.maps.Animation.DROP,
			position: {lat: ${station.lat},lng: ${station.lng}},
			title: "${station.name}",
			icon : icons[${status.index}], //다르게 생성된 마커이미지와
			zIndex:zindex //zindex값을 마커생성시에 세팅해준다.
		}); 
		google.maps.event.addListener(markers[${status.index}],'click',function(){ 
			//생성된 마커를 클릭시 이벤트를 발생시킨다.
			for(var z=0;z<windowNames.length;z++){
				if(windowNames[z]!=null){//아직 인덱스 z번째에 세팅된 값이 없다면 넘어가고
					windowNames[z].close();//있을시 close 시켜준다.
				}
			}
			infoList[${status.index}] = "";
			$.ajax({//날씨정보를 생성하고, 정보창에 띄워줄 값을 세팅해주는 에이젝스통신.
				type:"GET",
				url:"noauth_weatherInfo.do",
				data: "lat=${station.lat}&lng=${station.lng}&id=${mvo.id}&name=${station.name}",
				success:function(data){
					infoList[${status.index}] += '<div>';
					infoList[${status.index}] += '<div id="siteNotice"></div>';
					infoList[${status.index}] += '<div class="iw-title"><p>${station.name}</p></div>';
					if(data.cityurl=="http://icons.wxug.com/i/c/k/.gif" || data.cityurl =="http://icons.wxug.com/i/c/k/nt_.gif"){
					//날씨 url을 위한 조건문. 날씨 URL의 경우 날씨정보가 없는지역은 낮일때 첫번째 조건, 밤일때 두번쨰 조건에 있는 url을 제공한다.
					//저 url을 그대로 쓰면 이미지가 안나오기때문에 조건문으로 걸러주어 이미지가 뜨지않는 것을 방지한다.
					infoList[${status.index}] +='<div>'+'Sorry Tomoroader, This area does not provide weather information.'+'</div>';			
					}else{//날씨를 제공할 경우 정상적인 날씨정보를 세팅
					infoList[${status.index}] +='<div class="iw-body"><p>현재 날씨</p>'
					infoList[${status.index}] +='<img src="'+data.cityurl+'">';
					infoList[${status.index}] +='</div>'
					}//else
					infoList[${status.index}] +='<div>';
					infoList[${status.index}] +='<div class="iw-content">';
			     	if("${mvo.id}"==""){//로그인했을 경우에만 보이는 정보들을 위한 조건문이다.
			     	}else{
				    infoList[${status.index}] +='<a href='+'"${pageContext.request.contextPath}/station/getDetailInfo.do?name=${station.name}"'+'>역정보</a>';
				    infoList[${status.index}] +='<a href='+"${pageContext.request.contextPath}/getBurnListByStation.do?pageNo=1&stationName=${station.name}"+'>번개시판</a>';
			  		if(data.result!=0){
			  		infoList[${status.index}] +='<a href='+"${pageContext.request.contextPath}/bucket/deleteBucket.do?id=${mvo.id}&name=${station.name}"+'>담기취소</a>';
			  		}else{
					infoList[${status.index}] +='<input type="button" value="담기" id="${station.name}">';			  			
			  		}
			     	}//else
			     	infoList[${status.index}] +='<a id="closeInfo" href="#.">닫기</a>';
					infoList[${status.index}] +='</div>';
					infoList[${status.index}] +='</div>';
					infoList[${status.index}] +='</div>';
					windowNames[${status.index}] = new google.maps.InfoWindow({
			       	content: infoList[${status.index}],
			       	maxWidth:400
					});//windowNames
					/*css*/
					google.maps.event.addListener(windowNames[${status.index}], 'domready', function() {
						// Reference to the DIV which receives the contents of the infowindow using jQuery
						var iwOuter = $('.gm-style-iw');
						/* The DIV we want to change is above the .gm-style-iw DIV.
						* So, we use jQuery and create a iwBackground variable,
						* and took advantage of the existing reference to .gm-style-iw for the previous DIV with .prev().
						*/
						var iwBackground = iwOuter.prev();
						// Remove the background shadow DIV
						iwBackground.children(':nth-child(2)').css({'display' : 'none'});
						// Remove the white background DIV
						iwBackground.children(':nth-child(4)').css({'display' : 'none'});
						// Moves the arrow 76px to the left margin 
						iwBackground.children(':nth-child(3)').find('div').children().css({'box-shadow': 'rgba(0, 0, 0, 1) 1px 1px 1px', 'z-index' : '1'});
						var iwCloseBtn = iwOuter.next();

						// Apply the desired effect to the close button
						iwCloseBtn.css({
						  opacity: '1', // by default the close button has an opacity of 0.7
						  right: '38px', top: '3px', // button repositioning
						  border: '7px solid #ED4B4B', // increasing button border and new color
						  'border-radius': '13px', // circular effect
						  //'box-shadow': '0 0 5px #ED4B4B' // 3D effect to highlight the button
						  });

						// The API automatically applies 0.7 opacity to the button after the mouseout event.
						// This function reverses this event to the desired value.
						iwCloseBtn.mouseout(function(){
						  $(this).css({opacity: '1'});
						});
					});
					/*css*/
					windowNames[${status.index}].open(map,markers[${status.index}]);				
				    buttonClick("${station.name}" , markers[${status.index}] ,windowNames[${status.index}]);
				}//success
			});//ajax
				
		});//marker click
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
<!-- 지도 -->
<div class='map' id='map' style="width: 100%; min-height: 600px; height:100%"></div>
<!-- google map API KEY -->
<script
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDpL8aL2d8fezUQNHEeiaIOaLo7yarXVk8&callback=initMap"
	async defer></script>
<div>