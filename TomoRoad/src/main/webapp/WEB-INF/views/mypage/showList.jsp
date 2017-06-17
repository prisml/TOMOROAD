<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script type="text/javascript">
	$(document).ready(function(){
		/*스크롤 페이징*/
		var page=1;
		var num="";
		
 		//페이지가 로드되면 데이터를 가져오고 page를 증가시킴
		$(function(){
			getList(page);
			page++;
		});
		/*
		스크롤이 최하단으로 내려가면 리스트를 조회하고 page를 증가시킴
	 	$(window).scrollTop() : 브라우저의 스크롤 위치값
	 	$(document).height() : 현재페이지(문서)의 높이
	 	$(window).height() : 윈도우 크기
	 	스크롤이 최하단으로 내려가면 리스트 조회 후 page 증가시킴 
		 */
		$(window).scroll(function(){ //스크롤이 바닥에 닿으면 이벤트를 발생시킴
			if($(window).scrollTop()>=$(document).height()-$(window).height()){
				getList(page);
				page++;
			}
		});//scroll
		
	});
			
	function getList(page){
		$.ajax({
			type : 'POST',
			url : "${pageContext.request.contextPath}/review/getListByMemberInMemberPage.do",
			data : {"page" : page,
					"id" : '${sessionScope.mvo.id}'
					},
			success : function(result){
				
				var TimeLine="";
				
				for(var i=0;i<result.pagingBean.endRowNumber;i++){ //리스트의 길이만큼 데이터를 넣는다.
					TimeLine="";
					TimeLine+="<div class=timeline-block>";
					TimeLine+="<div class='timeline-img tl-green'>";
					TimeLine+="<i class='fa fa-picture-o'></i>";
					TimeLine+="</div>";
					TimeLine+="<div class='timeline-content'>";
					TimeLine+="<h2>"+result.list[i].title+"</h2>";
					
					//사진슬라이드 영역
					TimeLine+="<div class='porDetCarousel'>";
						//사진
						TimeLine+="<div class='carousel-content'>";
						//이미지가 없을 때는 upload 파일에 사진이 없어. 그러면 
						/* TimeLine+="<img src=${pageContext.request.contextPath}/resources/upload/review"+result.list[i].no+"_"+i+" alt=''>";
						TimeLine+="<img src=${pageContext.request.contextPath}/resources/upload/review"+result.list[i].no+"_"+i+" alt=''>";
						TimeLine+="<img src=${pageContext.request.contextPath}/resources/upload/review"+result.list[i].no+"_"+i+" alt=''>"; */
							TimeLine+="<img class='carousel-item active' src='${pageContext.request.contextPath}/resources/images/서울역.jpg' alt='' style='display: block;'>";
							TimeLine+="<img class='carousel-item' src='${pageContext.request.contextPath}/resources/images/서울역2.jpg' alt='' style='display: none;'>";
							TimeLine+="<img class='carousel-item' src='${pageContext.request.contextPath}/resources/images/서울역3.jpg' alt='' style='display: none;'>";
						TimeLine+="</div>";	
						//화살표
						TimeLine+="<div class='carousel-control'>";
							TimeLine+="<div class='carousel-prev'></div>";
							TimeLine+="<div class='carousel-next'></div>";
							TimeLine+="<ul class='carousel-pagination'>";
								TimeLine+="<li class='active'></li>";
								TimeLine+="<li class=''></li>";
								TimeLine+="<li class=''></li>";
							TimeLine+="</ul>";
						TimeLine+="</div>";
						
					TimeLine+="</div>";	
					
					TimeLine+="<div class=metaInfo style='text-align: center; margin-bottom: -17px;'>";
					TimeLine+="<span><i class='fa fa-map-marker'></i>&nbsp;<a href='#.'>"+result.list[i].place.name+"</a>";
					TimeLine+="&nbsp;&nbsp;<i class='fa fa-eye'></i><a href='#.'>"+result.list[i].hits+"&nbsp;</a>";
					TimeLine+="&nbsp;<i class='fa fa-heart'></i>"+result.list[i].recommend+"</span>";
					TimeLine+="</div>";
					
					TimeLine+="<p>"+result.list[i].subContent+"</p>";
					TimeLine+="<a href='${pageContext.request.contextPath}/review/noauth_detailHit.do?no="+result.list[i].no+"' class='btn btn-default'>더 읽기</a>";
					TimeLine+="<span class='tl-post-date'>&nbsp;"+result.list[i].postedTime+"&nbsp;</span>";
					TimeLine+="</div>";
					TimeLine+="</div>";
					$("#timeline").append(TimeLine);
				}	
				
			}//success
		}); //ajax
	}//function
</script>

<section class="super_sub_content row">

	<div class="dividerHeading text-center">
		<h4>
			<span>타임라인</span>
		</h4>	
	</div>

	<div class="col-md-12">
		<section id="timeline" class="timeline-container">
		
<%-- 			<c:forEach items="${reviewList2}" var="Rlist" >			
		 		<div class="timeline-block">
					<div class="timeline-img tl-green"><!-- 초록색그림 -->
						<i class="fa fa-picture-o"></i>
					</div>
				 	<div class="timeline-content">
						<h2 class="page-title">${Rlist.list.title}</h2><!-- 글제목 -->
						<p class="page-content">${Rlist.list.content}</p><!-- 글내용 -->
						<a href="#" class="btn btn-default">더 읽기</a>
						<span class="tl-post-date">${Rlist.list.postedTime}</span><!-- 게시날짜 -->
					</div>
				</div>
			</c:forEach> --%>
<!-- 
 			<div class="timeline-block">
				<div class="timeline-img tl-blue">
					<i class="fa fa-video-camera"></i>
				</div>
				<div class="timeline-content">
					<h2 class="page-title"></h2><!-- 글제목 --
					<p class="page-content"></p><!-- 글내용 --
					<a href="#" class="btn btn-default">더 읽기</a>
					<span class="tl-post-date"></span><!-- 게시날짜 --
				</div>
			</div>
 
			<div class="timeline-block">
				<div class="timeline-img tl-pink">
					<i class="fa fa-globe"></i>
				</div>
				<div class="timeline-content">
					<h2 class="page-title"></h2><!-- 글제목 --
					<p class="page-content"></p><!-- 글내용 --
					<a href="#" class="btn btn-default">더 읽기</a>
					<span class="tl-post-date"></span><!-- 게시날짜 --
				</div>
			</div>

			<div class="timeline-block">
				<div class="timeline-img tl-orange">
					<i class="fa fa-picture-o"></i>
				</div>
				<div class="timeline-content">
					<h2 class="page-title"></h2><!-- 글제목 --
					<p class="page-content"></p><!-- 글내용 --
					<a href="#" class="btn btn-default">더 읽기</a>
					<span class="tl-post-date"></span><!-- 게시날짜 --
				</div>
			</div>
			
			<div class="timeline-block">
				<div class="timeline-img tl-orange">
					<i class="fa fa-picture-o"></i>
				</div>
				<div class="timeline-content">
					<h2 class="page-title"></h2><!-- 글제목 --
					<p class="page-content"></p><!-- 글내용 --
					<a href="#" class="btn btn-default">더 읽기</a>
					<span class="tl-post-date"></span><!-- 게시날짜 --
				</div>
			</div>
 -->
          
		</section>
	</div>
	
</section>

