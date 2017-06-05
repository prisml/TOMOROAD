<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script>
	$(document).ready(function(){
		$("#golist").click(function(){
			location.href="${pageContext.request.contextPath}/getBurnList.do";
		});
	});

</script>
		
		<section class="content blog">
				<div class="row">					
						<div class="blog_single">
							<article class="post">								
								<div class="post_date">
									<span class="month">No</span>
									<span class="day"> ${bvo.no} </span>
								</div>
								<div class="post_content">
									<div class="post_meta">
										<h2>
											${bvo.title}
										</h2>
										<div class="metaInfo">
											<span><i class="fa fa-calendar"></i> <a href="#"> ${bvo.postedTime} </a> </span>
											<span><i class="fa fa-user"></i> By <a href="#"> ${bvo.memberId} </a> </span>
											<span><i class="fa fa-tag"></i> <a href="#"> ${bvo.stationName} </a> </span>
											<span><i class="fa fa-comments"></i> <a href="#"> ${bvo.hits} </a></span>
										</div>
									</div>
									<p>
										${bvo.content}
									</p>
								</div>								
							</article>														
						</div>						   				
				</div><!--/.row-->
		</section>


<center>
<br>
<a href="#" id="golist" class="btn btn-sm btn-social-pinterest" style="width: 100px; background-color: #FFD700">LIST</a>
</center>