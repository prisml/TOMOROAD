<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<script type="text/javascript">
	$(document).ready(function(){
		$("#registerForm").submit(function(){
			var a = $("#st :selected").val();
			if(a==""){
				alert("역을 선택해주세요")
				return false;
			}
		});
		
		$("#golist").click(function() {
			location.href = "${pageContext.request.contextPath}/getBurnList.do";
		});
	});
</script>



 <div class="dividerHeading">
 	<h4><span> Write Burn </span></h4>
 </div>
 <form method="post" action="${pageContext.request.contextPath}/writeBurn.do" id="registerForm">
 
	 <div class="comment_form">
    	 <div class="row">
        	 <div class="col-sm-4">
             	제목<input class="col-lg-4 col-md-4 form-control" name="title" type="text" size="30" placeholder="제목을 입력해주세요" required> 
             </div>
             <div class="col-sm-4">
               	작성자<input class="col-lg-4 col-md-4 form-control" name="memberId" type="text" size="30" value="${mvo.id}" readonly>
             </div>
             <div class="col-sm-4">
               	 역이름<select class="col-lg-4 col-md-4 form-control" name=stationName id="st"><option value="">---------</option><c:forEach items="${station}" var="sname"><option name="${name}">${sname}</option></c:forEach></select>
             </div>
         </div>
     </div>
     <div class="comment-box row">
       <div class="col-sm-12">
         <p>
           <textarea name="content" style="height:300px;" placeholder="내용을 입력해주세요" required></textarea>
         </p>
      </div>
     </div>
	<div align="center">
     <input type="submit" value="작성하기" class="btn btn-lg btn-default"> 
     <input type="button" id="golist" class="btn btn-lg btn-default" style="color:white; background-color: #FFCC00" value="취소">
    </div>  
  </form>
