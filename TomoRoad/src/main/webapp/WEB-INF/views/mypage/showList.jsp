<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script type="text/javascript">
	$(document).ready(function(){
		$("#emptyBox").show();
		$("#showTimeline").hide();
		
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
		
	function getList(page){
		$.ajax({
			type : 'POST',
			url : "${pageContext.request.contextPath}/review/getListByMemberInMemberPage.do",
			data : {"page" : page,
					"id" : '${sessionScope.mvo.id}'
					},
			success : function(result){
				if(result.list.length!=0){
					$("#emptyBox").hide();
					$("#showTimeline").show();
				}
					var TimeLine="";
					
					for(var i=0;i<result.pagingBean.endRowNumber;i++){ //리스트의 길이만큼 데이터를 넣는다.
						TimeLine="";
						TimeLine+="<div class=timeline-block>";
						
						if(result.list[i].imgCount==0){
							TimeLine+="<div class='timeline-img tl-blue'>";
							TimeLine+="<i class='fa fa-pencil-square-o'></i>";
						}else{
							TimeLine+="<div class='timeline-img tl-pink'>";
							TimeLine+="<i class='fa fa-camera'></i>";
						}
						
						TimeLine+="</div>";
						TimeLine+="<div class='timeline-content'>";
						TimeLine+="<h2>"+result.list[i].title+"</h2>";
						
						//리뷰에 사진이 있다면 해당 글 번호에 해당하는 리뷰글 사진을 갖고옴
						if(result.list[i].imgCount!=0){
							//사진슬라이드 영역
							TimeLine+="<div class='porDetCarousel'>";
							//사진
							TimeLine+="<div class='carousel-content'>";
							
							for(var j=0;j<result.list[i].imgCount;j++){ //사진의 갯수만큼 돈다
								TimeLine+="<img class='carousel-item active' src='${pageContext.request.contextPath}/resources/upload/review"+result.list[i].no+"_"+j+"' style=display: block;>";
							}
							
							TimeLine+="</div>";	
							TimeLine+="</div>";	
						}//if
							
						
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
					}//for문	
			}//success
		}); //ajax
		
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
			
			return this;
		};
		
		$('.porDetCarousel').each(function() {
			$(this).carousel({
				autoChange: false
			});
		});//each

	}//function getList
});//ready
</script>

<section class="super_sub_content row" id="showTimeline">
	<div class="col-md-12">
		<section class='timeline-container' id="timeline">
		</section>
	</div>
</section>

<div class="serviceBox_6 same-height"style="height: 300px;margin-left: 90px; background: #FFFFFF;" id="emptyBox">
    <div class="service-content">
	        <h3 style="text-align: center;color: #191919;">아직 등록된 리뷰가 없어요!</h3>
	        <p style="font-family: initial;text-align: center;font-size: 20px;color: #191919;">얼른 리뷰를 등록해서 TomoRoader들과 여행의 기쁨을 나눠주세요^-^</p>
    </div>
</div>



