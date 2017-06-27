<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<br><br>
<script type="text/javascript">
	$(document).ready(function(){
		$("#updateForm").submit(function(){
			var a = $("#st :selected").val();
			if(a==""){
				alert("역을 선택해주세요")
				return false;
			}
		});
		
		$("#cancel").click(function() {
			location.href = "${pageContext.request.contextPath}/burn/showBurnDetail.do?no="+${bvo.no};
		});
	});
</script>



 <div class="dividerHeading">
 	<h4><span> 번 게시물 수정 </span></h4>
 </div>
 <form method="post" action="${pageContext.request.contextPath}/burn/updateBurn.do" id="updateForm">
 
	 <div class="comment_form">
    	 <div class="row">
        	 <div class="col-sm-4">
             	글번호<input class="col-lg-4 col-md-4 form-control" name="no" type="text" size="30" value="${bvo.no}" readonly> 
             </div>
             <div class="col-sm-4">
               	제목<input class="col-lg-4 col-md-4 form-control" name="title" type="text" size="30" value="${bvo.title}" required>
             </div>
             <div class="col-sm-4">
               	 역이름<select class="col-lg-4 col-md-4 form-control" name="stationName" id="st">
               	 	<option value="">---------</option>
               	 	<c:forEach items="${station}" var="sname">
               	 		<option name="${name}">${sname}</option>
               	 	</c:forEach>
               	 	</select>
             </div>
         </div>
     </div>
     <div class="comment-box row">
       <div class="col-sm-12">
         <p><textarea name="content" style="height:300px;" required>${bvo.content}</textarea></p>
      </div>
     </div>
     
	<div align="center">
     <input type="submit" value="수정완료" class="btn btn-lg btn-default"> 
     <input type="button" id="cancel" class="btn btn-lg btn-default" style="color:white; background-color: #FFCC00" value="취소">
    </div>   
      
  </form>
  