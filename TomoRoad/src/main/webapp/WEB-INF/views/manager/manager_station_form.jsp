<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
      <div class="col-lg-12 col-sm-12"> 
	
	 <div class="dividerHeading" >
            <h4><span>수정 해주세요</span></h4>
        </div>

	 <form method="post" enctype ="multipart/form-data" action="${pageContext.request.contextPath}/updateStation.do" id="registerForm">
	 <div class="comment_form">
    	 <div class="row">
    	     <div class="col-sm-4">
               	 역이름<input  class="col-lg-4 col-md-4 form-control" type="text" id="name" name="name" value="${station.name}" readonly>
             </div>
              <div class="col-sm-4">
               	역 간단 설명<input class="col-lg-4 col-md-4 form-control" name="simpleDetail" id="simpleDetail" type="text" size="30" value="${station.simpleDetail}" required="required" >
             </div>
         </div>
     </div>
     <div class="comment-box row">
       <div class="col-sm-12">
         <p>
           <textarea id="detail" name="detail" style="height:300px;" required="required" >${station.detail}</textarea>
         </p>
      </div>
     </div>
     	 <div class="comment_form">
    	 <div class="row">
    	     <div class="col-sm-4">
               	 행정구역<input class="col-lg-4 col-md-4 form-control" name="section" id="section" type="text" value="${station.section}"  required="required" >
             </div>
              <div class="col-sm-4">
               	이미지파일<input type = "file" name = "uploadfile" id = "uploadfile" required="required" >
             </div>
    	     <div class="col-sm-4">
               	 위도<input class="col-lg-4 col-md-4 form-control" name="lat" id="lat" type="text" value="${station.lat}"  readonly="readonly">
             </div>
              <div class="col-sm-4">
               	경도<input class="col-lg-4 col-md-4 form-control" name="lng" id="lng" type="text" value="${station.lng}"  readonly="readonly">
             </div>
         </div>
     </div>
	<div align="center">
     <input class="btn btn-danger" type="submit" value="수정하기" style="width: 500px; height: 35px; margin: 0 auto; align:center;"> 
     <br>
      <a class="btn btn-danger" href="${pageContext.request.contextPath}/getMemberList.do" style="width: 500px; height: 35px; margin: 0 auto; align:center;">관리자 화면</a>
    </div>  
  </form>
  </div>