<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script> 
 $(document).ready(function(){
    $('input[type=radio]').prop('checked', false);

    $('input[type=radio]').on('change', function(){
        $('input[type=radio]').not(this).prop('checked', false);
    });
}); 
</script> 
<script>              
			    $(document).ready(function(){   	
			        $("#updateMember").click(function(){
			        	var radioValue = $("input[name='radio']:checked").val();
			            if(radioValue){			            	
			            		 confirm("회원정보를 수정하시겠습니까?"); 					
							 location.href = "${pageContext.request.contextPath}/updateMemberByManagerForm.do?id="+radioValue; 
						}
			        });			        
			        $("#deleteMember").click(function(){
			        	var radioValue = $("input[name='radio']:checked").val();
			            if(radioValue){
			            	 confirm("회원을 삭제하시겠습니까?"); 
						location.href = "${pageContext.request.contextPath}/deleteMemberByManager.do?id="+radioValue;
			            }
			        });			        
			        $("#managerStation").click(function(){		
			        	var optionValue = $("#st").val();
						location.href = "${pageContext.request.contextPath}/getStationListManager.do?name="+optionValue;
			        });			        
			        $("#updatePlace").click(function(){
			        	var radioValue = $("input[name='radio']:checked").val();
			            if(radioValue){			            	
			            		 confirm("관광지를 수정하시겠습니까?"); 					
							 location.href = "${pageContext.request.contextPath}/updatePlaceManagerForm.do?no="+radioValue; 
						}
			        });			        
			        $("#insertPlace").click(function(){
			            if(confirm("관광지를 추가하시겠습니까?")){
						location.href = "${pageContext.request.contextPath}/insertPlaceManagerForm.do";
			            }
			        });			        
			        $("#deletePlace").click(function(){
			        	var radioValue = $("input[name='radio']:checked").val();
			            if(radioValue){
			            	 confirm("관광지를 삭제하시겠습니까?"); 
						location.href = "${pageContext.request.contextPath}/deletePlaceManager.do?no="+radioValue;
			            }
			        });	
			        $("#deleteStation").click(function(){		
			        	var optionValue = $("#st").val();
			        	  if(optionValue){
				            	 confirm("역정보를 삭제하시겠습니까?"); 
						location.href = "${pageContext.request.contextPath}/deleteStation.do?name="+optionValue;
			        	  }
			        });	
			        $("#insertStation").click(function(){
			            if(confirm("역정보를 추가하시겠습니까?")){
						location.href = "${pageContext.request.contextPath}/manager_station_register.do";
			            }
			        });	
			    });
</script>
<script type="text/javascript">
$(document).ready(function(){
     $("#showStation").click(function(){
         $("#listStation").animate({
            height: 'toggle'      	
        });
    });	 
});
</script>


    <div class="col-lg-12 col-sm-12"> 
	
		        <div class="dividerHeading">
            <h4><span>관리자 화면</span></h4>
        </div>
        <br>
<br>
<button id="showStation" class="btn btn-default btn-lg button" >역정보 보기</button>
    	     <div id="listStation" class="col-sm-4" style="display:none;">
               	 <select class="col-sm-4 form-control" name=stationName id="st">
	<option value="all">전체보기</option>
	<c:forEach items="${station}" var="sname">
	<option value="${sname.name}">${sname.name}</option>
	</c:forEach>
	</select>
             </div>
<button id="managerStation" class="btn btn-default btn-lg button" >역정보 수정</button>

<button id="deleteStation" class="btn btn-default btn-lg button" >역정보 삭제</button>

<button id="insertStation" class="btn btn-default btn-lg button" >역정보 추가</button>

<label>원하시는 역을 선택 해주세요</label>
<br>
 <div id="listOutputMember" >
<form id="myForm" style="width: 102%; height: 250px; overflow-y: scroll; display: block;">
<table style="width:100px; height:200px;">
	<thead>
		<tr>
		<th width="20px"></th><th width="100px">아이디</th><th width="100px">비밀번호</th>
		<th width="100px">이름</th><th width="100px">성별</th><th width="100px">연락처</th>
		</tr>
	</thead>
	<tbody>
	<c:forEach items="${list}" var="mvo">
		<tr>
    <td><input type="radio" name="radio" value="${mvo.id}" required="required"/></td>
	<td><input type="text" value="${mvo.id}" readonly></td>
	<td><input type="password" value="${mvo.password}" readonly></td>
	<td><input type="text" value="${mvo.name}" readonly></td>
	<td><input type="text" value="${mvo.sex}" readonly></td>
	<td><input type="text" value="${mvo.tel}" readonly></td>
		</tr>
		</c:forEach>
	</tbody>
</table>
</form>
</div>
<br>
<button id="updateMember" class="btn btn-default btn-lg button" >회원수정</button>

<button id="deleteMember" class="btn btn-default btn-lg button" >회원삭제</button>
<label>원하시는 회원을 선택 해주세요</label>
<%--  <a href="${pageContext.request.contextPath}/home.do" class="btn btn-default btn-lg button">시작화면</a>  --%>
<br>
<br>
 <div id="listOutputPlace" >
<form id="myForm" style="width: 102%; height: 250px; overflow-y: scroll; display: block;">
<table style="width:100px; height:200px;">
	<thead>
		<tr>
		<th width="25px"></th><th width="100px">번호</th><th width="100px">관광지 이름</th><th width="100px">역 이름</th>
		<th width="100px">지역</th>
		</tr>
	</thead>
	<tbody>
	<c:forEach items="${placeList}" var="place">
		<tr>
    <td><input type="radio" name="radio" value="${place.no}" required="required"/></td>
	<td><input type="text" value="${place.no}" readonly></td>
	<td><input type="text" value="${place.name}" readonly></td>
	<td><input type="text" value="${place.station_name}" readonly></td>
	<td><input type="text" value="${place.area}" readonly></td>
		</tr>
		</c:forEach>
	</tbody>
</table>
</form>
</div>
<br>
<button id="updatePlace" class="btn btn-default btn-lg button" >관광지 수정</button>

<button id="insertPlace" class="btn btn-default btn-lg button" >관광지 추가</button>

<button id="deletePlace" class="btn btn-default btn-lg button" >관광지 삭제</button>
<label>원하시는 관광지를 선택 해주세요</label>
<br>
<br>
<br>
</div>
    
        

        
       