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
				/* 
				var file[]="";
				
				if(${nameList2!=null}{
					for(var j=0;j<${nameList2.length};j++){ //사진의 갯수만큼 돈다
						file[]+="nameList2[j]";
					}
				} */
				
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
						TimeLine+="<div class='carousel-content>";
						
						/* 이미지가 없을 때는 upload 파일에 사진이 없어. 그러면 안뜨게 해야함.
						이미지가 있으면 특정 리뷰 글번호에 해당하는 사진들을 다 가져와야함.*/
						
						/* if(file!=""){
							for(var j=0;j<${nameList2.length};j++){ //사진의 갯수만큼 돈다
								"file[j]"; 
							TimeLine+="<img src=${pageContext.request.contextPath}/resources/upload/review"+result.list[i].no+"_"+i+" alt=''>";
							TimeLine+="<img src=${pageContext.request.contextPath}/resources/upload/review"+result.list[i].no+"_"+i+" alt=''>";
							TimeLine+="<img src=${pageContext.request.contextPath}/resources/upload/review"+result.list[i].no+"_"+i+" alt=''>";
						} */
							TimeLine+="<img class='carousel-item active' src='${pageContext.request.contextPath}/resources/images/서울역.jpg' alt='' style='display: block;'>";
							TimeLine+="<img class='carousel-item' src='${pageContext.request.contextPath}/resources/images/서울역2.jpg' alt='' style='display: none;'>";
							TimeLine+="<img class='carousel-item' src='${pageContext.request.contextPath}/resources/images/서울역3.jpg' alt='' style='display: none;'>";
						TimeLine+="</div>";	
						//화살표
						
// 						if(count == 0 ){
// 							count++;
						
// 							TimeLine+="<div class='carousel-control'>";
// 								TimeLine+="<div class='carousel-prev'></div>";
// 								TimeLine+="<div class='carousel-next'></div>";
// 								TimeLine+="<ul class='carousel-pagination'>";
// 									TimeLine+="<li class='active'></li>";
// 									TimeLine+="<li class=''></li>";
// 									TimeLine+="<li class=''></li>";
// 								TimeLine+="</ul>";
// 							TimeLine+="</div>";
// 						}
						
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
				
				$.fn.carousel = function(op) {
					var op, ui = {};
					op = $.extend({
						speed: 500,
						autoChange: false,
						interval: 5000
					}, op);
					ui.carousel = this;
					ui.items    = ui.carousel.find('.carousel-item');
					ui.itemsLen = ui.items.length;

					// CREATE CONTROLS
					ui.ctrl 	= $('<div />', {'class': 'carousel-control'});
					ui.prev 	= $('<div />', {'class': 'carousel-prev'});
					ui.next 	= $('<div />', {'class': 'carousel-next'});
					ui.pagList  = $('<ul />', {'class': 'carousel-pagination'});
					ui.pagItem  = $('<li></li>');
					for (var i = 0; i < ui.itemsLen; i++) {
						ui.pagItem.clone().appendTo(ui.pagList);
					}
					ui.prev.appendTo(ui.ctrl);
					ui.next.appendTo(ui.ctrl);
					ui.pagList.appendTo(ui.ctrl);
					ui.ctrl.appendTo(ui.carousel);
					ui.carousel.find('.carousel-pagination li').eq(0).addClass('active');
					ui.carousel.find('.carousel-item').each(function() {
						$(this).hide();
					});
					ui.carousel.find('.carousel-item').eq(0).show().addClass('active');
					
					
					// CHANGE ITEM
					var changeImage = function(direction, context) {
						var current = ui.carousel.find('.carousel-item.active');

						if (direction == 'index') {
							if(current.index() === context.index())
								return false;

							context.addClass('active').siblings().removeClass('active');

							ui.items.eq(context.index()).addClass('current').fadeIn(op.speed, function() {
								current.removeClass('active').hide();
								$(this).addClass('active').removeClass('current');
							});
						} 

						if (direction == 'prev') {
							if (current.index() == 0) {
								ui.carousel.find('.carousel-item:last').addClass('current').fadeIn(op.speed, function() {
									current.removeClass('active').hide();
									$(this).addClass('active').removeClass('current');
								});
							}
							else {
								current.prev().addClass('current').fadeIn(op.speed, function() {
									current.removeClass('active').hide();
									$(this).addClass('active').removeClass('current');
								});
							}
						}

						if (direction == undefined) {
							if (current.index() == ui.itemsLen - 1) {
								ui.carousel.find('.carousel-item:first').addClass('current').fadeIn(300, function() {
									current.removeClass('active').hide();
									$(this).addClass('active').removeClass('current');
								});
							}
							else {
								current.next().addClass('current').fadeIn(300, function() {
									current.removeClass('active').hide();
									$(this).addClass('active').removeClass('current');
								});
							}
						}
						ui.carousel.find('.carousel-pagination li').eq( ui.carousel.find('.carousel-item.current').index() ).addClass('active').siblings().removeClass('active');
					};

					ui.carousel
						.on('click', 'li', function() {
							changeImage('index', $(this));
						})
						.on('click', '.carousel-prev', function() {
							changeImage('prev');
						})
						.on('click', '.carousel-next', function() {
							changeImage();
						});
					
					// AUTO CHANGE
					/*
					if (op.autoChange) {
						var changeInterval = setInterval(changeImage, op.interval);
						ui.carousel
							.on('mouseenter', function() {
								clearInterval(changeInterval);
							})
							.on('mouseleave', function() {
								changeInterval = setInterval(changeImage, op.interval);
							});
					}
					*/
					return this;
				};
				
				$('.porDetCarousel').each(function() {
					$(this).carousel({
						autoChange: false
					});
				});
			}//success
		}); //ajax
	}//function
</script>

<section class="super_sub_content row">

	<div class="dividerHeading text-center">
		<h4>
			<span>친구의 타임라인</span>
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

