<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
      <div class="col-lg-12 col-sm-12"> 
	
	 <div class="dividerHeading" >
            <h4><span>추가 해주세요</span></h4>
        </div>

	 <form method="post" enctype ="multipart/form-data" action="${pageContext.request.contextPath}/insertPlaceManager.do" id="registerForm">
	 <div class="comment_form">
    	 <div class="row">
<!--     	     <div class="col-sm-4">
               	 역이름<input  class="col-lg-4 col-md-4 form-control" type="text" id="st" name="station_name" value="d" readonly>
             </div>  	 -->
    <div id="listStation" class="col-sm-4" >
    <select class="col-sm-4 form-control" name="station_name" id="station_name" required="required" >
	<option value="all" >전체보기</option>
	<c:forEach items="${station}" var="sname">
	<option value="${sname.name}">${sname.name}</option>
	</c:forEach>
	</select>
             </div>
             <label>원하시는 역을 선택 해주세요</label> 
         </div>
     </div>
     	 <div class="comment_form">
    	 <div class="row">

<!--               <div class="col-sm-4">
               	이미지파일<input type = "file" name = "uploadfile" id = "uploadfile" >
             </div> -->
    	     <div class="col-sm-4">
               	 관광지 이름<input class="col-lg-4 col-md-4 form-control" name="name" id="name" type="text" required="required" >
             </div>
              <div class="col-sm-4">
               	지역<input class="col-lg-4 col-md-4 form-control" name="area" id="area" type="text" required="required" >
             </div>
         </div>
     </div>
     <br>
	<div align="center">
     <input class="btn btn-danger" type="submit" value="추가하기" style="width: 500px; height: 35px; margin: 0 auto; align:center;"> 
     <br>
     <br>
      <a class="btn btn-danger" href="${pageContext.request.contextPath}/getMemberList.do" style="width: 500px; height: 35px; margin: 0 auto; align:center;">관리자 화면</a>
    </div>  
  </form>
  </div>