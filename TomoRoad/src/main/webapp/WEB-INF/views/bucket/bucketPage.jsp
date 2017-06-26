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
	<div class="col-lg-6 col-md-6 col-sm-6">
		<div id="stationList" class="bucketStation">
			<c:forEach items="${bvo}" var="vo">
				<input type="checkbox" name="station" value="${vo.name }">${vo.name }<br>
			</c:forEach>
		</div>
	</div>
	<div class="col-lg-6 col-md-6 col-sm-6">
		출발역 : <select id="stationName" name="depart" class="review-selete-box">
			<c:forEach items="${svo}" var="vo">
				<option value="${vo.name }">${vo.name }</option>
			</c:forEach>
		</select> <br><br>
		도착역 : <select id="stationName" name="destination"
			class="review-selete-box">
			<c:forEach items="${svo}" var="vo">
				<option value="${vo.name }">${vo.name }</option>
			</c:forEach>	
		</select> 
		<br><br>
		<input id="tomoroading" class="btn btn-default btn-lg" type="submit"
			value="투모로딩"> <input id="deleteStation" type="button"
			class="btn btn-default btn-lg" value="선택삭제">
	</div>
</form>

