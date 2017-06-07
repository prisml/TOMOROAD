<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- ${param.id}-->

<%-- 
	<!-- 사진영역 -->
	<div class="col-lg-12 col-md-12 col-sm-12">
		<div class="porDetCarousel">
		
			<!--사진-->
			<div class="carousel-content">
				<img class="carousel-item" src="${pageContext.request.contextPath}/resources/images/서울역.jpg" alt="" style="display: none;">
				<img class="carousel-item active" src="${pageContext.request.contextPath}/resources/images/서울역2.jpg"	alt="" style="display: block;">
				<img class="carousel-item" src="${pageContext.request.contextPath}/resources/images/서울역3.jpg" alt="" style="display: none;">
			</div>
			
			<!-- 화살표 -->
			<div class="carousel-control">
				<div class="carousel-prev"></div>
				<div class="carousel-next"></div>
				<ul class="carousel-pagination"><!-- 아래에 바(어떤 사진으로 하느냐에 따라 active가 바뀜 -->
					<li class=""></li>
					<li class="active"></li>
					<li class=""></li>
				</ul>
			</div>
			
		</div>
	</div>
 --%>
 
<!-- 게시판 설명 시작(가로전체)-->
<div class="row sub_content">
	<!-- 게시판 글만 딱 써있는 부분 -->
	<div class="col-lg-8 col-md-8 col-sm-8">
		<div class="project_description">
			<div class="widget_title"><!-- 제목 -->
				<h4>
					<span>${detailInfoVO.name}</span>
				</h4>
			</div>
			
			<!-- 설명 -->
			<p>${detailInfoVO.detail}</p>		
		</div>
	</div>
</div>
<!-- 끝 -->

<%-- 
<!-- 사진2 리스트 시작-->
<section class="latest_work row sub_content">
	<div class="col-md-12">
		<div class="dividerHeading">
			<h4>
				<span>Recent Work</span>
			</h4>
		</div>
		
나중에 여긴 반복문
		<div id="recent-work-slider" class="owl-carousel">
			<div class="box">
				<figure class="touching effect-bubba">
					<img src="${pageContext.request.contextPath}/resources/images/서울역.jpg" alt="" class="img-responsive">

					<div class="option">
						<a href="portfolio_single.html" class="fa fa-link"></a>
						<a href="${pageContext.request.contextPath}/resources/images/서울역.jpg" class="fa fa-search mfp-image"></a>
					</div>
					
					<figcaption class="item-description">
						<h5>Touch and Swipe</h5>
						<p>Technology</p>
					</figcaption>
				</figure>
			</div>

			<div class="box">
				<figure class="touching effect-bubba">
					<img src="${pageContext.request.contextPath}/resources/images/서울역2.jpg" alt="" class="img-responsive">

					<div class="option">
						<a href="portfolio_single.html" class="fa fa-link"></a>
						<a href="${pageContext.request.contextPath}/resources/images/서울역2.jpg" class="fa fa-search mfp-image"></a>
					</div>
					
					<figcaption class="item-description">
						<h5>fully responsive</h5>
						<p>Mobile</p>
					</figcaption>
				</figure>
			</div>

			<div class="box">
				<figure class="touching effect-bubba">
					<img src="${pageContext.request.contextPath}/resources/images/서울역3.jpg" alt="" class="img-responsive">

					<div class="option">
						<a href="portfolio_single.html" class="fa fa-link"></a>
						<a href="${pageContext.request.contextPath}/resources/images/서울역3.jpg" class="fa fa-search mfp-image"></a>
					</div>
					
					<figcaption class="item-description">
						<h5>Retina Ready</h5>
						<p>Responsive</p>
					</figcaption>
					
				</figure>
			</div>

			<div class="box">
				<figure class="touching effect-bubba">
					<img src="${pageContext.request.contextPath}/resources/images/서울역.jpg" alt="" class="img-responsive">

					<div class="option">
						<a href="portfolio_single.html" class="fa fa-link"></a>
						<a href="${pageContext.request.contextPath}/resources/images/서울역.jpg" class="fa fa-search mfp-image"></a>
					</div>
					
					<figcaption class="item-description">
						<h5>Boxed Layout</h5>
						<p>Branding</p>
					</figcaption>
					
				</figure>
			</div>

			<div class="box">
				<figure class="touching effect-bubba">
					<img src="${pageContext.request.contextPath}/resources/images/서울역2.jpg" alt="" class="img-responsive">

					<div class="option">
						<a href="portfolio_single.html" class="fa fa-link"></a>
						<a href="${pageContext.request.contextPath}/resources/images/서울역2.jpg" class="fa fa-search mfp-image"></a>
					</div>
					
					<figcaption class="item-description">
						<h5>Touch and Swipe</h5>
						<p>Technology</p>
					</figcaption>
					
				</figure>
			</div>

			<div class="box">
				<figure class="touching effect-bubba">
					<img src="${pageContext.request.contextPath}/resources/images/서울역3.jpg" alt="" class="img-responsive">

					<div class="option">
						<a href="portfolio_single.html" class="fa fa-link"></a>
						<a href="${pageContext.request.contextPath}/resources/images/서울역3.jpg" class="fa fa-search mfp-image"></a>
					</div>
					
					<figcaption class="item-description">
						<h5>fully responsive</h5>
						<p>Mobile</p>
					</figcaption>
					
				</figure>
			</div>

			<div class="box">
				<figure class="touching effect-bubba">
					<img src="${pageContext.request.contextPath}/resources/images/서울역.jpg" alt="" class="img-responsive">

					<div class="option">
						<a href="portfolio_single.html" class="fa fa-link"></a>
						<a href="${pageContext.request.contextPath}/resources/images/서울역.jpg" class="fa fa-search mfp-image"></a>
					</div>
					
					<figcaption class="item-description">
						<h5>Retina Ready</h5>
						<p>Responsive</p>
					</figcaption>
					
				</figure>
			</div>

			<div class="box">
				<figure class="touching effect-bubba">
					<img src="${pageContext.request.contextPath}/resources/images/서울역2.jpg" alt="" class="img-responsive">

					<div class="option">
						<a href="portfolio_single.html" class="fa fa-link"></a>
						<a href="${pageContext.request.contextPath}/resources/images/서울역2.jpg" class="fa fa-search mfp-image"></a>
					</div>
					
					<figcaption class="item-description">
						<h5>Boxed Layout</h5>
						<p>Branding</p>
					</figcaption>
					
				</figure>
			</div>
		</div>
	</div>
</section>
<!-- 사진리스트2 끝 -->
 --%>