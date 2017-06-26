<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
var list ="";
var text ="";
   $(document).ready(function(){
     $("#deleteStation").click(function(){
    	 list="";
    	 $('input:checkbox:checked').each(function(){
    		list += $(this).val() ; 
    	 });
    	 $.ajax({
            type : "POST",
            url : "deletechecked.do",
            data : "list="+list+"&id=${mvo.id}",
            success : function(data) {
               text="";
               $("#stationList").html("");
               for(var i=0;i<data.length;i++){
                  text += '<input type="checkbox" name="station" value="';
                  text += data[i].name;
                  text += '">'+data[i].name+'<br>';
               }
               $("#stationList").html(text);
              }
         });         
      });
   });
</script>
<form action="${pageContext.request.contextPath}/tomoroad/makeRoute.do">
	<div class="col-lg-7 col-md-7 col-sm-7">
		<div id="stationList" class="bucketStation">
			<div class="bucketTitle">
				<p>여행바구니</p>
				<span>원하는 지역을 선택하여 투모로딩을 시작해보세요!</span><br>
			</div>
			<div class="bucketStationLabel">
			<c:forEach items="${bvo}" var="vo">
				<input id="${vo.name}" type="checkbox" name="station" value="${vo.name }">
				<label for="${vo.name}">${vo.name }</label>
			</c:forEach>
			<div style="height: 10px; width: 500px;"></div>
			</div>
		</div>
	</div> 
	<div class="bucketRight bucketStation col-lg-5 col-md-5 col-sm-5">
		<p>출발역 : </p><select name="depart" class="review-selete-box">
			<c:forEach items="${svo}" var="vo">
				<option value="${vo.name }">${vo.name }</option>
			</c:forEach>
		</select> <br><br>
		<p>도착역 : </p><select name="destination"
			class="review-selete-box">
			<c:forEach items="${svo}" var="vo">
				<option value="${vo.name }">${vo.name }</option>
			</c:forEach>	
		</select> 
		<br><br>
		<div class="bucketButton">
		<input id="tomoroading" class="btn btn-default btn-lg" type="submit"
			value="투모로딩"> <input id="deleteStation" type="button"
			class="btn btn-default btn-lg" value="선택삭제">
		</div>
	</div>
</form>

