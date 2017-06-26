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
   출발역 <input name="depart" type="text" required="required">
   도착역<input name="destination" type="text" required="required">
   <div id="stationList">
   <c:forEach items="${bvo}" var="svo">
      <input type="checkbox" name="station" value="${svo.name }">${svo.name }<br>
   </c:forEach>
   </div>
   <input id="tomoroading" type="submit" value="투모로딩"> <input id="deleteStation"
      type="button" value="선택삭제">
</form>

