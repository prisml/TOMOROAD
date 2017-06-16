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
		alert("함수실행중");
		$.ajax({
			type : 'POST',
			url : "${pageContext.request.contextPath}/review/getListByMemberInMemberPageAjax.do",
			data : {"page" : page,
					"id" : '${memberInfo.id}'
					},
			success : function(result){
				//alert("성공");
				//alert("페이지:"+page);
				//alert("길이"+result.list.length);
				
				var TimeLine="";
				
				//	$("#content"+${status.index}).append("<div class=timeline-content><h2>"+result.list[i].title+"</h2><p>"+result.list[i].content+"</p><a href=# class='btn btn-defaul'>더 읽기</a><span>"+result.list.postedTime+"</span></div>");
				
				for(var i=0;i<result.pagingBean.endRowNumber;i++){ //리스트의 길이만큼 데이터를 넣는다.
					TimeLine="";
					TimeLine+="<div class=timeline-block>";
					TimeLine+="<div class='timeline-img tl-green'>";
					TimeLine+="<i class='fa fa-picture-o'></i>";
					TimeLine+="</div>";
					TimeLine+="<div class='timeline-content'>";
					TimeLine+="<h2>"+result.list[i].title+"</h2>";
					TimeLine+="<p>"+result.list[i].content+"</p>";
					TimeLine+="<a href='#' class='btn btn-defaul'>더 읽기</a>";
					TimeLine+="<span>"+result.list[i].postedTime+"</span>";
					TimeLine+="</div>";
					TimeLine+="</div>";
					$("#timeline").append(TimeLine);
					//$("#timeline").append("<div class=timeline-block><div class='timeline-img tl-green'><i class='fa fa-picture-o'></i></div><div class='timeline-content'><h2>"+result.list[i].title+"</h2><p>"+result.list[i].content+"</p><a href=# class='btn btn-defaul'>더 읽기</a><span>"+result.list[i].postedTime+"</span></div></div>");
				}	
				
				
				/*					$("#timeline").append("<div class=timeline-block>");
					$("#timeline").append("<div class=timeline-img tl-green><i class=fa fa-picture-o></i></div>");
					$("#timeline").append("<div class=timeline-content><h2>"+result.list[i].title+"</h2><p>"+result.list[i].content+"</p><a href=# class=btn btn-defaul>더 읽기</a><span>"+result.list[i].postedTime+"</span></div>");
					$("#timeline").append("</div>");
					*/
/* 				for(var i=0;i<result.pagingBean.endRowNumber;i++){
					$(".page-title").text(result.list[i].title);
					$(".page-content").text(result.list[i].content);
					$(".tl-post-date").text(result.list[i].postedTime);
				} */
/* 
			 	if(result.pagingBean.startRowNumber<=result.pagingBean.endRowNumber){ //시작번호보다 끝번호가 같거나 더 클 때..시작번호랑 같거나 끝번호랑 같을 떄,
					if(data.length>0){	
				 		for(var i=0;i<result.list.length;i++){ //데이터 길이만큼 돈다. 5 10 11 길이..
								//alert(result.list[i].no);
													
				 				
							 */
								/* var title=$(".timeline-content").html("<h2 class='page-title"+i+">"+result.list[i].title+"</h2>");
								var content=$(".timeline-content").html("<p class='page-content"+i+">"+result.list[i].content+"</p>");
								var date=$(".timeline-content").html("<span class='tl-post-date"+i+">"+result.list[i].postedTime+"</span>");
								
								$(".timeline-content").html("<h2 class=\"page-title"+i+"\">"+result.list[i].title+"</h2>");
								$(".timeline-content").html("<p class=\"page-content"+i+"\">"+result.list[i].content+"</p>");
								$(".timeline-content").html("<a href=\"#\" class=\"btn btn-default\">더 읽기</a>");
								$(".timeline-content").html("<span class=\"tl-post-date"+i+"\">"+result.list[i].postedTime+"</span>"); */
								
	/* 							$(".page-title").text(result.list[i].title);
								$(".page-content").text(result.list[i].content);
								$(".tl-post-date").text(result.list[i].postedTime); 
								
								alert("i"+i);
							
  							if(result.pagingBean.endNum==result.pagingBean.totalCnt){ //지금 도는 번호가 현재 페이지의 마지막 행번호이면 append(다음그룹으로 넘어가야하므로)
	 								$("#timeline-content").append("되냐??");
	 								$("#timeline-content").append("<div class=\"timeline-block\">");
									$("#timeline-content").append("<div class=\"timeline-img tl-green\">");
									$("#timeline-content").append("<i class=\"fa fa-picture-o\"></i>");
									$("#timeline-content").append("</div>");
									$("#timeline-content").append("<div class=\"timeline-content\">");
									$("#timeline-content").append("<h2 class=\"title\"></h2>");
									$("#timeline-content").append("<p class=\"content\"></p>");
									$("#timeline-content").append("<a href=\"#\" class=\"btn btn-default\">더 읽기</a>");
									$("#zz").append("</div>");
									$("#zz").append("</div>");
									
								}
							}//for
					}else{//데이터 없음
						alert("데이터없음");
					}//else
			 	}//if
				 */
			}//success
			/* ,		
			error:function(e){
				if(e.status==300)
					alert("데이터 갖고오는데 실패함");
			} */
		
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
