<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script>
	$(document).ready(function(){
		$("#list").click(function(){
			location.href="${pageContext.request.contextPath}/getBurnList.do";
		});
	});

</script>


<section class="wrapper container">
	

        <section id="page_head" class="row">
            <div class="col-lg-12 col-md-12 col-sm-12">
                <div class="page_title">
                    <h2> Burn Board </h2>
                    <span class="sub_heading"> Burn your Passion </span>
                </div>
                <nav id="breadcrumbs">
                    <ul>
                        <li>You are here:</li>
                        <li><a href="home.do">Home</a></li>
                        <li>Burn Board</li>
                    </ul>
                </nav>
            </div>
        </section>
		
		<section class="content blog">
				<div class="row">
					<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
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
				    </div>					
				</div><!--/.row-->
		</section>
</section>

<center>
<br>
<input type="button" value="리스트로 가기" id="list">
</center>