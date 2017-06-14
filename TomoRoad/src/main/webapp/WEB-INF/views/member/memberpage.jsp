<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
	
	/*스크롤 페이징*/
	var page=1;
	
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
	});
	
	function getList(page){
		alert("함수실행중");
		$.ajax({
			type : 'POST',
			url : "${pageContext.request.contextPath}/review/getListByMemberInMemberPage.do",
			data : {"page" : page,
					"id" : '${memberInfo.id}'
					},
			dataType : 'json',
			success : function(result){
				alert("성공");
				alert(page);
				alert(result.reviewvo.no);
				/*
				var	data = result.rows;
				var html ="";
			
								
				if(page==1){ //페이지가 1일 경우에만 id가 list인 html을 지움
					$("#listzz").html("zzzzzzzzz");
				}
					
				if(result.startNum<=result.totCnt){
					if(data.length>0){ //데이터가 있을 때
						alert("데이터가 있대~~");
					}else{ //데이터가 없을 때
						alert("데이터가 없대~~");
					}
				}
				
				if(page==1){
					$("#listzz").html(html);
				}else{
					$("#listzz").append(html);
				}
				*/
			}
			/* ,//success
		
			error:function(e){
				if(e.status==300)
					alert("데이터 갖고오는데 실패함");
			}
		*/
		
		}); //ajax
	}//function
</script>

<div>
	<ul id="listzz"></ul>
</div>

<section class="super_sub_content row">
        <div class="dividerHeading text-center">
            <h4><span>친구의 타임라인</span></h4>
        </div>

        <div class="col-md-12">
            <section id="timeline" class="timeline-container">
                <div class="timeline-block">
                    <div class="timeline-img tl-green"> <!-- 초록색 그림 -->
                        <i class="fa fa-picture-o"></i>
                    </div>

                    <div class="timeline-content">
                        <h2>글제목</h2>
                        <p>
                            사진+글내용
                        </p>
                        <a href="#" class="btn btn-default">더 읽기</a>
                        <span class="tl-post-date">날짜</span>
                    </div>
                </div>

                <div class="timeline-block">
                    <div class="timeline-img tl-blue">
                        <i class="fa fa-video-camera"></i>
                    </div>

                    <div class="timeline-content">
                        <h2>This title in post blogs</h2>
                        <p>
                            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin faucibus justo a odio cursus faucibus. Vivamus vehicula massa at arcu porta, sed maximus risus molestie. Morbi nec fringilla magna, sit.
                        </p>
                        <a href="#" class="btn btn-default">Read more</a>
                        <span class="tl-post-date">june 8</span>
                    </div>
                </div>

                <div class="timeline-block">
                    <div class="timeline-img tl-pink">
                        <i class="fa fa-globe"></i>
                    </div>

                    <div class="timeline-content">
                        <h2>This title in post blogs</h2>
                        <p>
                            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin faucibus justo a odio cursus faucibus. Vivamus vehicula massa at arcu porta, sed maximus risus molestie. Morbi nec fringilla magna, sit.
                        </p>
                        <a href="#" class="btn btn-default">Read more</a>
                        <span class="tl-post-date">june 12</span>
                    </div>
                </div>

                <div class="timeline-block">
                    <div class="timeline-img tl-orange">
                        <i class="fa fa-picture-o"></i>
                    </div>

                    <div class="timeline-content">
                        <h2>This title in post blogs</h2>
                        <p>
                            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin faucibus justo a odio cursus faucibus. Vivamus vehicula massa at arcu porta, sed maximus risus molestie. Morbi nec fringilla magna, sit.
                        </p>
                        <a href="#" class="btn btn-default">Read more</a>
                        <span class="tl-post-date">june 18</span>
                    </div>
                </div>
                
            </section>
        </div>    
    </section>
