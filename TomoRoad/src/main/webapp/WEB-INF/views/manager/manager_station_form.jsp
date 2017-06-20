<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
      <div class="col-lg-12 col-sm-12"> 
	
	 <div class="dividerHeading" >
            <h4><span>수정 해주세요</span></h4>
        </div>
        
<ul id="list" class="portfolio_list clearfix isotope" style="position: relative; overflow: hidden; height: 894.563px;">
	 	<c:forEach items="${station}" var="vo">
			<!--begin List Item -->
			<li class="list_item col-lg-4 col-md-6 col-sm-6 ${vo.section} isotope-item" style="">
				<figure class="touching effect-bubba">
					<img src="${pageContext.request.contextPath}/resources/images/symbol/${vo.img}.png" alt="">
					<div class="option">
						<a href="${pageContext.request.contextPath}/station/getDetailInfo.do?name=${vo.name}" class="fa fa-link"></a>
					</div>
					
					<figcaption>
						<h5>${vo.name}</h5>
						<p>${vo.simpleDetail}</p>
					</figcaption>
				</figure>
			</li>
		</c:forEach>
	</ul>
	
	 <form method="post" action="${pageContext.request.contextPath}/updateStation.do" id="registerForm">
	 <div class="comment_form">
    	 <div class="row">
    	     <div class="col-sm-4">
               	 역이름<select class="col-lg-4 col-md-4 form-control" name="name" id="name"><option value="">---------</option><c:forEach items="${station}" var="sname"><option name="${sname.name}">${sname.name}</option></c:forEach></select>
             </div>
              <div class="col-sm-4">
               	역 간단 설명<input class="col-lg-4 col-md-4 form-control" name="simpleDetail" id="simpleDetail" type="text" size="30" value="${station.simpleDetail}" >
             </div>
         </div>
     </div>
     <div class="comment-box row">
       <div class="col-sm-12">
         <p>
           <textarea id="detail" name="detail" style="height:300px;" value="${station.detail}" required></textarea>
         </p>
      </div>
     </div>
     	 <div class="comment_form">
    	 <div class="row">
    	     <div class="col-sm-4">
               	 행정구역<input class="col-lg-4 col-md-4 form-control" name="section" id="section" type="text" value="${station.section}" >
             </div>
              <div class="col-sm-4">
               	이미지파일<input type = "file" name = "file" id = "file">
             </div>
    	     <div class="col-sm-4">
               	 위도<input class="col-lg-4 col-md-4 form-control" name="lat" id="lat" type="text" value="${station.lat}" >
             </div>
              <div class="col-sm-4">
               	경도<input class="col-lg-4 col-md-4 form-control" name="lng" id="lng" type="text" value="${station.lng}"  >
             </div>
         </div>
     </div>
	<div align="center">
     <input type="submit" value="수정하기" class="btn btn-lg btn-default"> 
      <a class="btn btn-danger" href="${pageContext.request.contextPath}/getMemberList.do" style="width: 500px; height: 35px; margin: 0 auto; align:center;">관리자 화면</a>
    </div>  
  </form>
  </div>